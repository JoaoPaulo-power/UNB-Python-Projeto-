


import os
from models.user import User, DATA_DIR

class Funcionario(User):
    def __init__(self, id, name, email, birthdate, senha,salario, lista_pedidos = [], lista_vistorias = []):
        super().__init__(id, name, email, birthdate, senha)
        self.lista_pedidos=lista_pedidos
        self.lista_vistorias=lista_vistorias
        self.salario=salario
        
    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email,
            'birthdate': self.birthdate,
            'senha':self.senha,
            'lista de pedidos':self.lista_pedidos,
            'lista de vistorias': self.lista_vistorias,
            'salário': self.salario
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            name=data['name'],
            email=data['email'],
            birthdate=data['birthdate'],
            senha=data['senha'],
            lista_pedidos=data['lista de pedidos'],
            lista_vistorias=data['lista de vistorias'],
            salario=data['salário']
        )
        
    
   #TODO implementar esse metodos     
""" def pegar_pedido(self,pedido_adicinado):#pego ela da json dela e coloco aqui
        self.lista_pedidos.append(pedido_adicinado)
    
    def pegar_vistoria(self, vistoria_adicionado):
        self.lista_vistorias.append(vistoria_adicionado)        
        
    
    def entregar_pedido(self):
    def entregar_vistoria(self):
    def receber_salario(self):
         """
  
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
                self.funcionario[i] = updated_funcionario
                self._save()
                break
    def delete(self,funcionario_id):
        self.funcionarios= [a for a in self.funcionarios if a.id != funcionario_id]
        self._save()

