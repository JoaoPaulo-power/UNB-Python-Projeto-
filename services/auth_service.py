from bottle import request, response
from models.auth_user import AuthUserModel, AuthUser
import secrets

class AuthService:
    def __init__(self):
        self.auth_model = AuthUserModel()
        self.session_key = 'user_session'

    def login(self, username, password):
        
        user = self.auth_model.authenticate(username, password)
        if user:
            
            session_token = secrets.token_hex(16)
            response.set_cookie(self.session_key, f"{user.id}:{session_token}", 
                              max_age=3600, httponly=True)  # 1 hora
            return user
        return None

    def logout(self):
        
        response.delete_cookie(self.session_key)

    def get_current_user(self):
        """Sessão"""
        session_cookie = request.get_cookie(self.session_key)
        if session_cookie:
            try:
                user_id, token = session_cookie.split(':')
                return self.auth_model.get_by_id(int(user_id))
            except (ValueError, TypeError):
                return None
        return None

    def is_logged_in(self):
        
        return self.get_current_user() is not None

    def register_user(self, username, email, password,role):
        
        if not username or not email or not password or not role:
            return False, "Todos os campos são obrigatórios"
        
        if len(password) < 6:
            return False, "Senha deve ter pelo menos 6 caracteres"
        
        if self.auth_model.username_exists(username):
            return False, "Username já está em uso"
        
        if self.auth_model.email_exists(email):
            return False, "Email já está em uso"

        
        last_id = max([u.id for u in self.auth_model.get_all()], default=0)
        new_user = AuthUser(
            id=last_id + 1,
            username=username,
            email=email,
            password_hash=AuthUser.hash_password(password),
            role=role
            
        )
        
        self.auth_model.add_user(new_user)
        return True, "Usuário registrado com sucesso"

    def require_login(self, callback):
        
        def wrapper(*args, **kwargs):
            if not self.is_logged_in():
                from bottle import redirect
                return redirect('/login')
            return callback(*args, **kwargs)
        return wrapper
    
    def get_by_id(self,id_user):
        user=self.auth_model.get_by_id(id_user)
        return user
        