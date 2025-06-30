from bottle import request
from models.funcionario import Funcionario, FuncionarioModel
from models.problema import Problema,ProblemaModel 
from models.pedidos import Pedido,PedidosModel

from services.carro_service import Carro,CarrosModel,CarroService
from services.vistoria_service import VistoriasModel,VistoriaService,Vistoria



class FuncionarioService:
    def __init__(self):
        self.funcionario_model= FuncionarioModel()

    def get_all(self):# lista todos os funcs
        self.funcionario_model.get_all()
    
    def save(self):# cadastrar func pelo o html 
        last_id = max([u.id for u  in self.funcionario_model.get_all()], default=0)
        new_id= last_id + 1
        name= request.forms.get('name')
        email=request.forms.get('email')
        # entre aspas vai o nome do campo no form html
        birthdate = request.forms.get('birthdate')
        lista_pedidos= request.forms.get('lista_pedidos')
        lista_vistorias= request.forms.get('lista_vistorias')
        salario= request.forms.get('salario')

       
        
         
        funcionario= Funcionario(id = new_id,name=name,email=email,birthdate=birthdate,salario=salario,lista_pedidos=lista_pedidos,lista_vistorias=lista_vistorias)
        self.funcionario_model.add(funcionario)

    def get_by_id(self,funcionario_id):# retorna um exclusivo
        return self.funcionario_model.get_by_id(funcionario_id)
    
    def edit_funcionario(self,funcionario_obj):# editando um funcionario pelo o html
        funcionario_obj.name = request.forms.get('name')
        funcionario_obj.email = request.forms.get('email')
        funcionario_obj.birthdate = request.forms.get('birthdate')
        funcionario_obj.lista_pedidos= request.forms.get('lista_pedidos')
        funcionario_obj.lista_vistorias= request.form.get('lista_vistorias')
        funcionario_obj.salario= request.form.get('salario')
        
        self.funcionario_model.update(funcionario_obj)
        
    def delete_funcionario(self,funcionario_id):
        self.funcionario_model.delete(funcionario_id)
            
        
    def pegar_vist(self,func_id,vistoria_adicionada_id,prazo=''):
        vist_model=VistoriasModel()
        vist_service=VistoriaService()
        func_model= self.funcionario_model
        
        vistoria=vist_service.get_by_id(vistoria_adicionada_id)
        func=self.get_by_id(func_id)
        func.lista_vistorias.append(vistoria.id)#adicinando a vist no meu func 
        func_model.update(func)#atualizando


        
        list_func= vistoria.funcionarios#editando
        list_func.append(func.id)#adicionando id de funcionario na vistoria
        vistoria.prazo=prazo
        vist_model.update(vistoria)#salvando
        
        print('vistoria pega')

    def cad_problema(self,id,preco,peca=''):
        prob=Problema(id,peca,preco)
        ProblemaModel().add(prob)#salvando problema
        print('problema cadastrado')

    def add_prob(self,id_vist,id_prob):
        vist=VistoriasModel().get_by_id(id_vist)
        vist_carro=vist.carro
        vist_carro_obj=Carro.from_dict(vist_carro)
        prob=ProblemaModel().get_by_id(id_prob)

        vist_carro_obj.problemas.append(prob.to_dict())#adicionando problema_dict a carro
        CarrosModel().update(vist_carro_obj)#atualizando carro
        vist_carro_dict=vist_carro_obj.to_dict()
        vist_carro=vist_carro_dict
        VistoriasModel().update(vist)#atualizando vistoria
        print('problema adicionado')
        

    def entregar_vist(self,id_func,id_vist,id_prob):
        vist_service=VistoriaService()
        vist_model=VistoriasModel()
        func_model=FuncionarioModel()

        self.add_prob(id_vist,id_prob)
        vistoria=vist_service.get_by_id(id_vist)
        vistoria.status='closed'

        funcionario=self.get_by_id(id_func)
        vist_list_id=funcionario.lista_vistorias
        for vist_id in vist_list_id:
            if vist_id == id_vist:
                vist_list_id.remove(vist_id)# removendo vist da lista
                break
        
        func_model.update(funcionario)
        vist_model.update(vistoria)
        print('vistoria entregue')

    def pegar_pedido(self,func_id,ped_id,prazo):
        funcionario=self.funcionario_model.get_by_id(func_id)
        pedido=PedidosModel().get_by_id(ped_id)

        funcionario.lista_pedidos.append(pedido.id)#adicionando id de pedido a lista do meu func
        self.funcionario_model.update(funcionario)#atualizando funcionario

        pedido.funcionarios.append(funcionario.id)#adicionando id de funcionario no meu pedido
        pedido.prazo=prazo
        PedidosModel().update(pedido)#atualizando
        print('pedido pego')

    def lancar_progresso(self,ped_id,progresso):
        pedido=PedidosModel().get_by_id(ped_id)
        pedido.progresso=progresso
        PedidosModel().update(pedido)
        print('progresso lançado')


    def consertar_carro(self,id_pedido,id_func):
        funcionario=self.funcionario_model.get_by_id(id_func)
        pedido=PedidosModel().get_by_id(id_pedido)
        carro_dict=pedido.carro
        carro=Carro.from_dict(carro_dict)

        porblemas_do_carro=carro.problemas
        global comissao
        for problema_dict in porblemas_do_carro:
            problema_obj=Problema.from_dict(problema_dict)
            ganha_pão=(problema_obj.preco/100)*25
            comissao=+ganha_pão
        funcionario.salario=funcionario.salario+comissao#aumentando o salario do cara
        porblemas_do_carro.clear()
        pedido.status='closed'
        CarrosModel().update(carro)
        print('carro concertado')
        
            
    def entregar_pedido(self,id_pedido,id_funcionario):
        funcionario = self.funcionario_model.get_by_id(id_funcionario)
        list_ped=funcionario.lista_pedidos
        if id_pedido in list_ped:
            pedido = PedidosModel().get_by_id(id_pedido)
            
            pedido.status='closed'
            for ped_id in list_ped: 
                if ped_id == id_pedido:
                    list_ped.remove(ped_id)
                    break
            PedidosModel().update(pedido)
            self.funcionario_model.update(funcionario)
        else:
            print( 'este funcionario não tem esse pedido')
        
        
        
        
        
        