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
        funcionarios=self.funcionario_model.get_all()
        return funcionarios
    
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

    def get_by_id(self,funcionario_id=0):# retorna um exclusivo
        return self.funcionario_model.get_by_id(funcionario_id)
    
    def edit_funcionario(self,funcionario_obj=0):# editando um funcionario pelo o html
        funcionario_obj.name = request.forms.get('name')
        funcionario_obj.email = request.forms.get('email')
        funcionario_obj.birthdate = request.forms.get('birthdate')
        funcionario_obj.lista_pedidos= request.forms.get('lista_pedidos')
        funcionario_obj.lista_vistorias= request.form.get('lista_vistorias')
        funcionario_obj.salario= request.form.get('salario')
        
        self.funcionario_model.update(funcionario_obj)
        
    def delete_funcionario(self,funcionario_id=0):
        self.funcionario_model.delete(funcionario_id)
            
        
    def pegar_vist(self,func_id=0):#,vistoria_adicionada_id=0,prazo=''

        vistoria_adicionada_id=request.forms.get('vvistoria_adiciconada_id')
        prazo=request.forms.get('prazo')

        vist_model=VistoriasModel()
        vist_service=VistoriaService()
        func_model= self.funcionario_model

        vistoria=vist_service.get_by_id(vistoria_adicionada_id)
        func=self.get_by_id(func_id)
        func.lista_vistorias_id.append(vistoria.id)#adicinando a vist no meu func 
        func_model.update(func)#atualizando
        list_func= vistoria.funcionarios_id#editando
        list_func.append(func.id)#adicionando id de funcionario na vistoria
        vistoria.prazo=prazo
        vist_model.update(vistoria)#salvando
        print('vistoria pega')

    def cad_problema(self,):#id=0,preco=0,peca=''
        """ cadastro de um problema """
        id=request.forms.get('id')
        preco=request.forms.get('preco')
        peca=request.forms.get('peca')
        prob=Problema(id,peca,preco)
        ProblemaModel().add(prob)#salvando problema
        print('problema cadastrado')

    def add_prob(self,id_vist=0,id_prob=0):# secundario\\\\
        """ adiciona probelam no carro da vistoria 
        será se eu preciso colcoar o request aqui"""
        vist=VistoriasModel().get_by_id(id_vist)
        vist_carro_chassi=vist.carro_id
        vist_carro_obj= CarrosModel().get_by_chassi(vist_carro_chassi)
        problema=ProblemaModel().get_by_id(id_prob)
        vist_carro_obj.problemas_id.append(problema.id)#adicionando problema_dict a carro
        CarrosModel().update(vist_carro_obj)#atualizando carro

        VistoriasModel().update(vist)#atualizando vistoria
        print('problema adicionado')

    def entregar_vist(self,id_func=0):#,id_vist=0,id_prob=0
        """ acidiona problema ao carro da vistoria,salva, e atualiza as respectivsa listas """
        id_vist=request.forms.get('id_vist')
        id_prob=request.forms.get('is_prob')

        vist_service=VistoriaService()
        vist_model=VistoriasModel()
        func_model=FuncionarioModel()
        funcionario=self.get_by_id(id_func)
        if id_vist in funcionario.lista_vistorias_id :
            self.add_prob(id_vist,id_prob)#
            vistoria=vist_service.get_by_id(id_vist)
            vistoria.status='closed'
            vist_list_id=funcionario.lista_vistorias_id
            for vist_id in vist_list_id:
                if vist_id == id_vist:
                    vist_list_id.remove(vist_id)# removendo vist da lista
                    break
        else:
            return print('Este funcionario nao tem o id desta vistoria')
        func_model.update(funcionario)
        vist_model.update(vistoria)
        print('vistoria entregue')

    def pegar_pedido(self,func_id=0):#,ped_id=0,prazo=''
        """ adiciono pedido nas listas respectivas listas """

        ped_id=request.forms.get('ped_id')
        prazo=request.forms.get('prazo')
        funcionario=self.funcionario_model.get_by_id(func_id)
        pedido=PedidosModel().get_by_id(ped_id)

        funcionario.lista_pedidos_id.append(pedido.id)#adicionando id de pedido a lista do meu func
        self.funcionario_model.update(funcionario)#atualizando funcionario

        pedido.funcionarios_id.append(funcionario.id)#adicionando id de funcionario no meu pedido
        pedido.prazo=prazo
        PedidosModel().update(pedido)#atualizando
        print('pedido pego')

    def lancar_progresso(self,ped_id=0):#,progresso=''
        """lançar o progresso do atendimento do pedido"""
        progresso=request.forms.get('progresso')
        pedido=PedidosModel().get_by_id(ped_id)
        pedido.progresso=progresso
        PedidosModel().update(pedido)
        print('progresso lançado')


    def consertar_carro(self,id_func=0):#id_pedido=0,
        """tiro problemas do carro e dou a comissao do funcionario"""
        id_pedido=request.forms.get('id_pedido')
        funcionario=self.funcionario_model.get_by_id(id_func)
        if id_pedido in funcionario.lista_pedidos_id:
            pedido=PedidosModel().get_by_id(id_pedido)
            carro_obj=CarrosModel().get_by_chassi(pedido.carro_id)
            problema_carro=carro_obj.problemas_id
            global comissao
            for problema_id in problema_carro:
                problema_obj=ProblemaModel().get_by_id(problema_id)
                ganha_pão=(problema_obj.preco/100)*25
                comissao=+ganha_pão
                funcionario.salario=funcionario.salario+comissao#aumentando o salario do cara
            problema_carro.clear()
            pedido.status='closed'
            CarrosModel().update(carro_obj)
            print('carro concertado')
        else:return print('esse pedido não esta cadastrado para esse funcionário')
            
    def entregar_pedido(self,id_funcionario=0):#,id_pedido=0
        """tiro o pedido da lista do funcioanrio e dou ele como clcosed"""
        id_pedido=request.forms.get('id_pedido')
        funcionario = self.funcionario_model.get_by_id(id_funcionario)
        list_ped=funcionario.lista_pedidos_id
        if id_pedido in list_ped:
            pedido = PedidosModel().get_by_id(id_pedido)
            pedido.status='closed'
            for ped_id in list_ped: 
                if ped_id == id_pedido:
                    list_ped.remove(ped_id)
                    break
            PedidosModel().update(pedido)
            self.funcionario_model.update(funcionario)
            print('pedido entregue')
        else:
            print( 'este funcionario não tem esse pedido')

    def receber_salario(self,id_funcionario=0):
        """funcionario vai receber o dinheiro e vai aumentar o salário dele"""
        funcionario=self.funcionario_model.get_by_id(id_funcionario)
        salario=funcionario.salario
        name= funcionario.name
        print(f'o funcionario:{name} recebeu um salario de {salario} reais')
        new_salario = (salario/100)*105
        funcionario.salario=new_salario
        self.funcionario_model.update(funcionario)

    def listar_vistorias(self,id_funcionario):
        funcionario=self.get_by_id(id_funcionario)
        lista_vistorias=[]
        for id_vist in funcionario.lista_vistorias_id:
            vistoria=VistoriasModel().get_by_id(id_vist)
            lista_vistorias.append(vistoria)
        return lista_vistorias

    def listar_pedidos(self,id_funcionario):
        funcionario=self.get_by_id(id_funcionario)
        lista_pedidos=[]
        for ped_id in funcionario.lista_pedidos_id:
            pedido=PedidosModel().get_by_id(ped_id)
            lista_pedidos.append(pedido)
        return lista_pedidos
    
    def listar_salario(self,id_funcionario):
        funcionario=self.get_by_id(id_funcionario)
        return funcionario.salario
    
    def add_funcionario(self):
        
        ...

        