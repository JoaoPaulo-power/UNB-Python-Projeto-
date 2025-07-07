import os
from models.user import DATA_DIR

class Problema:
    def __init__(self,id=0,peca='',preco=0):
        self.id=id
        self.peca=peca
        self.preco=preco
        
    def to_dict(self):
        return{
            'id': self.id,
            'peça': self.peca,
            'preço': self.preco
        }
        
    @classmethod
    def from_dict(cls, data):
        return cls(
            id=data['id'],
            peca=data['peça'],
            preco=data['preço']
        )
    
class ProblemaModel:
    FILE_PATH = os.path.join(DATA_DIR, 'problemas.json')
        
    def __init__(self):
        self.problemas = self._load()

    def _load(self):
        import json,os
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH,'r', encoding='utf-8') as f:
            return [Problema.from_dict(item) for item in json.load(f)]

    def _save(self):
        import json
        with open (self.FILE_PATH,'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a  in self.problemas], f, indent=4, ensure_ascii=False)

    def get_all(self):
        return self.problemas
    
    def get_by_id(self, problemas_id):
        return next((a for a in self.problemas if a.id == problemas_id), None)
    
    def add(self, problema):
        self.problemas.append(problema)
        self._save()

    def update(self, updated_problema):
        for i ,a in enumerate(self.problemas):
            if a.id == updated_problema.id:
                self.problemas[i] = updated_problema
                self._save()
                break
            
    def delete(self,problema_id):
        self.problemas= [a for a in self.problemas if a.id != problema_id]
        self._save()
    
    
