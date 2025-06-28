# arquivo pra testar os models.


from models.funcionario import  FuncionarioModel,Funcionario
from models.cliente import Cliente,ClienteModel
from models.problema import Problema,ProblemaModel
from models.carro import Carro,CarrosModel
from models.user import User,UserModel
from models.vistorias import Vistoria,VistoriasModel
from models.pedidos import Pedido,PedidosModel

car_model=CarrosModel()
func_model = FuncionarioModel()
cliente_model=ClienteModel()
prob_model=ProblemaModel()
user_model=UserModel()
vis_model=VistoriasModel()
pedi_model=PedidosModel()


func1=func_model.get_by_id(12)#objeto/dicionario

carro=car_model.get_by_chassi(123)#objeto
""" vistoria0=Vistoria(1,carro,'open')
vis_model.add(vistoria0) """
vistoria= vis_model.get_by_id(1)#objeto
problema2=prob_model.get_by_id(2)#objeto

func1.pegar_vistoria(vistoria,'3 dias')


















 

