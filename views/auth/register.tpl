% rebase('layout', title='Cadastro')

<section class="auth-section">
    <div class="auth-container">
        <h1>Criar Conta</h1>
        
        % if defined('errors'):
        <div class="alert alert-error">
            <ul>
            % for error in errors:
                <li>{{error}}</li>
            % end
            </ul>
        </div>
        % end
        
        <form action="/register" method="post" class="auth-form">
            <div class="form-group">
                <label for="username">Nome de usuário:</label>
                <input type="text" id="username" name="username" required minlength="3">
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Senha:</label>
                <input type="password" id="password" name="password" required minlength="6">
            </div>
            
            <div class="form-group">
                <label for="confirm_password">Confirmar senha:</label>
                <input type="password" id="confirm_password" name="confirm_password" required>
            </div>
            
            <button type="submit" class="btn btn-primary">Cadastrar</button>
        </form>
        
        <p class="auth-link">
            Já tem uma conta? <a href="/login">Faça login aqui</a>
        </p>
    </div>
</section>