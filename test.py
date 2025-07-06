# arquivo pra testar tudo


from services.problema_service import ProblemaService
from services.pedido_service import PedidoService
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
prob_service=ProblemaService()
ped_service=PedidoService()


cliente=cliente_service.get_by_id(1)
print(cliente_service.listar_carros(cliente.id))