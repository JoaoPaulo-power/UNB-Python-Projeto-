import os
from models.user import DATA_DIR


class Carro:
    def __init__(self,numero_chassi,ano,modelo='',marca='',problemas_id=None):
        self.numero_chassi=numero_chassi
        self.ano=ano
        self.modelo=modelo
        self.marca= marca
        self.problemas_id=problemas_id if problemas_id is not None else []
    
    def to_dict(self):
        return{
            'numero de chassi': self.numero_chassi,
            'ano':self.ano,
            'modelo': self.modelo,
            'marca': self.marca,
            'lista de problemas_id': self.problemas_id
        }
        
    @classmethod
    def from_dict(cls,data):
        return cls(
            numero_chassi=data['numero de chassi'],
            ano=data['ano'],
            modelo=data['modelo'],
            marca=data['marca'],
            problemas_id=data['lista de problemas_id']
        )
    
    

class CarrosModel:
    FILE_PATH = os.path.join(DATA_DIR, 'carros.json')

    def __init__(self):
        self.carros = self._load()

    def _load(self):
        import json,os
        if not os.path.exists(self.FILE_PATH):
            return []
        with open(self.FILE_PATH,'r', encoding='utf-8') as f:
            return [Carro.from_dict(item) for item in json.load(f)]
        
    def _save(self):
        import json
        with open (self.FILE_PATH,'w', encoding='utf-8') as f:
            json.dump([a.to_dict() for a  in self.carros], f, indent=4, ensure_ascii=False)


    def get_all(self):
        return self.carros
    
    def get_by_chassi(self, numero_chassi):
        return next((a for a in self.carros if a.numero_chassi == numero_chassi), None)
    
    def add(self, carro):
        self.carros.append(carro)
        self._save()

    def update(self, updated_carro):
        for i ,a in enumerate(self.carros):
            if a.numero_chassi == updated_carro.numero_chassi:
                self.carros[i] = updated_carro
                self._save()
                break
    def delete(self,numero_chassi):
        self.carros= [a for a in self.carros if a.id != numero_chassi]
        self._save()


