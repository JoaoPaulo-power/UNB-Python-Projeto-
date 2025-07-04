from bottle import request, response
from models.auth_user import AuthUserModel
import re

class AuthService:
    def __init__(self):
        self.auth_model = AuthUserModel()
    
    def register_user(self):
        """Registra um novo usuário"""
        username = request.forms.get('username', '').strip()
        email = request.forms.get('email', '').strip()
        password = request.forms.get('password', '')
        confirm_password = request.forms.get('confirm_password', '')
        
        # Validações
        errors = []
        
        if not username or len(username) < 3:
            errors.append("Nome de usuário deve ter pelo menos 3 caracteres")
        
        if not self._is_valid_email(email):
            errors.append("Email inválido")
        
        if len(password) < 6:
            errors.append("Senha deve ter pelo menos 6 caracteres")
        
        if password != confirm_password:
            errors.append("Senhas não conferem")
        
        if errors:
            return {'success': False, 'errors': errors}
        
        try:
            user = self.auth_model.create_user(username, email, password)
            return {'success': True, 'user': user}
        except ValueError as e:
            return {'success': False, 'errors': [str(e)]}
    
    def login_user(self):
        """Autentica e loga um usuário"""
        username = request.forms.get('username', '').strip()
        password = request.forms.get('password', '')
        
        if not username or not password:
            return {'success': False, 'error': 'Username e senha são obrigatórios'}
        
        user = self.auth_model.authenticate(username, password)
        
        if user:
            # Criar sessão
            session_token = self.auth_model.create_session(user.id)
            
            # Definir cookie de sessão
            response.set_cookie('session_token', session_token, 
                              max_age=24*60*60, httponly=True, secure=False)
            
            return {'success': True, 'user': user}
        else:
            return {'success': False, 'error': 'Credenciais inválidas'}
    
    def logout_user(self):
        """Desloga o usuário"""
        session_token = request.get_cookie('session_token')
        if session_token:
            self.auth_model.delete_session(session_token)
        
        response.delete_cookie('session_token')
        return {'success': True}
    
    def get_current_user(self):
        """Retorna o usuário atual baseado na sessão"""
        session_token = request.get_cookie('session_token')
        if session_token:
            return self.auth_model.get_user_by_session(session_token)
        return None
    
    def _is_valid_email(self, email):
        """Valida formato do email"""
        pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        return re.match(pattern, email) is not None