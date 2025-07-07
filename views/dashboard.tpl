<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Sistema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }
        
        .dashboard-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 2px solid #e9ecef;
            position: relative;
        }
        
        .header-left {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .dashboard-header h1 {
            color: #2c3e50;
            font-weight: 700;
            font-size: 1.8rem;
            margin: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .user-email {
            color: #6c757d;
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .btn {
            border-radius: 12px;
            padding: 0.5rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-back {
            background: transparent;
            border: 2px solid #3498db;
            color: #3498db;
            padding: 0.4rem 1rem;
        }
        
        .btn-back:hover {
            background: #3498db;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .btn-outline {
            background: transparent;
            border: 2px solid #95a5a6;
            color: #95a5a6;
        }
        
        .btn-outline:hover {
            background: #95a5a6;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(149, 165, 166, 0.4);
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .btn-secondary {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
            color: white;
        }
        
        .btn-secondary:hover {
            background: linear-gradient(45deg, #7f8c8d, #95a5a6);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 140, 141, 0.4);
        }
        
        .btn-sm {
            padding: 0.4rem 1rem;
            font-size: 0.85rem;
        }
        
        .dashboard-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin-top: 1.5rem;
        }
        
        .dashboard-cards {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }
        
        .card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        
        .card-header {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            margin-bottom: 1rem;
        }
        
        .card-header i {
            font-size: 1.5rem;
            color: #3498db;
        }
        
        .card-header h3 {
            margin: 0;
            color: #2c3e50;
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .card-body p {
            color: #6c757d;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        
        .user-details {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            height: fit-content;
        }
        
        .user-details h2 {
            color: #2c3e50;
            font-weight: 600;
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .user-details h2::before {
            content: '\f007';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            color: #3498db;
        }
        
        .info-grid {
            display: grid;
            gap: 1rem;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid #3498db;
        }
        
        .info-item label {
            font-weight: 600;
            color: #2c3e50;
            margin: 0;
        }
        
        .info-item span {
            color: #6c757d;
            font-weight: 500;
        }
        
        @media (max-width: 992px) {
            .dashboard-content {
                grid-template-columns: 1fr;
            }
        }
        
        @media (max-width: 768px) {
            .dashboard-section {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .dashboard-header {
                flex-direction: column;
                gap: 1rem;
                align-items: flex-start;
            }
            
            .header-left {
                width: 100%;
                justify-content: space-between;
            }
            
            .dashboard-header h1 {
                font-size: 1.5rem;
            }
            
            .user-info {
                width: 100%;
                justify-content: space-between;
                margin-top: 10px;
                padding-top: 10px;
                border-top: 1px solid #eee;
            }
        }
        
        @media (max-width: 576px) {
            .header-left {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
            
            .user-info {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <section class="dashboard-section">
        <div class="dashboard-header">
            <div class="header-left">
                <!-- Botão Voltar integrado ao header -->
                <a href="javascript:history.back()" class="btn btn-back">
                    <i class="fas fa-arrow-left"></i> Voltar
                </a>
                
                <h1>
                    <i class="fas fa-tachometer-alt"></i> 
                    Bem-vindo, {{user.username}}!
                </h1>
            </div>
            
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
                        <i class="fas fa-car"></i>
                        <h3>Veículos</h3>
                    </div>
                    <div class="card-body">
                        <p>Gerencie os veículos cadastrados</p>
                        <a href="/veiculos" class="btn btn-primary">Ver Veículos</a>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <i class="fas fa-clipboard-list"></i>
                        <h3>Vistorias</h3>
                    </div>
                    <div class="card-body">
                        <p>Acompanhe as vistorias em andamento</p>
                        <a href="/vistorias" class="btn btn-primary">Ver Vistorias</a>
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
                        <label>Função:</label>
                        <span>
                            % if user.role == 0:
                                Administrador
                            % elif user.role == 1:
                                Funcionário
                            % else:
                                Cliente
                            % end
                        </span>
                    </div>
                    <div class="info-item">
                        <label>Criado em:</label>
                        <span>{{user.created_at[:10]}}</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>