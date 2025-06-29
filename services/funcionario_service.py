from bottle import request
from models.funcionario import Funcionario, FuncionarioModel

class ServiceFuncionario:
    def __init__(self):
        self.funcionario_model= FuncionarioModel()

    def get_all(self):# lista todos os funcs
        self.funcionario_model.get_all()
    
    def save(self):# cadastrar func
        last_id = max([u.id for u  in self.funcionario_model.get_all()], default=0)
        new_id= last_id + 1
        name= request.forms.get('name')
        email=request.forms.get('email')
        # entre aspas vai o nome do campo no form html
        birthdate = request.forms.get('birthdate')
        lista_pedidos= request.forms.get('lista_pedidos')
        lista_vistorias= request.forms.get('lista_vistorias')
        salario= request.forms.get('salario')

       
        
         
        funcionario= Funcionario(id = new_id,name=name,email=email,birthdate=birthdate,salario=salario,lista_pedidos=lista_pedidos,lista_vistorias=lista_vistorias)
        self.funcionario_model.add(funcionario)

    def get_by_id(self,funcionario_id):# retorna um exclusivo
        return self.funcionario_model.get_by_id()
    
    def edit_funcionario(self,funcionario_obj):# editando um funcionario e as sub
        funcionario_obj.name = request.forms.get('name')
        funcionario_obj.email = request.forms.get('email')
        funcionario_obj.birthdate = request.forms.get('birthdate')
        funcionario_obj.lista_pedidos= request.forms.get('lista_pedidos')
        funcionario_obj.lista_vistorias= request.form.get('lista_vistorias')
        funcionario_obj.salario= request.form.get('salario')
        
        self.funcionario_model.update(funcionario_obj)
        
    def delete_funcionario(self,funcionario_id):
        self.funcionario_model.delete(funcionario_id)
            
        
       