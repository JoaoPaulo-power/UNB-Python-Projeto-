import sqlite3
import bcrypt
import secrets
from datetime import datetime, timedelta
from database.database import db

class AuthUser:
    def __init__(self, id=None, username=None, email=None, password_hash=None, 
                 created_at=None, is_active=True):
        self.id = id
        self.username = username
        self.email = email
        self.password_hash = password_hash
        self.created_at = created_at
        self.is_active = is_active
    
    def set_password(self, password):
        """Criptografa e define a senha do usuário"""
        salt = bcrypt.gensalt()
        self.password_hash = bcrypt.hashpw(password.encode('utf-8'), salt).decode('utf-8')
    
    def check_password(self, password):
        """Verifica se a senha fornecida está correta"""
        return bcrypt.checkpw(password.encode('utf-8'), self.password_hash.encode('utf-8'))
    
    @classmethod
    def from_dict(cls, data):
        return cls(**data)
    
    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
            'created_at': self.created_at,
            'is_active': self.is_active
        }

class AuthUserModel:
    def __init__(self):
        self.db = db
    
    def create_user(self, username, email, password):
        """Cria um novo usuário"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        try:
            user = AuthUser(username=username, email=email)
            user.set_password(password)
            
            cursor.execute('''
                INSERT INTO auth_users (username, email, password_hash)
                VALUES (?, ?, ?)
            ''', (user.username, user.email, user.password_hash))
            
            user.id = cursor.lastrowid
            conn.commit()
            return user
            
        except sqlite3.IntegrityError as e:
            if 'username' in str(e):
                raise ValueError("Nome de usuário já existe")
            elif 'email' in str(e):
                raise ValueError("Email já cadastrado")
            else:
                raise ValueError("Erro ao criar usuário")
        finally:
            conn.close()
    
    def get_by_username(self, username):
        """Busca usuário pelo nome de usuário"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute('''
            SELECT id, username, email, password_hash, created_at, is_active
            FROM auth_users WHERE username = ? AND is_active = 1
        ''', (username,))
        
        row = cursor.fetchone()
        conn.close()
        
        if row:
            return AuthUser(*row)
        return None
    
    def get_by_email(self, email):
        """Busca usuário pelo email"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute('''
            SELECT id, username, email, password_hash, created_at, is_active
            FROM auth_users WHERE email = ? AND is_active = 1
        ''', (email,))
        
        row = cursor.fetchone()
        conn.close()
        
        if row:
            return AuthUser(*row)
        return None
    
    def get_by_id(self, user_id):
        """Busca usuário pelo ID"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute('''
            SELECT id, username, email, password_hash, created_at, is_active
            FROM auth_users WHERE id = ? AND is_active = 1
        ''', (user_id,))
        
        row = cursor.fetchone()
        conn.close()
        
        if row:
            return AuthUser(*row)
        return None
    
    def authenticate(self, username, password):
        """Autentica um usuário"""
        user = self.get_by_username(username)
        if user and user.check_password(password):
            return user
        return None
    
    def create_session(self, user_id):
        """Cria uma sessão para o usuário"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        session_token = secrets.token_urlsafe(32)
        expires_at = datetime.now() + timedelta(hours=24)
        
        cursor.execute('''
            INSERT INTO user_sessions (user_id, session_token, expires_at)
            VALUES (?, ?, ?)
        ''', (user_id, session_token, expires_at))
        
        conn.commit()
        conn.close()
        
        return session_token
    
    def get_user_by_session(self, session_token):
        """Busca usuário pela sessão"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute('''
            SELECT u.id, u.username, u.email, u.password_hash, u.created_at, u.is_active
            FROM auth_users u
            JOIN user_sessions s ON u.id = s.user_id
            WHERE s.session_token = ? AND s.expires_at > CURRENT_TIMESTAMP
        ''', (session_token,))
        
        row = cursor.fetchone()
        conn.close()
        
        if row:
            return AuthUser(*row)
        return None
    
    def delete_session(self, session_token):
        """Remove uma sessão (logout)"""
        conn = self.db.get_connection()
        cursor = conn.cursor()
        
        cursor.execute('DELETE FROM user_sessions WHERE session_token = ?', (session_token,))
        conn.commit()
        conn.close()