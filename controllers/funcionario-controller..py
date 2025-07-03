from bottle import Bottle, request
from controllers.base_controller import BaseController
from services.cliente_service import ClienteService

class FuncionarioController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.cliente_service=ClienteService()
        self.setup_routes

    def setup_routes(self):
        self.app.routes('/funcionarios',method='GET',callback=self.listar_clientes)

    def listar_clientes(self):
        clientes= self.cliente_service.get_all()