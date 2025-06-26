# arquivo pra testar os models.


from models.funcionario import  FuncionarioModel,Funcionario
from models.cliente import Cliente,ClienteModel
from models.problema import Problema,ProblemaModel
from models.carro import Carro,CarrosModel

car_model=CarrosModel()
func_model = FuncionarioModel()
cliente_model=ClienteModel()
prob_model=ProblemaModel()

car1=Carro(1564,2024,'doblo','fiat')
car_model.add(car1)
print(car_model.get_all())



""" f = Funcionario(id=10, name='teste', email='gabriel@email.com', birthdate='10-09-2025', salario=2000, lista_pedidos=[10, 20])
func_model.add(f)  
print(func_model.get_all())"""
 

# como apagar um funcionario cadastrado e ja salvo em json ?





