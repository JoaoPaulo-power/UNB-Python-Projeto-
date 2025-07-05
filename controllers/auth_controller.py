from bottle import Bottle, request, redirect
from .base_controller import BaseController
from services.auth_service import AuthService

class AuthController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.auth_service = AuthService()
        self.setup_routes()

    def setup_routes(self):
        """Define rotas de autenticação"""
        self.app.route('/login', method=['GET', 'POST'], callback=self.login)
        self.app.route('/logout', method='POST', callback=self.logout)
        self.app.route('/register', method=['GET', 'POST'], callback=self.register)
        self.app.route('/dashboard', method='GET', callback=self.dashboard)

    def login(self):
        """Página e processo de login"""
        if request.method == 'GET':
            if self.auth_service.is_logged_in():
                return self.redirect('/dashboard')
            return self.render('login', error=None)
        
        else: 
            username = request.forms.get('username')
            password = request.forms.get('password')
            
            user = self.auth_service.login(username, password)
            if user:
                return self.redirect('/dashboard')
            else:
                return self.render('login', error='Credenciais inválidas')

    def logout(self):
        """Processo de logout"""
        self.auth_service.logout()
        return self.redirect('/login')

    def register(self):
        """Página e processo de registro"""
        if request.method == 'GET':
            return self.render('register', error=None, success=None)
        
        else: 
            username = request.forms.get('username')
            email = request.forms.get('email')
            password = request.forms.get('password')
            confirm_password = request.forms.get('confirm_password')
            
            if password != confirm_password:
                return self.render('register', error='Senhas não coincidem', success=None)
            
            success, message = self.auth_service.register_user(username, email, password)
            if success:
                return self.render('register', error=None, success=message)
            else:
                return self.render('register', error=message, success=None)

    def dashboard(self):
        """Página principal após login"""
        user = self.auth_service.get_current_user()
        if not user:
            return self.redirect('/login')
        
        return self.render('dashboard', user=user)


auth_routes = Bottle()
auth_controller = AuthController(auth_routes)