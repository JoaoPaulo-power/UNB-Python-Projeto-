from functools import wraps
from bottle import request, redirect
from services.auth_service import AuthService

def require_auth(func):
    """Decorator para exigir autenticação em rotas"""
    @wraps(func)
    def wrapper(*args, **kwargs):
        auth_service = AuthService()
        current_user = auth_service.get_current_user()
        
        if not current_user:
            return redirect('/login')
        
        
        request.current_user = current_user
        return func(*args, **kwargs)
    
    return wrapper