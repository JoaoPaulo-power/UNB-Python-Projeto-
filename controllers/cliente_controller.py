from bottle import Bottle, request,get,post,delete,route
from controllers.base_controller import BaseController
from services.cliente_service import ClienteService

class ClienteController(BaseController):
    #submit do button vai realizar o action e dar uma requisição que esta definida no tpl
    def __init__(self, app):
        super().__init__(app)
        self.cliente_service=ClienteService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/clientes/home',method='GET',callback=self.home_cliente)
        self.app.route('/clientes/listar',method='GET',callback=self.clientes_listar)
        self.app.route('/clientes/car/<id_cliente:int>',method='GET',callback=self.listar_carros)
        #ver variavel na rota
        self.app.route('/clientes/vist/<id_cliente:int>',method='GET',callback=self.listar_vistorias)
        #ver variavel na rota
        self.app.route('/clientes/ped/<id_cliente:int>',method='GET',callback=self.listar_pedidos)
        #ver variavel na rota
        
        ##########################################################################################
        self.app.route('/clientes/cad',method='GET',callback=self.clientes_cad)
        self.app.route('/clientes/cad_car/<id_cliente:int>',method=['POST','GET'],callback=self.cad_carro)
        self.app.route('/clientes/cad_vist/<id_cliente:int>',method=['POST','GET'],callback=self.cad_vistoria)
        self.app.route('/clientes/cad_ped/<id_cliente:int>',method=['POST','GET'],callback=self.cad_pedido)
        ############################################################################################
        self.app.route('/clientes/del',method='GET',callback=self.clientes_del)
        self.app.route('/clientes/del_vist/<id_cliente:int>',method=['POST','GET'],callback=self.delete_vistoria)
        self.app.route('/clientes/del_ped/<id_cliente:int>',method=['POST','GET'],callback=self.delete_pedido)
        self.app.route('/clientes/del_car/<id_cliente:int>',method=['POST','GET'],callback=self.delete_carro)
        
        
        ###########################################################################################
        self.app.route('/clientes',method='GET',callback=self.listar_clientes)
        self.app.route('/clientes/add',method= ['GET','POST'],callback=self.add_cliente)
        self.app.route('/clientes/edit/<cliente_id:int>',method=['GET','POST'], callback= self.edit_cliente)
        self.app.route('/clientes/delete/<cliente_id:int>',method='POST', callback= self.delete)
    
    #paginas render
    
    def clientes_del(self):
        return self.render('clientes_del')
    
    def clientes_cad(self):
        return self.render('cliente_cad')
     
    
    def clientes_listar(self):
        return self.render('cliente_listar')

    def home_cliente(self):
        return self.render('cliente_home')
    
    ###################################################################
    #paginas default
    
    def listar_clientes(self):# ok -> admim
        clientes= self.cliente_service.get_all()
        return self.render('clientes_list',clientes=clientes)
    
    def add_cliente(self):# adimim
        if request.method=='GET':
            return self.render('clientes_form',cliente=None,action='/clientes/add')# sempre chamar no html o nome do parametro
        else:#POST -> salvar cliente
            self.cliente_service.save()
            self.redirect('/clientes')
    
    def edit_cliente(self,cliente_id):#admim
        cliente= self.cliente_service.get_by_id(cliente_id)
        if not cliente :
            return 'cliente nao encontrado'
        if request.method == 'GET':
            return self.render('clientes_form',cliente=cliente,action=f'cliente/edit/{cliente_id}')
        else:
            #POST -> salvar edição
            self.cliente_service.edit_cliente(cliente)
            self.redirect('/cliente')
        
    def delete(self,cliente_id):#adimin e user 
        self.cliente_service.delete(cliente_id)
        self.redirect('/clientes')
        
    ##################################################################################################
    #PAGINAS ESÉCÍFICAS:
    #cadastro

    def cad_carro(self,id_cliente): # a variavel definida na rota que vem parar aqui
        if request.method== 'GET':
            cliente=self.cliente_service.get_by_id(id_cliente)
            return self.render('carro_form',cliente=cliente,action=f'/clientes/cad_car/{id_cliente}')
        else:
            self.cliente_service.cad_carro(id_cliente)#cadastro o carro no json e no cliente
            return self.redirect(f'/clientes/car/{id_cliente}')
        
    def cad_vistoria(self,id_cliente):
        if request.method == 'GET':
            cliente=self.cliente_service.get_by_id(id_cliente)
            return self.render('vistoria_form',cliente=cliente,action=f'/clientes/cad_vist/{id_cliente}')
        else:
            self.cliente_service.cad_vist(id_cliente)
            return self.redirect(f'/clientes/vist/{id_cliente}')
        
    def cad_pedido(self,id_cliente):# nao ter print pra deixa renderizar a pagina
        if request.method == 'GET':
            cliente=self.cliente_service.get_by_id(id_cliente)
            return self.render('pedido_form',cliente=cliente,action=f'/clientes/cad_ped/{id_cliente}')
        else:
            self.cliente_service.cad_pedido(id_cliente)
            return self.redirect(f'/clientes/ped/{id_cliente}')
           
###########################################################################
#pagar
    
    def pagar_pedido(self,cliente_id):
        self.cliente_service.pagar_pedido(cliente_id)
        self.cliente_service.cad_pedido(cliente_id)
        self.redirect('/clientes')
###################################################################################
#listar
    def listar_carros(self,id_cliente):#tem como eu interpretar essa lista aqui ?? -> sim
        cliente=self.cliente_service.get_by_id(id_cliente)
        lista_carros=self.cliente_service.listar_carros(id_cliente)#retorna uma lista com todos carros em forma de objeto
        return self.render('cliente_carros',cliente=cliente,carros=lista_carros)# sera se ele só ta pegando a primeira ? -> ele pega as que estao quando inica o server
    
    def listar_vistorias(self,id_cliente):
        cliente = self.cliente_service.get_by_id(id_cliente)
        lista_vistorias = self.cliente_service.listar_vistorias(id_cliente)
        return self.render('cliente_vistorias',cliente=cliente,vistorias=lista_vistorias)
    
    def listar_pedidos(self,id_cliente):
        cliente=self.cliente_service.get_by_id(id_cliente)
        lista_pedidos = self.cliente_service.listar_pedido(id_cliente)
        return self.render('cliente_pedidos', cliente=cliente,pedidos=lista_pedidos)

##################################################
#deletar
    def delete_vistoria(self,id_cliente):
        if request.method== 'GET':
            cliente=self.cliente_service.get_by_id(id_cliente)
            return self.render('cliente_del_vist',cliente=cliente,action=f'/clientes/del_vist/{id_cliente}')
        else:
            self.cliente_service.delete_vist(id_cliente)
            return self.redirect(f'/clientes/vist/{id_cliente}')
            
    
    def delete_carro(self,id_cliente):
        if request.method== 'GET':
            cliente=self.cliente_service.get_by_id(id_cliente)
            return self.render('cliente_del_car',cliente=cliente, action=f'/clientes/del_car/{id_cliente}')
        else:
            self.cliente_service.delete_carro(id_cliente)
            return self.redirect(f'/clientes/car/{id_cliente}')
    
    def delete_pedido(self,id_cliente):
        if request.method== 'GET':
            cliente=self.cliente_service.get_by_id(id_cliente)
            return self.render('cliente_del_ped',cliente=cliente, action=f'/clientes/del_ped/{id_cliente}')
        else:
            self.cliente_service.delete_pedido(id_cliente)
            return self.redirect(f'/clientes/ped/{id_cliente}')
        
        
   

cliente_routes = Bottle()
cliente_controllers= ClienteController(cliente_routes)
