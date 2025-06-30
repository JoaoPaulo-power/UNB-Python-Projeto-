from bottle import request
from models.cliente import Cliente, ClienteModel
from models.carro import Carro, CarrosModel
from models.vistorias import Vistoria, VistoriasModel
from models.pedidos import Pedido, PedidosModel



class ClienteService:
    def __init__(self):
        self.cliente_model= ClienteModel()
        
    def get_all(self):
        self.cliente_model.get_all()
        
    def save(self):# cadastra clientes pelo o html
        last_id= max([u.id for u in self.cliente_model.get_all()],default=0)
        new_id= last_id+1
        name=request.forms.get('name')
        email=request.forms.get('email')
        birthdate=request.forms.get('birthdate')
        senha=request.forms.get('senha')
        lista_pedidos=request.forms.get('lista_pedidos')
        lista_vistorias=request.forms.get('lista_vistorias')
        lista_carros=request.forms.get('lista_carros')
        
        cliente=Cliente(new_id,name,email,birthdate,senha,lista_carros,lista_pedidos,lista_vistorias)
        self.cliente_model.add(cliente)
        
    def get_by_id(self,cliente_id):
        return self.cliente_model.get_by_id(cliente_id)
    
    def edit_cliente(self,cliente_obj):
        cliente_obj.name= request.forms.get('name')
        cliente_obj.email= request.forms.get('email')
        cliente_obj.birthdate= request.forms.get('birthdate')
        cliente_obj.lista_pedidos= request.forms.get('lista_pedidos')
        cliente_obj.lista_vistorias= request.forms.get('lista_vistorias')
        cliente_obj.lista_carros= request.forms.get('lista_carros')
        
        self.cliente_model.update(cliente_obj)
        
    def delete(self,cliente_id):
        self.cliente_model.delete(cliente_id)
    
    def cad_carro(self,cliente_id,numero_chassi,ano,modelo='',marca='',problemas=None):
        """ cadastra carro em carro.json, e atualiza o cliente com o carro na lista de carros dele """
        car_model=CarrosModel()
        cliente_model=ClienteModel()
        carro=Carro(numero_chassi,ano,modelo,marca,problemas)
        car_model.add(carro)#adicionando carro 
        
        cliente=self.get_by_id(cliente_id)
        cliente.lista_carros.append(carro)#adicionando ao cliente
        cliente_model.update(cliente)
        
        
    def cad_vist(self,cliente_id,id,carro,status,funcionarios=None,prazo=''):
        """ cadastra vist, salva em vistorias.json,e atualiza o cliente com  a vistoria em sua lisa_pedidos """

        vist_model=VistoriasModel()
        cliente_model=ClienteModel()
        vistoria=Vistoria(id,carro,status,funcionarios,prazo)
        vist_model.add(vistoria)# adicionando vistoria

        cliente=self.cliente_model.get_by_id(cliente_id)
        cliente.lista_vistorias.append(id)#altera lista
        cliente_model.update(cliente)#atualiza   


    def cad_pedido(self,id_cliente,id_ped,carro,status):
        """ cadastra pedido, salva em pedidos.json,e atualiza o cliente com  pedido em sua lisa_pedidos """
        pedido=Pedido(id_ped,carro,status)
        PedidosModel().add(pedido)#adicionando pedido ao json

        cliente=self.cliente_model.get_by_id(id_cliente)
        cliente.lista_pedidos.append(id_ped)
        self.cliente_model.update(cliente)
        print('pedido cadastrado')

