% rebase('layout', title='Registro - Sistema')

<section class="auth-section">
    <div class="auth-container">
        <div class="auth-header">
            <h1>Criar Conta</h1>
            <p>Preencha os dados para criar sua conta</p>
        </div>

        % if error:
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            {{error}}
        </div>
        % end

        % if success:
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            {{success}} - <a href="/login">Fazer Login</a>
        </div>
        % end

        <form action="/register" method="post" class="auth-form">
            <div class="form-group">
                <label for="username">
                    <i class="fas fa-user"></i> Usuário
                </label>
                <input type="text" id="username" name="username" required 
                       placeholder="Digite um nome de usuário">
            </div>

            <div class="form-group">
                <label for="email">
                    <i class="fas fa-envelope"></i> Email
                </label>
                <input type="email" id="email" name="email" required 
                       placeholder="Digite seu email">
            </div>

            <div class="form-group">
                <label for="password">
                    <i class="fas fa-lock"></i> Senha
                </label>
                <input type="password" id="password" name="password" required 
                       placeholder="Digite sua senha (mín. 6 caracteres)">
            </div>

            <div class="form-group">
                <label for="confirm_password">
                    <i class="fas fa-lock"></i> Confirmar Senha
                </label>
                <input type="password" id="confirm_password" name="confirm_password" required 
                       placeholder="Confirme sua senha">
            </div>

            <button type="submit" class="btn btn-primary btn-full">
                <i class="fas fa-user-plus"></i> Criar Conta
            </button>
        </form>

        <div class="auth-footer">
            <p>Já tem uma conta? <a href="/login">Faça login aqui</a></p>
        </div>
    </div>
</section>