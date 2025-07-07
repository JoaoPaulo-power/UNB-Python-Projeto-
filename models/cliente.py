import os
from models.user import User, DATA_DIR
 
class Cliente(User):
    def __init__(self, id, role, name='', email='', birthdate='', senha='',lista_carros_id=None,lista_pedidos_id=None,lista_vistorias_id=None):
        super().__init__(id, role, name, email, birthdate, senha)
        self.lista_carros_id= lista_carros_id if lista_carros_id is not None else []
        self.lista_pedidos_id=lista_pedidos_id if lista_pedidos_id is not None else []
        self.lista_vistorias_id=lista_vistorias_id if lista_vistorias_id is not None else []
      
        
        
    def __repr__(self):
        return (f"Cliente(id={self.id}, name='{self.name}', email='{self.email}', "
                f"birthdate='{self.birthdate}', senha='{self.senha}, listas_ped={self.lista_pedidos_id}"
                f"lista_car={self.lista_carros_id}, lista_vist={self.lista_vistorias_id}") 
    
    
        
    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'email': self.email,
            'birthdate': self.birthdate,
            'role':self.role,
            'senha':self.senha,
            'lista de pedidos_id':[pedido.to_dict() if hasattr(pedido, 'to_dict') else pedido for pedido in self.lista_pedidos_id],
            'lista de vistorias_id': [vistorias.to_dict() if hasattr(vistorias, 'to_dict') else vistorias for vistorias in self.lista_vistorias_id],
            'lista de carros_id': [carro.to_dict() if hasattr(carro, 'to_dict') else carro for carro in self.lista_carros_id]
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            name=data['name'],
            email=data['email'],
            birthdate=data['birthdate'],
            role=data['role'],
            senha=data['senha'],
            lista_pedidos_id=data['lista de pedidos_id'],
            lista_vistorias_id=data['lista de vistorias_id'],
            lista_carros_id=data['lista de carros_id']
        )    
        
        
    
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
        """  updated_cliente=Cliente(updated_cliente) """
        print(f'\n{updated_cliente}')
        
        for i ,a in enumerate(self.clientes):
            if a.id == updated_cliente.id:
                self.clientes[i]=updated_cliente
                
                self._save()
                break
    
    def _User_to_cliente(self,user_id,cliente_id):
        
        from models.user import UserModel,User
        user=UserModel().get_by_id(user_id)
        cliente=Cliente('','','','','')
        cliente.id=user.id
        cliente.name=user.username
        cliente.email=user.email
        cliente.senha=user.password_hash
        return cliente
        
    def delete(self,cliente_id):
        self.clientes= [a for a in self.clientes if a.id != cliente_id]
        self._save()



        
        

