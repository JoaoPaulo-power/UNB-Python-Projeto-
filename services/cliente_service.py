from bottle import request
from models.cliente import Cliente, ClienteModel
from models.carro import Carro, CarrosModel
from models.vistorias import Vistoria, VistoriasModel
from models.pedidos import Pedido, PedidosModel
from models.auth_user import AuthUser,AuthUserModel



class ClienteService:
    
    def __init__(self):
        self.cliente_model= ClienteModel()
        
    def get_all(self):
        clientes =self.cliente_model.get_all()
        return clientes
        
    def save(self):# cadastra clientes pelo o html

        last_id= max([u.id for u in AuthUserModel().get_all()],default=0)
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
    
    def cad_carro(self,cliente_id):#,numero_chassi,ano,modelo='',marca='',problemas_id=None
        """ cadastra carro em carro.json, e atualiza o cliente com o chassi do carro na lista do cliente"""
        numero_chassi=request.forms.get('numero_chassi')
        ano=request.forms.get('ano')
        modelo=request.forms.get('modelo')
        marca=request.forms.get('marca')
        problemas_id=request.forms.get('probelmas_id')
        
        car_model=CarrosModel()
        cliente_model=ClienteModel()
        carro=Carro(numero_chassi,ano,modelo,marca,problemas_id)
        car_model.add(carro)#adicionando carro no json
        
        cliente=self.get_by_id(cliente_id)
        cliente.lista_carros_id.append(carro.numero_chassi)#adicionando carro ao cliente
        print(f' pre_update {cliente}')
        cliente_model.update(cliente)
        
        
    def cad_vist(self,cliente_id):#,id_vist,carro_id,status,funcionarios=None,prazo=''
        """ cadastra vist, salva em vistorias.json,e atualiza o cliente com  a vistoria em sua lisa_pedidos """
        last_id= max([v.id for v in VistoriasModel().get_all()],default=0)
        new_id= last_id+1
        carro_id=request.forms.get('numero_chassi_carro')
        status='open'
        funcionarios_id=None
        prazo=''

        vist_model=VistoriasModel()
        cliente_model=ClienteModel()
        vistoria=Vistoria(new_id,carro_id,status,funcionarios_id,prazo)
        vist_model.add(vistoria)# adicionando vistoria


        cliente=self.cliente_model.get_by_id(cliente_id)
        cliente.lista_vistorias_id.append(vistoria.id)#altera lista
        cliente_model.update(cliente)#atualiza


    def cad_pedido(self,id_cliente):#,id_ped,carro_id,status
        """ cadastra pedido, salva em pedidos.json,e atualiza o cliente com o pedido_id em sua lisa_pedidos """
        last_id= max([p.id for p in PedidosModel().get_all()],default=0)
        new_id= last_id+1
        carro_id= request.forms.get('carro_Chassi')
        status= 'open'

        pedido=Pedido(new_id,carro_id,status)
        PedidosModel().add(pedido)#adicionando pedido ao json

        cliente=self.cliente_model.get_by_id(id_cliente)
        cliente.lista_pedidos_id.append(pedido.id)
        
        self.cliente_model.update(cliente)
    def pagar_pedido(self,id_cliente):#,id_pedido

        id_pedido=request.forms.get('id_pedido')
        
        cliente= self.cliente_model.get_by_id(id_cliente)
        if id_pedido in cliente.lista_pedidos_id:
            from models.problema import ProblemaModel
            pedido= PedidosModel().get_by_id(id_pedido)
            carro_obj=CarrosModel().get_by_chassi(pedido.carro_id)
            list_problemas_id=carro_obj.problemas_id
            global valor_total
            for problema_id in list_problemas_id:
                problema_obj=ProblemaModel().get_by_id(problema_id)
                valor=problema_obj.preco
                valor_total=+valor
    
            nome=cliente.name    
            print(f'o cliente: {nome}, pagou {valor_total} reais')
        else:
            print('esse cliente n tem um pedido com esse id')

    def listar_carros(self,id_cliente):
        cliente= self.cliente_model.get_by_id(id_cliente)
        lista_carros=[] #salvo o objeto ou o dict?
        for carro_id in cliente.lista_carros_id:
            carro=CarrosModel().get_by_chassi(carro_id)# salvando o objeto
            lista_carros.append(carro)
        return lista_carros
    
    def listar_vistorias(self,id_cliente):
        cliente= self.cliente_model.get_by_id(id_cliente)
        lista_vistorias=[]
        for id_vist in cliente.lista_vistorias_id:
            vistoria=VistoriasModel().get_by_id(id_vist)
            lista_vistorias.append(vistoria)
        return lista_vistorias
    
    def listar_pedido(self,id_cliente):
        cliente= self.cliente_model.get_by_id(id_cliente)
        lista_pedidos=[]
        for id_ped in cliente.lista_pedidos_id:
            pedido=PedidosModel().get_by_id(id_ped)
            if pedido is not None:
                lista_pedidos.append(pedido)
                print(lista_pedidos)
        return lista_pedidos
    
    def add_cliente(self,id_user):
        user=AuthUserModel().get_by_id(id_user)
        print(f'usuario{user}')

        data_nasciment=request.forms.get('data_nascimento')
        cliente=Cliente('','','','','')
        cliente.id=user.id
        cliente.name=user.username
        cliente.birthdate=data_nasciment
        cliente.email=user.email
        cliente.senha=user.password_hash
        print(f'{cliente} print 1 ')
        self.cliente_model.add(cliente)
        
    def delete_vist(self,id_cliente):#id_vistoria
        """removendo vistoria da lista do cliente"""
        
        cliente=self.cliente_model.get_by_id(id_cliente)
        id_vistoria=int(request.forms.get('id_vistoria'))
        for id_vist in cliente.lista_vistorias_id:
            if id_vist == id_vistoria:
                cliente.lista_vistorias_id.remove(id_vistoria)
                break
        
        self.cliente_model.update(cliente)
    def delete_pedido(self,id_cliente):
        """removendo pedido  da lista de clientes"""
        
        cliente=self.cliente_model.get_by_id(id_cliente)
        id_pedido=int(request.forms.get('id_pedido'))
        for id_ped in cliente.lista_pedidos_id:
            if id_ped == id_pedido:
                cliente.lista_pedidos_id.remove(id_pedido)
                break
        
        self.cliente_model.update(cliente)
        
    def delete_carro(self,id_cliente):
        cliente=self.cliente_model.get_by_id(id_cliente)
        numero_chassi=request.forms.get('numero_chassi')
        for numero_chassi1 in cliente.lista_carros_id:
            if numero_chassi1 == numero_chassi:
                cliente.lista_carros_id.remove(numero_chassi1)
                break
        
        self.cliente_model.update(cliente)   
        
    def edit_car_especific(self,numero_chassi):
        nova_marca = request.forms.get('marca')
        novo_modelo = request.forms.get('modelo')
        novo_ano = request.forms.get('ano')
        
        carro = CarrosModel().get_by_chassi(numero_chassi)
        if carro:
            carro.marca=nova_marca
            carro.ano=novo_ano
            carro.modelo=novo_modelo
            
            CarrosModel().update(carro)

