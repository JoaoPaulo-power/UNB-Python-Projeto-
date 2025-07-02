from bottle import request
from models.problema import Problema,ProblemaModel

class ProblemaService:
    def __init__(self):
        self.problema_model=ProblemaModel()
        
    def get_all(self):# lista todos os funcs
        self.problema_model.get_all()
    
    def save(self):
        last_id = max([u.id for u  in self.problema_model.get_all()], default=0)
        new_id= last_id + 1
        peca= request.forms.get('peca')
        preco=request.forms.get('preco')
        # entre aspas vai o nome do campo no form html
        problema=Problema(new_id,peca,preco)
        self.problema_model.add(problema)


    def edit_problema(self,problema_obj):# editando um funcionario e as sub
        
        problema_obj.ano = request.forms.get('ano')
        problema_obj.modelo = request.forms.get('modelo')
        problema_obj.marca = request.forms.get('marca')
        problema_obj.problemas= request.forms.get('problemas')
        
        self.problema_model.update(problema_obj)
        
    def get_by_id(self,id_problema):# retorna um exclusivo
        return self.problema_model.get_by_chassi(id_problema)

    def delete_problema(self,id_problema):
        self.problema_model.delete(id_problema)

        
