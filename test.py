# arquivo pra testar tudo


from models.problema import Problema,ProblemaModel
from services.carro_service import CarroService,Carro
from services.cliente_service import ClienteService,Cliente,ClienteModel
from services.funcionario_service import FuncionarioService,Funcionario,FuncionarioModel
from services.user_service import UserService,User
from services.vistoria_service import VistoriaService,Vistoria

car_service=CarroService()
cliente_service=ClienteService()
func_service=FuncionarioService()
user_dervice= UserService()
Vist_service=VistoriaService()

cliente=cliente_service.get_by_id(1)
funcionario=func_service.get_by_id(2)
carro=car_service.get_by_chassi(12)
vistoria=Vist_service.get_by_id(1) 
problema=ProblemaModel().get_by_id(1)

func_service.entregar_vist(funcionario.id,vistoria.id,problema.id)

cliente_service.cad_pedido(cliente.id,1,carro,'open')
