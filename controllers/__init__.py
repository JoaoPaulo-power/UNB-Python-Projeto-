
from bottle import Bottle
from controllers.user_controller import user_routes
from controllers.auth_controller import auth_routes
from controllers.funcionarios_controller import func_routes
from controllers.cliente_controller import cliente_routes

def init_controllers(app: Bottle):
    app.merge(user_routes)
    app.merge(auth_routes)
    app.merge(user_routes)
    app.merge(func_routes)
    app.merge(cliente_routes)
