% rebase('layout', title='Login')

<section class="auth-section">
    <div class="auth-container">
        <h1>Login</h1>
        
        % if defined('success'):
        <div class="alert alert-success">{{success}}</div>
        % end
        
        % if defined('error'):
        <div class="alert alert-error">{{error}}</div>
        % end
        
        <form action="/login" method="post" class="auth-form">
            <div class="form-group">
                <label for="username">Nome de usuário:</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Senha:</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Entrar</button>
        </form>
        
        <p class="auth-link">
            Não tem uma conta? <a href="/register">Cadastre-se aqui</a>
        </p>
    </div>
</section>