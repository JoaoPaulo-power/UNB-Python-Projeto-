from bottle import request
from models.vistorias import Vistoria, VistoriasModel

class VistoriaService:
    def __init__(self):
          self.vist_model= VistoriasModel()

    def get_all(self):# lista todos os funcs
        self.vist_model.get_all()
    
    def save(self):# cadastrar func
        last_id = max([u.id for u  in self.vist_model.get_all()], default=0)
        new_id= last_id + 1
        carro= request.forms.get('carro')
        funcionarios=request.forms.get('funcionarios')
        # entre aspas vai o nome do campo no form html
        prazo = request.forms.get('prazo')
        status= request.forms.get('status')
        
        vistoria= Vistoria(new_id,carro,status,funcionarios,prazo)
        self.vist_model.add(vistoria)
        
    def get_by_id(self,vist_id):
        return self.vist_model.get_by_id(vist_id)
    
    
    def edit_funcionario(self,vistoria_obj):# editando um funcionario e as sub
        vistoria_obj.carro = request.forms.get('carro')
        vistoria_obj.funcionarios = request.forms.get('funcionarios')
        vistoria_obj.prazo = request.forms.get('prazo')
        vistoria_obj.status= request.forms.get('status')
       
        self.funcionario_model.update(vistoria_obj)
        
    def delete_vistoria(self,vistoria_id):
        self.vist_model.delete(vistoria_id)
        
