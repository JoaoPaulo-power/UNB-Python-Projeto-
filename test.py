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

cliente= cliente_service.get_by_id(1)
funcionario=func_service.get_by_id(1)
carro= car_service.get_by_chassi(123)
vistoria=Vist_service.get_by_id(1)
problema=prob_service.get_by_id(1)
pedido=ped_service.get_by_id(1)

func_service.receber_salario(funcionario.id)


