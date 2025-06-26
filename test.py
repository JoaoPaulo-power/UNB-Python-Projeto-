# arquivo pra testar os models.


from models.funcionario import  FuncionarioModel,Funcionario
from models.cliente import Cliente,ClienteModel
from models.problema import Problema,ProblemaModel

func_model = FuncionarioModel()
cliente_model=ClienteModel()
prob_model=ProblemaModel()

p1=Problema(10,'vira-brequin',1200)

prob_model.add(p1)
print(prob_model.get_all())
prob_model.delete(1)
print(func_model.get_all())

""" f = Funcionario(id=10, name='teste', email='gabriel@email.com', birthdate='10-09-2025', salario=2000, lista_pedidos=[10, 20])
func_model.add(f)  
print(func_model.get_all())"""
 

# como apagar um funcionario cadastrado e ja salvo em json ?





