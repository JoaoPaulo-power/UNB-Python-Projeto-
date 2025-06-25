from user import User

class Fucionario(User):
    def __init__(self, id, name, email, birthdate,lista_pedidos,lista_vistorias,salario):
        super().__init__(id, name, email, birthdate)
        self.lista_pedidos=lista_pedidos
        self.lista_vistorias=lista_vistorias