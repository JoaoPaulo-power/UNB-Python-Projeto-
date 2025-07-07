import os
from models.user import DATA_DIR
from models.vistorias import Vistoria

class Pedido(Vistoria):
    def __init__(self, id, carro_id, status, funcionarios_id=None, prazo='',progresso=''):
        super().__init__(id, carro_id, status, funcionarios_id, prazo)
        self.progresso=progresso
        
    def to_dict(self):
        return {
            'id':self.id,
            'carro_id':self.carro_id,
            'funcionarios_id':self.funcionarios_id,
            'prazo':self.prazo,
            'status':self.status,
            'progresso': self.progresso
        }
    
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            carro_id=data['carro_id'],
            funcionarios_id=data['funcionarios_id'],
            prazo=data['prazo'],
            status=data['status'],
            progresso=data['progresso']    
        )
    
class PedidosModel:
    FILE_PATH = os.path.join(DATA_DIR, 'pedidos.json')
    def __init__(self):
        
        self.pedidos=self._load()
        
    def _load(self):
        import json,os
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH,'r', encoding='utf-8') as f:
            return [Pedido.from_dict(item) for item in json.load(f)]
        
    def _save(self):
        import json
        with open (self.FILE_PATH,'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a  in self.pedidos], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.pedidos
    
    def get_by_id(self, pedido_id):#retorna o objeto
        return next((a for a in self.pedidos if a.id == pedido_id), None)
    
    def add(self, pedido):
        self.pedidos.append(pedido)
        self._save()

   
    def update(self, updated_pedidos):
        for i ,a in enumerate(self.pedidos):
            if a.id == updated_pedidos.id:
                self.pedidos[i] = updated_pedidos
                self._save()
                break
    def delete(self,pedido_id):
        self.pedidos= [a for a in self.pedidos if a.id != pedido_id]
        self._save()

    
   