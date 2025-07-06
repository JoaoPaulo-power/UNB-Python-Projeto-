from bottle import request
from models.carro import Carro,CarrosModel  

class CarroService:    
    def __init__(self):
        self.carro_model= CarrosModel()

    def get_all(self):# lista todos os funcs
        self.carro_model.get_all()
        
    def save(self):
        last_numero_chassi = max([u.numero_chassi for u  in self.carro_model.get_all()], default=0)
        new_numero_chassi= last_numero_chassi + 1
        ano= request.forms.get('ano')
        modelo=request.forms.get('modelo')
        # entre aspas vai o nome do campo no form html
        marca = request.forms.get('marca')
        problemas= request.forms.get('problemas')
        
        carro=Carro(new_numero_chassi,ano,modelo,marca,problemas)
        self.carro_model.add(carro)
        
    def get_by_chassi(self,carro_numero_chassi):# retorna um exclusivo
        return self.carro_model.get_by_chassi(carro_numero_chassi)

    def edit_carro(self,carro_obj):# editando um funcionario e as sub
        carro_obj.ano = request.forms.get('ano')
        carro_obj.modelo = request.forms.get('modelo')
        carro_obj.marca = request.forms.get('marca')
        carro_obj.problemas= request.forms.get('problemas')
        
        self.carro_model.update(carro_obj)
    
    def delete_carro(self,carro_numero_chassi):
        self.carro_model.delete(carro_numero_chassi)
       