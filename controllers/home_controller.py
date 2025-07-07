from bottle import Bottle
from .base_controller import BaseController
from services.auth_service import AuthService

class HomeController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.auth_service = AuthService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/home', method='GET', callback=self.home)
        self.app.route('/', method='GET', callback=self.home_redirect)

    def home(self):
        user = self.auth_service.get_current_user()
        if not user:
            return self.redirect('/login')
            
        role = int(user.role)
        
        if role == 0:
            return self.render('admin_home', user=user)
        elif role == 1:
            return self.redirect(f'/funcionario/home/{user.id}')
        elif role == 2:
            return self.redirect(f'/clientes/home/{user.id}')
        else:
            return self.redirect('/login')

    def home_redirect(self):
        return self.redirect('/home')

home_routes = Bottle()
home_controller = HomeController(home_routes)