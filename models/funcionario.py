


import os
from models.user import User, DATA_DIR
from models.vistorias import Vistoria,VistoriasModel
from models.pedidos import Pedido,PedidosModel
from models.carro import Carro,CarrosModel
from models.problema import ProblemaModel,Problema

class Funcionario(User):
    def __init__(self, id, birthdate, senha,salario, name='', email='', lista_pedidos=[], lista_vistorias=[]):
        super().__init__(id, name, email, birthdate, senha)
        self.lista_pedidos=lista_pedidos if lista_pedidos is not None else []
        self.lista_vistorias=lista_vistorias if lista_vistorias is not None else []
        self.salario=salario
        
    def to_dict(self):
        return {
            'id':self.id,
            'birthdate':self.birthdate,
            'senha':self.senha,
            'salario':self.salario,
            'name':self.name,
            'email':self.email,
            'lista_pedidos':self.lista_pedidos,
            'lista_vistorias':self.lista_vistorias
            
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            birthdate=data['birthdate'],
            senha=data['senha'],
            salario=data['salario'],
            name=data['name'],
            email=data['email'],
            lista_pedidos=data['lista_pedidos'],
            lista_vistorias=data['lista_vistorias'],
        )
        
    def pegar_vistoria(self, vistoria_adicionada_obj,prazo=''):
        func_model=FuncionarioModel()
        vist_model=VistoriasModel()
        
        id_vist=vistoria_adicionada_obj.id#captura atributos
        carro_vist=vistoria_adicionada_obj.carro
        func_vist_list=vistoria_adicionada_obj.funcionarios
        status_vist=vistoria_adicionada_obj.status
        
        funcionario_obj=func_model.get_by_id(self.id)#objeto
        new_func_id=funcionario_obj.id
        func_vist_list.append(new_func_id)# adicionando func_id na lista dentro de vist 
        
        func_vist_list1_id= func_vist_list
        new_prazo=prazo
        new_vist=Vistoria(id_vist,carro_vist,status_vist,func_vist_list1_id,new_prazo)
        vist_model.update(new_vist) #atualizando a vistoria
        self.lista_vistorias.append(id_vist)#editando
        new_func=Funcionario(self.id,self.birthdate,self.senha,self.salario,self.name,self.email,self.lista_pedidos,self.lista_vistorias)
        # atualizando func
        func_model.update(new_func)
        
        
    def fechar_vist(self,id_vist):
        vis_model=VistoriasModel()
        func_model=FuncionarioModel()
        vistoria_obj=vis_model.get_by_id(id_vist)# return obj
        vistoria_obj.fechar_vistoria()# status = 'closed'
        func_id_list=vistoria_obj.funcionarios
        for func_id in func_id_list:
            if func_id == self.id:
                func_id_list.remove(func_id)
                new_func_id_list=func_id_list
                break
        new_vist=Vistoria(vistoria_obj.id,vistoria_obj.carro,vistoria_obj.status,new_func_id_list,vistoria_obj.prazo)
        vis_model.update(new_vist) #editando vistora
        
        vist_id_list=self.lista_vistorias
        for vist_id in vist_id_list:
            if vist_id == vistoria_obj.id:
                vist_id_list.remove(vist_id)
                new_vist_id_list=vist_id_list
                break
        new_func=Funcionario(self.id,self.birthdate,self.senha,self.salario,self.name,self.email,self.lista_pedidos,self.lista_vistorias)    
        func_model.update(new_func)
        
        
    def pegar_pedido(self,id_pedido,prazo=''):
        #adicionar o id_pedido no funcionario e adicionar o id_funcionario no pedido
        ped_model=PedidosModel()
        func_model=FuncionarioModel()
        pedido_obj=ped_model.get_by_id(id_pedido)
        
        pedi_id_list=self.lista_pedidos
        pedi_id_list.append(id_pedido)
        new_func=Funcionario(self.id,self.birthdate,self.senha,self.salario,self.name,self.email,self.lista_pedidos,self.lista_vistorias)
        func_model.update(new_func)
        
        
        pedido_obj.funcionarios.append(self.id)
        new_ped=Pedido(pedido_obj.id,pedido_obj.carro,pedido_obj.status,pedido_obj.funcionarios,prazo)
        ped_model.update(new_ped)
        
    def consertar_carro(self,id_pedido):
       ped_model=PedidosModel() 
       car_model=CarrosModel()
       
       pedido=ped_model.get_by_id(id_pedido)
       broken_car_dict=pedido.carro
       broken_car_obj=Carro.from_dict(broken_car_dict)
       list_probelmas=broken_car_obj.problemas
       global comissao
       for prob in list_probelmas:
           prob_obj=Problema.from_dict(prob)
           preco_prob=prob_obj.preco
           comissao=+(preco_prob/100)*20
    
       comissao=round(comissao,2)
       new_salario=self.salario+comissao# editando
       list_probelmas.clear()# tirando probelmas
       
       
       new_car=Carro(broken_car_obj.numero_chassi,broken_car_obj.ano,broken_car_obj.modelo,broken_car_obj.marca,list_probelmas)
       car_model.update(new_car)
       return new_salario
       
    def fechar_pedido(self,id_pedido):
        new_salario=self.consertar_carro(id_pedido)
        ped_model=PedidosModel() 
        func_model=FuncionarioModel()
        pedido_obj=ped_model.get_by_id(id_pedido)
        
        new_status=pedido_obj.status='closed'
        list_id_pedidos=self.lista_pedidos
        for id_ped in list_id_pedidos:
            if id_ped == id_pedido:
                list_id_pedidos.remove(id_pedido)
                break
        
        
        new_func=Funcionario(self.id,self.birthdate,self.senha,new_salario,self.name,self.email,list_id_pedidos,self.lista_vistorias)
        func_model.update(new_func)
        
        new_pedido=Pedido(pedido_obj.id,pedido_obj.carro,new_status,pedido_obj.funcionarios,pedido_obj.prazo,'100%')
        ped_model.update(new_pedido)
        print('cheuei aqui 1')
        
 
    """
    def receber_salario(self): """ 
     
        
  
class FuncionarioModel:
    FILE_PATH = os.path.join(DATA_DIR, 'funcionarios.json')

    def __init__(self):
        self.funcionarios = self._load()

    def _load(self):
        import json,os
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH,'r', encoding='utf-8') as f:
            return [Funcionario.from_dict(item) for item in json.load(f)]
        
    def _save(self):
        import json
        with open (self.FILE_PATH,'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a  in self.funcionarios], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.funcionarios
    
    def get_by_id(self, funcionario_id):#retorna o funcionario
        return next((a for a in self.funcionarios if a.id == funcionario_id), None)
    
    def add(self, funcionario):
        self.funcionarios.append(funcionario)
        self._save()

    def update(self, updated_funcionario):
        for i ,a in enumerate(self.funcionarios):
            if a.id == updated_funcionario.id:
                self.funcionarios[i] = updated_funcionario
                self._save()
                break
    def delete(self,funcionario_id):
        self.funcionarios= [a for a in self.funcionarios if a.id != funcionario_id]
        self._save()

