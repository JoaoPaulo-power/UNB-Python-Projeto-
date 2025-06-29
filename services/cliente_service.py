from bottle import request
from models.cliente import Cliente,ClienteModel

class ServiceCliente:
    def __init__(self):
        self.cliente_model= ClienteModel()
        
    def get_all(self):
        self.cliente_model.get_all()
        
    def save(self):# cadastra clientes
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
    
        