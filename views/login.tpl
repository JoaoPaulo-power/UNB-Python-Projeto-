% rebase('layout', title='Login - Sistema')

<section class="auth-section">
    <div class="auth-container">
        <div class="auth-header">
            <h1>Login</h1>
            <p>Entre com suas credenciais</p>
        </div>

        % if error:
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            {{error}}
        </div>
        % end

        <form action="/login" method="post" class="auth-form">
            <div class="form-group">
                <label for="username">
                    <i class="fas fa-user"></i> Usuário
                </label>
                <input type="text" id="username" name="username" required 
                       placeholder="Digite seu usuário">
            </div>

            <div class="form-group">
                <label for="password">
                    <i class="fas fa-lock"></i> Senha
                </label>
                <input type="password" id="password" name="password" required 
                       placeholder="Digite sua senha">
            </div>

            <button type="submit" class="btn btn-primary btn-full">
                <i class="fas fa-sign-in-alt"></i> Entrar
            </button>
        </form>

        <div class="auth-footer">
            <p>Não tem uma conta? <a href="/register">Registre-se aqui</a></p>
        </div>
    </div>
</section>