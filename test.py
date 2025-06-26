# arquivo pra testar os models.


from models.funcionario import Funcionario, FuncionarioModel
from models.cliente import Cliente,ClienteModel
""" --> func_model = FuncionarioModel()
f = Funcionario(id=111111, name='gabriel', email='gabriel@email.com', birthdate='10-09-2025', salario=2000, lista_pedidos=[10, 20])
func_model.add(f)
print(func_model.get_all()) """

# como apagar um funcionario cadastrado e ja salvo em json ?

cliente_model=ClienteModel()
c1 = Cliente(id=24,name='gabriel',email='gabriel@gmail.com',birthdate='15072005')
cliente_model.add(c1)
print(cliente_model.get_all())