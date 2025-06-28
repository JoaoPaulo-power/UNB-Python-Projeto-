


import os
from models.user import User, DATA_DIR
from models.vistorias import Vistoria,VistoriasModel

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
        
        id_vist=vistoria_adicionada_obj.id
        carro_vist=vistoria_adicionada_obj.carro
        func_vist_list=vistoria_adicionada_obj.funcionarios
        status_vist=vistoria_adicionada_obj.status
        
        funcionario_obj=func_model.get_by_id(self.id)#objeto
        new_func_dict=funcionario_obj.to_dict()
        func_vist_list.append(new_func_dict)
        
        func_vist_list1= func_vist_list
        new_prazo=prazo
        
        new_vist=Vistoria(id_vist,carro_vist,status_vist,func_vist_list1,new_prazo)
        vist_model.update(new_vist) #atualizando a vistoria
        
        
        
       
        vistoria_dict=vistoria_adicionada_obj.to_dict()
        self.lista_vistorias.append(vistoria_dict)#editando
        new_func=Funcionario(self.id,self.birthdate,self.senha,self.salario,self.name,self.email,self.lista_pedidos,self.lista_vistorias)
        # atualizando func
        func_model.update(new_func)
        
        print('cheguei aqui 1')
        
        
 
 
    
            
        
    """ def pegar_pedido(self,pedido_adicinado):#pego ela da json dela e coloco aqui
        self.lista_pedidos.append(pedido_adicinado) """
    """ def entregar_pedido(self):
    def entregar_vistoria(self):
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

