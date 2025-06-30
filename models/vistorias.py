import os
from models.user import DATA_DIR
from models.carro import Carro,CarrosModel
from models.problema import Problema


class Vistoria:
    def __init__(self,id,carro,status,funcionarios=None,prazo=''):
        self.id=id
        self.carro=carro# aqui eu to passando  objeto 
        self.funcionarios=funcionarios if funcionarios is not None else []
        self.prazo=prazo
        self.status=status
        
    def to_dict(self):
        return{
            'id':self.id,
            'carro':self.carro.to_dict() if isinstance(self.carro, Carro) else self.carro,
            'funcionarios':self.funcionarios,
            'prazo': self.prazo,
            'status':self.status
        }
        
    @classmethod
    def from_dict(cls,data):
        return cls(
            id=data['id'],
            carro=data['carro'],
            funcionarios=data['funcionarios'],
            prazo=data['prazo'],
            status=data['status']
            
        )
        

    def lancar_problema(self,problema):
        carro= Carro.from_dict(self.carro)#objeto
        new_problema=Problema.to_dict(problema)
        carro.adicionar_problema(new_problema)
        
        
    def fechar_vistoria(self):
        self.status='closed'
        
        
        
        
        
        
                                   
        
        

class VistoriasModel:
    FILE_PATH = os.path.join(DATA_DIR, 'vistorias.json')
    def __init__(self):
        
        self.vistorias=self._load()
        
    def _load(self):
        import json,os
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH,'r', encoding='utf-8') as f:
            return [Vistoria.from_dict(item) for item in json.load(f)]
        
    def _save(self):
        import json
        with open (self.FILE_PATH,'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a  in self.vistorias], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.vistorias
    
    def get_by_id(self, vistoria_id):#retorna o objeto
        return next((a for a in self.vistorias if a.id == vistoria_id), None)
    
    def add(self, vistoria):
        self.vistorias.append(vistoria)
        self._save()

   
    def update(self, updated_vistorias):
        for i ,a in enumerate(self.vistorias):
            if a.id == updated_vistorias.id:
                self.vistorias[i] = updated_vistorias
                self._save()
                break
    def delete(self,vistoria_id):
        self.vistorias= [a for a in self.vistorias if a.id != vistoria_id]
        self._save()

      
        
    
         
        