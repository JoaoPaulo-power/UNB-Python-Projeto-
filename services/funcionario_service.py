from bottle import request
from models.funcionario import Funcionario, FuncionarioModel

class ServiceFuncionario:
    def __init__(self):
        self.funcionario_model= FuncionarioModel()

    def get_all(self):
        self.funcionario_model.get_all()
    
    def save(self):
        last_id = max([u.id for u  in self.funcionario_model.get_all()], default=0)
        new_id= last_id + 1
        name= request.forms.get('name')
        email=request.forms.get('email')
        birthdate = request.forms.get('birthdate')
        lista_pedidos= request.forms.get('lista de pedidos')
        lista_vistorias= request.form.get('lista de vistorias')
        salario= request.form.get('salário')

        #criando um novo funcionario com os atributos do antigo
        #TODO rever esse método.
        #ele n devia apagar o antigo já que ele vai adicionar um novo ? Parece que não 
        funcionario= Funcionario(id = new_id,name=name,email=email,birthdate=birthdate,salario=salario,lista_pedidos=lista_pedidos,lista_vistorias=lista_vistorias)
        self.funcionario_model.add(funcionario)

    def get_by_id(self,funcionario_id):
        return self.funcionario_model.get_by_id()
    
    def edit_funcionario(self,funcionario):
        name = request.forms.get('name')
        email = request.forms.get('email')
        birthdate = request.forms.get('birthdate')
        
       