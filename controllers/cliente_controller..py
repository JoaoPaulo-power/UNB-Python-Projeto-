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
        cliente=self.cliente_service.get_by_id(cliente_id)
        self.cliente_service.cad_carro(cliente_id)
        self.render('carro_form',cliente=cliente,action=f'/clientes/cad_carro/{cliente_id}')
        self.redirect('/clientes/carros')
    
    def cad_vistoria(self,cliente_id):
        self.cliente_service.cad_vist(cliente_id)
        cliente=self.cliente_service.get_by_id(cliente_id)
        self.render('vistoria_form',cliente=cliente,action=f'/clientes/cad_vist/{cliente_id}')
        self.redirect('/clientes/vistorias/')
        
    def cad_pedido(self,id_cliente):
        cliente=self.cliente_service.get_by_id(id_cliente)
        self.cliente_service.cad_pedido(id_cliente)
        self.render('pedido_form',cliente=cliente,action=f'/clientes/cad_pedido/{id_cliente}')
        self.redirect('/clientes/pedidos')

    def pagar_pedido(self,cliente_id):
        self.cliente_service.pagar_pedido(cliente_id)
        self.cliente_service.cad_pedido(cliente_id)
        self.redirect('/clientes')
        
    def listar_carros(self,id_cliente):#tem como eu interpretar essa lista aqui ??
        cliente=self.cliente_service.get_by_id(id_cliente)
        lista_carros=self.cliente_service.listar_carros(id_cliente)#retorna uma lista com todos carros em forma de objeto
        self.render('vistorias',cliente=cliente,action=f'/clientes/vistorias/{id_cliente}')

    def listar_vistorias(self,id_cliente):

        ...
    def listar_pedidos(self,id_cliente):
        ...

    
    """metodo pra mostras os carros, pedidos e vistorias"""
cliente_routes = Bottle()
cliente_controllers= ClienteController(cliente_routes)
