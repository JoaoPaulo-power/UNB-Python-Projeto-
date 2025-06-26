# arquivo pra testar os models.


from models.funcionario import  FuncionarioModel,Funcionario
from models.cliente import Cliente,ClienteModel
from models.problema import Problema,ProblemaModel
from models.carro import Carro,CarrosModel
from models.user import User,UserModel
from models.vistorias import Vistoria,VistoriasModel

car_model=CarrosModel()
func_model = FuncionarioModel()
cliente_model=ClienteModel()
prob_model=ProblemaModel()
user_model=UserModel()
vis_model=VistoriasModel()

vistoria1=Vistoria(456789,car_model.get_by_id(1564),func_model.get_by_id(12),"2 dias")

print(vistoria1.carro.numero_chassi)



 

