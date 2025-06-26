import os
from models.user import User, DATA_DIR
 
class Cliente(User):
    def __init__(self, id, name, email, birthdate,lista_carros=[],lista_pedidos=[],lista_vistorias=[]):
        super().__init__(id, name, email, birthdate)
        self.lista_carros= lista_carros
        self.lista_pedidos=lista_pedidos
        self.lista_vistorias=lista_vistorias
    
    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email,
            'birthdate': self.birthdate,
            'lista de pedidos':self.lista_pedidos,
            'lista de vistorias': self.lista_vistorias,
            'lista de carros': self.lista_carros
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            name=data['name'],
            email=data['email'],
            birthdate=data['birthdate'],
            lista_pedidos=data['lista de pedidos'],
            lista_vistorias=data['lista de vistorias'],
            lista_carros=data['lista de carros']
        )    
        
        #TODO implementar esse metodos
        """def abrir_pedido(self)
            def abrir_vistoria(self)
            def cadastrar_carro(self)
            def pagar(self)
            """
    
class ClienteModel:
    
    FILE_PATH = os.path.join(DATA_DIR, 'clientes.json')
    
    def __init__(self):
        self.clientes = self._load()#arquivo json
        
    def _load(self):
        import json,os
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH,'r', encoding='utf-8') as f:
            return [Cliente.from_dict(item) for item in json.load(f)]
    

    def _save(self):
        import json
        with open (self.FILE_PATH,'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a  in self.clientes], f, indent=4, ensure_ascii=False)
            
    def get_all(self):
        return self.clientes
    
    def get_by_id(self,cliente_id):
        return next((a for a in self.clientes if a.id == cliente_id), None)
    
    def add(self, cliente):
        self.clientes.append(cliente)
        self._save()

    def update(self, updated_cliente):
        for i ,a in enumerate(self.clientes):
            if a.id == updated_cliente.id:
                self.funcionario[i] = updated_cliente
                self._save()
                break
    
    def delete(self,cliente_id):
        self.clientes= [a for a in self.clientes if a.id != cliente_id]
        self._save()



        
        

