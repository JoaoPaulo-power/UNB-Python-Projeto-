


import os
from models.user import User, DATA_DIR
from models.vistorias import Vistoria,VistoriasModel
from models.pedidos import Pedido,PedidosModel
from models.carro import Carro,CarrosModel
from models.problema import ProblemaModel,Problema

class Funcionario(User):
    def __init__(self, id, birthdate, senha,salario=0, name='', email='', lista_pedidos=[], lista_vistorias=[]):
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

