from bottle import request
from models.pedidos import Pedido,PedidosModel

class PedidoService:    
    def __init__(self):
        self.pedido_model= PedidosModel()

    def get_all(self):# lista todos os funcs
        self.pedido_model.get_all()
        
    def save(self):
        last_id = max([u.id for u  in self.pedido_model.get_all()], default=0)
        new_id= last_id + 1
        carro_chassi= request.forms.get('carro_chassi')
        status=request.forms.get('status')
        # entre aspas vai o nome do campo no form html
        funcionarios = request.forms.get('funcionarios')
        prazo= request.forms.get('prazo')
        progresso= request.forms.get('progresso')
        
        pedido=Pedido(new_id,carro_chassi,status,funcionarios,prazo,progresso)
        self.pedido_model.add(pedido)
        
    def get_by_id(self,id_pedido):# retorna um exclusivo
        return self.pedido_model.get_by_id(id_pedido)

    def edit_pedido(self,pedido_obj):# editando um funcionario e as sub
        
        pedido_obj.carro_chassi = request.forms.get('carro_chassi')
        pedido_obj.status = request.forms.get('status')
        pedido_obj.funcionarios = request.forms.get('funcionarios')
        pedido_obj.prazo= request.forms.get('prazo')
        pedido_obj.progresso= request.forms.get('progresso')
        
        self.pedido_model.update(pedido_obj)
    
    def delete_pedido(self,id_pedido):
        self.pedido_model.delete(id_pedido)
       