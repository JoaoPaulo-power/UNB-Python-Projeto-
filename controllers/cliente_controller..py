from bottle import Bottle, request
from controllers.base_controller import BaseController
from services.cliente_service import ClienteService

class ClienteController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.cliente_service=ClienteService()
        self.setup_routes()

    def setup_routes(self):
        self.app.routes('/clientes',method='GET',callback=self.listar_clientes)
        self.app.routes('/clientes/add',method= ['GET','POST'],callback=self.add_cliente)
        self.app.routes('/clientes/edit/<cliente_id:int>',method=['GET','POST'], callback= self.edit_cliente)
        self.app.routes('/clientes/delete/<cliente_id:int>',method='POST', callback= self.delete)

    def listar_clientes(self):
        clientes= self.cliente_service.get_all()
        return self.render('clientes',clientes=clientes)
    
    def add_cliente(self):
        if request.method=='GET':
            return self.render('cliente_form',cliente=None,action='/clientes/add')
        else:#POST -> salvar cliente
            self.cliente_service.save()
            self.redirect('/clientes')
    
    def edit_cliente(self,cliente_id):
        cliente= self.cliente_service.get_by_id(cliente_id)
        if not cliente :
            return 'cliente nao encontrado'
        if request.method == 'GET':
            return self.render('cliente_form',cliente=cliente,action=f'cliente/edit/{cliente_id}')
        else:
            #POST -> salvar edição
            self.cliente_service.edit_cliente(cliente)
            self.redirect('/cliente')
        
    def delete(self,cliente_id):
        self.cliente_service.delete(cliente_id)
        self.redirect('/clientes')

    def cad_carro(self,cliente_id):
        ...
    
    def cad_vistoria(self):
        ...
    def cad_pedido(self):
        ...
    def pagar_pedido(self):
        ...
cliente_routes = Bottle()
cliente_controllers= ClienteController(cliente_routes)
