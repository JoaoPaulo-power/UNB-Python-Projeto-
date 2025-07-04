% rebase('layout', title='Dashboard')

<section class="dashboard-section">
    <div class="dashboard-header">
        <h1>Bem-vindo, {{user.username}}!</h1>
        <form action="/logout" method="post" style="display: inline;">
            <button type="submit" class="btn btn-secondary">Sair</button>
        </form>
    </div>
    
    <div class="dashboard-content">
        <div class="user-info">
            <h3>Suas Informações</h3>
            <p><strong>Usuário:</strong> {{user.username}}</p>
            <p><strong>Email:</strong> {{user.email}}</p>
            <p><strong>Conta criada em:</strong> {{user.created_at}}</p>
        </div>
        
        <div class="quick-actions">
            <h3>Ações Rápidas</h3>
            <a href="/users" class="btn btn-primary">Gerenciar Usuários</a>
            <a href="/activities" class="btn btn-primary">Ver Atividades</a>
        </div>
    </div>
</section>