from bottle import Bottle, request
from controllers.base_controller import BaseController
from services.funcionario_service import FuncionarioService

class FuncionarioController(BaseController):
    def __init__(self, app):
        super().__init__(app)
        self.func_service=FuncionarioService()
        self.setup_routes()

    def setup_routes(self):
        self.app.route('/funcionarios',method='GET',callback=self.listar_funcionarios)
        self.app.route('/funcionarios/add',method=['GET','POST'],callback=self.add_funcionario)
        self.app.route('/funcionarios/edit/<funcionario_id:int>',method=['GET','POST'],callback=self.edit_funcionario)
        self.app.route('/funcionarios/delete/<funcionario_id:int>',method='POST',callback=self.delete_funcionario)
        
    
    def listar_funcionarios(self):
        funcionarios=self.func_service.get_all()
        return self.render('funcionarios',funcionarios=funcionarios)
    
    def add_funcionario(self):
        if request.method== 'GET':
            return self.render('funcionarios_form',funcionarios=None, action= '/funcionarios/add')
        else: #-> POST
            self.func_service.save()
            self.redirect('/funcionarios')

    def edit_funcionario(self,funcionario_id):
        funcionario= self.func_service.get_by_id(funcionario_id)
        if not funcionario:
            return 'funcionario não cadastrado'
        if request.method=='GET':
            return self.render('funcionarios_form', funcionario=funcionario, action= f"funcionarios/edit/{funcionario_id}")
        else:# -> POST
            self.func_service.edit_funcionario(funcionario)
            self.redirect('/funcionario')
            
    def delete_funcionario(self,funcionario_id):
        self.func_service.delete_funcionario(funcionario_id)
        self.redirect('/funcionario')

    def pegar_vistoria(self):
        ...
    def cad_problema(self):
        ...
    def entregar_vistoria(self):
        ...
    def pegar_pedido(self):
        ...
    def lacar_progresso(self):
        ...
    def listar_pedidos(self):
        ...
    def listar_vistorias(self):
        ...
    def listar_salario(self):
        ...
        
        
func_routes= Bottle()
func_controller= FuncionarioController(func_routes)
