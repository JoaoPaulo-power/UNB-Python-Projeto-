from bottle import Bottle, request
from .base_controller import BaseController
from services.user_service import UserService
from services.auth_service import AuthService

class UserController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        # Inicializa serviços primeiro
        self.user_service = UserService()
        self.auth_service = AuthService()
        # Depois configura as rotas
        self.setup_routes()

    def setup_routes(self):
        # Protege todas as rotas de usuário
        self.app.route('/users', method='GET', 
                      callback=self.auth_service.require_login(self.list_users))
        self.app.route('/users/add', method=['GET', 'POST'], 
                      callback=self.auth_service.require_login(self.add_user))
        self.app.route('/users/edit/<user_id:int>', method=['GET', 'POST'], 
                      callback=self.auth_service.require_login(self.edit_user))
        self.app.route('/users/delete/<user_id:int>', method='POST', 
                      callback=self.auth_service.require_login(self.delete_user))

    def list_users(self):
        users = self.user_service.get_all()
        return self.render('users', users=users)

    def add_user(self):
        if request.method == 'GET':
            return self.render('user_form', user=None, action="/users/add")
        else:
            # POST - salvar usuário
            self.user_service.save()
            return self.redirect('/users')

    def edit_user(self, user_id):
        user = self.user_service.get_by_id(user_id)
        if not user:
            return "Usuário não encontrado"

        if request.method == 'GET':
            return self.render('user_form', user=user, action=f"/users/edit/{user_id}")
        else:
            # POST - salvar edição
            self.user_service.edit_user(user)
            return self.redirect('/users')

    def delete_user(self, user_id):
        self.user_service.delete_user(user_id)
        return self.redirect('/users')

user_routes = Bottle()
user_controller = UserController(user_routes)
