% rebase('layout', title='Dashboard - Sistema')

<section class="dashboard-section">
    <div class="dashboard-header">
        <h1>
            <i class="fas fa-tachometer-alt"></i> 
            Bem-vindo, {{user.username}}!
        </h1>
        
        <div class="user-info">
            <span class="user-email">{{user.email}}</span>
            <form action="/logout" method="post" style="display: inline;">
                <button type="submit" class="btn btn-outline btn-sm">
                    <i class="fas fa-sign-out-alt"></i> Sair
                </button>
            </form>
        </div>
    </div>

    <div class="dashboard-content">
        <div class="dashboard-cards">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-users"></i>
                    <h3>Usuários</h3>
                </div>
                <div class="card-body">
                    <p>Gerencie os usuários do sistema</p>
                    <a href="/users" class="btn btn-primary">Ver Usuários</a>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <i class="fas fa-cog"></i>
                    <h3>Configurações</h3>
                </div>
                <div class="card-body">
                    <p>Ajuste as configurações do sistema</p>
                    <a href="#" class="btn btn-secondary">Configurar</a>
                </div>
            </div>
        </div>

        <div class="user-details">
            <h2>Informações da Conta</h2>
            <div class="info-grid">
                <div class="info-item">
                    <label>ID:</label>
                    <span>{{user.id}}</span>
                </div>
                <div class="info-item">
                    <label>Usuário:</label>
                    <span>{{user.username}}</span>
                </div>
                <div class="info-item">
                    <label>Email:</label>
                    <span>{{user.email}}</span>
                </div>
                <div class="info-item">
                    <label>Criado em:</label>
                    <span>{{user.created_at[:10]}}</span>
                </div>
            </div>
        </div>
    </div>
</section>