from bottle import Bottle, request
from .base_controller import BaseController
from services.auth_service import AuthService

class AuthController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.auth_service = AuthService()
        self.setup_routes()
    
    def setup_routes(self):
        """Define as rotas de autenticação"""
        self.app.route('/login', method=['GET', 'POST'], callback=self.login)
        self.app.route('/register', method=['GET', 'POST'], callback=self.register)
        self.app.route('/logout', method='POST', callback=self.logout)
        self.app.route('/dashboard', method='GET', callback=self.dashboard)
    
    def login(self):
        """Página e processamento de login"""
        if request.method == 'GET':
            current_user = self.auth_service.get_current_user()
            if current_user:
                return self.redirect('/dashboard')
            
            return self.render('auth/login')
        
        else:  # POST
            result = self.auth_service.login_user()
            
            if result['success']:
                return self.redirect('/dashboard')
            else:
                return self.render('auth/login', error=result['error'])
    
    def register(self):
        """Página e processamento de registro"""
        if request.method == 'GET':
            return self.render('auth/register')
        
        else: 
            result = self.auth_service.register_user()
            
            if result['success']:
                return self.render('auth/login', 
                                 success="Conta criada com sucesso! Faça seu login.")
            else:
                return self.render('auth/register', errors=result['errors'])
    
    def logout(self):
        """Processamento de logout"""
        self.auth_service.logout_user()
        return self.redirect('/login')
    
    def dashboard(self):
        """Página do dashboard (área logada)"""
        current_user = self.auth_service.get_current_user()
        
        if not current_user:
            return self.redirect('/login')
        
        return self.render('dashboard', user=current_user)
    
auth_routes = Bottle()
auth_controller = AuthController(auth_routes)