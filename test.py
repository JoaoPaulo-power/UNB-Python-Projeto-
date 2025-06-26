# arquivo pra testar os models.


from models.funcionario import  FuncionarioModel,Funcionario
from models.cliente import Cliente,ClienteModel
from models.problema import Problema,ProblemaModel
from models.carro import Carro,CarrosModel
from models.user import User,UserModel


car_model=CarrosModel()
func_model = FuncionarioModel()
cliente_model=ClienteModel()
prob_model=ProblemaModel()
user_model=UserModel()

user1=User(1,'teste','teste@gmail.com',456789,'13Gabri@')
f1=Funcionario(12,'teste','teste@gmail.com',456789,'huihui',465)

user_model.add_user(user1)

func_model.add(f1)




""" f = Funcionario(id=10, name='teste', email='gabriel@email.com', birthdate='10-09-2025', salario=2000, lista_pedidos=[10, 20])
func_model.add(f)  
print(func_model.get_all())"""
 

# como apagar um funcionario cadastrado e ja salvo em json ?





