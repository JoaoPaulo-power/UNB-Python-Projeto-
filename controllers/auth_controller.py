from bottle import Bottle, request, redirect
from .base_controller import BaseController
from services.auth_service import AuthService

class AuthController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.auth_service = AuthService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/login', method=['GET', 'POST'], callback=self.login)
        self.app.route('/logout', method='POST', callback=self.logout)
        self.app.route('/register', method=['GET', 'POST'], callback=self.register)
        self.app.route('/dashboard', method='GET', callback=self.dashboard)
        self.app.route('/home', method='GET', callback=self.home_page)
        self.app.route('/', methoed='GET', callback=lambda: redirect('/home'))

    def home_page(self):
        return self.render('home')
        
    def home_cliente(self):
        return self.render('cliente_home',cliente=None)

    
    def login(self):
        if request.method == 'GET':
            if self.auth_service.is_logged_in():
                return self.redirect('/dashboard')
            return self.render('login', error=None)
        
        else: 
            username = request.forms.get('username')
            password = request.forms.get('password')
            
            user = self.auth_service.login(username, password)
            if user: 
                role=int(user.role)
                if role == 0:
                    return self.redirect('/admim/home')
                elif role == 1:
                    return self.redirect(f'/funcionarios/add/{user.id}')
                elif role == 2:
                    return self.redirect(f'/clientes/add/{user.id}')
            else:
                return self.render('login', error='Credenciais inválidas') 

    def logout(self):
        
        self.auth_service.logout()
        return self.redirect('/login')

    def register(self):
        
        if request.method == 'GET':
            return self.render('register', error=None, success=None)
        
        else: 
            username = request.forms.get('username')
            email = request.forms.get('email')
            password = request.forms.get('password')
            confirm_password = request.forms.get('confirm_password')
            role = request.forms.get('role')
            
            if password != confirm_password:
                return self.render('register', error='Senhas não coincidem', success=None)
            
            success, message = self.auth_service.register_user(username, email, password, role)
            if success:
                return self.render('register', error=None, success=message)
            else:
                return self.render('register', error=message, success=None)

    def dashboard(self):
    
        user = self.auth_service.get_current_user()
        if not user:
            return self.redirect('/login')
        
        return self.render('dashboard', user=user)


auth_routes = Bottle()
auth_controller = AuthController(auth_routes)