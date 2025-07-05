import json
import os
import hashlib
from datetime import datetime

DATA_DIR = os.path.join(os.path.dirname(__file__), '..', 'data')

class AuthUser:
    def __init__(self, id, username, email, password_hash, created_at=None, is_active=True):
        self.id = id
        self.username = username
        self.email = email
        self.password_hash = password_hash
        self.created_at = created_at or datetime.now().isoformat()
        self.is_active = is_active

    def __repr__(self):
        return f"AuthUser(id={self.id}, username='{self.username}', email='{self.email}')"

    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
            'password_hash': self.password_hash,
            'created_at': self.created_at,
            'is_active': self.is_active
        }

    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            username=data['username'],
            email=data['email'],
            password_hash=data['password_hash'],
            created_at=data.get('created_at'),
            is_active=data.get('is_active', True)
        )

    @staticmethod
    def hash_password(password):
        """Gera hash da senha usando SHA-256"""
        return hashlib.sha256(password.encode()).hexdigest()

    def verify_password(self, password):
        """Verifica se a senha está correta"""
        return self.password_hash == self.hash_password(password)


class AuthUserModel:
    FILE_PATH = os.path.join(DATA_DIR, 'auth_users.json')

    def __init__(self):
        self.users = self._load()

    def _load(self):
        """Carrega usuários do arquivo JSON"""
        if not os.path.exists(self.FILE_PATH):
            # Cria o arquivo com usuário admin padrão
            self._create_default_admin()
            return self._load()
        
        try:
            with open(self.FILE_PATH, 'r', encoding='utf-8') as f:
                data = json.load(f)
                return [AuthUser.from_dict(item) for item in data]
        except (json.JSONDecodeError, FileNotFoundError):
            return []

    def _save(self):
        """Salva usuários no arquivo JSON"""
        os.makedirs(os.path.dirname(self.FILE_PATH), exist_ok=True)
        with open(self.FILE_PATH, 'w', encoding='utf-8') as f:
            json.dump([u.to_dict() for u in self.users], f, indent=4, ensure_ascii=False)

    def _create_default_admin(self):
        """Cria usuário admin padrão"""
        admin_user = AuthUser(
            id=1,
            username='admin',
            email='admin@sistema.com',
            password_hash=AuthUser.hash_password('admin123')
        )
        self.users = [admin_user]
        self._save()

    def get_all(self):
        """Retorna todos os usuários"""
        return self.users

    def get_by_id(self, user_id):
        """Busca usuário por ID"""
        return next((u for u in self.users if u.id == user_id), None)

    def get_by_username(self, username):
        """Busca usuário por username"""
        return next((u for u in self.users if u.username == username), None)

    def get_by_email(self, email):
        """Busca usuário por email"""
        return next((u for u in self.users if u.email == email), None)

    def username_exists(self, username):
        """Verifica se username já existe"""
        return self.get_by_username(username) is not None

    def email_exists(self, email):
        """Verifica se email já existe"""
        return self.get_by_email(email) is not None

    def add_user(self, user):
        """Adiciona novo usuário"""
        self.users.append(user)
        self._save()

    def update_user(self, updated_user):
        """Atualiza usuário existente"""
        for i, user in enumerate(self.users):
            if user.id == updated_user.id:
                self.users[i] = updated_user
                self._save()
                break

    def delete_user(self, user_id):
        """Remove usuário"""
        self.users = [u for u in self.users if u.id != user_id]
        self._save()

    def authenticate(self, username, password):
        """Autentica usuário"""
        user = self.get_by_username(username)
        if user and user.is_active and user.verify_password(password):
            return user
        return None