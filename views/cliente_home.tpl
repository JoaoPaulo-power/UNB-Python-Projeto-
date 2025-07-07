<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Home - Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2c3e50;
            --accent-color: #1abc9c;
            --light-color: #ecf0f1;
            --text-dark: #2c3e50;
            --text-light: #7f8c8d;
        }
        
        body {
            background: linear-gradient(135deg, #ecf0f1 0%, #d6dbdf 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            margin: 0;
            padding: 0;
            color: var(--text-dark);
        }
        
        /* Header profissional */
        .user-header {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 700;
            font-size: 1.2rem;
            color: var(--secondary-color);
            text-decoration: none;
        }
        
        .logo-icon {
            color: var(--primary-color);
            font-size: 1.5rem;
        }
        
        .user-btn {
            background: linear-gradient(45deg, var(--primary-color), #2980b9);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 10px 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            box-shadow: 0 4px 10px rgba(52, 152, 219, 0.2);
        }
        
        .user-btn:hover {
            background: linear-gradient(45deg, #2980b9, var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(52, 152, 219, 0.3);
        }
        
        /* Conteúdo principal */
        .container-custom {
            max-width: 500px;
            margin: 0 auto;
            padding-top: 90px; /* Espaço para o header */
            padding-bottom: 40px;
        }
        
        .welcome-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            border: 1px solid rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }
        
        .welcome-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .welcome-title {
            color: var(--secondary-color);
            font-weight: 700;
            margin-bottom: 1rem;
            text-align: center;
            font-size: 1.8rem;
        }
        
        .subtitle {
            color: var(--text-light);
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.1rem;
            line-height: 1.6;
        }
        
        .action-btn {
            border: none;
            border-radius: 12px;
            padding: 1.1rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            width: 100%;
            margin-bottom: 15px;
            font-size: 1rem;
            color: white;
        }
        
        .action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
        }
        
        .btn-list {
            background: linear-gradient(45deg, #3498db, #2980b9);
        }
        
        .btn-add {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
        }
        
        .btn-edit {
            background: linear-gradient(45deg, #f39c12, #e67e22);
        }
        
        .btn-delete {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
        }
        
        .btn-payment {
            background: linear-gradient(45deg, #16a085, #1abc9c);
        }
        
        .user-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem auto;
            color: white;
            font-size: 2.5rem;
            border: 3px solid white;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Efeito de onda decorativo */
        .wave-bg {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100px;
            background: url('data:image/svg+xml;utf8,<svg viewBox="0 0 1200 120" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="none"><path d="M0 0v46.29c47.79 22.2 103.59 32.17 158 28 70.36-5.37 136.33-33.31 206.8-37.5 73.84-4.36 147.54 16.88 218.2 35.26 69.27 18 138.3 24.88 209.4 13.08 36.15-6 69.85-17.84 104.45-29.34C989.49 25 1113-14.29 1200 52.47V0z" fill="%233498db" opacity="0.1"/></svg>');
            background-size: cover;
            background-repeat: no-repeat;
            z-index: -1;
        }
        
        /* Responsividade */
        @media (max-width: 576px) {
            .container-custom {
                padding: 20px;
                padding-top: 80px;
            }
            
            .user-header {
                padding: 12px 20px;
            }
            
            .user-btn {
                padding: 8px 16px;
                font-size: 0.9rem;
            }
            
            .welcome-card {
                padding: 1.8rem;
            }
            
            .welcome-title {
                font-size: 1.6rem;
            }
            
            .user-avatar {
                width: 85px;
                height: 85px;
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header profissional -->
    <div class="user-header">
        <a href="/" class="logo">
            <i class="fas fa-car logo-icon"></i>
            <span>Fachada</span>
        </a>
        
        <a href="/dashboard" class="user-btn">
            <i class="fas fa-user-circle"></i>
            Usuário
        </a>
    </div>

    <!-- Conteúdo principal -->
    <div class="container-custom">
        <div class="welcome-card">
            <!-- Avatar do usuário -->
            <div class="user-avatar">
                <i class="fas fa-user-tie"></i>
            </div>
            
            <!-- Título de boas-vindas -->
            <h1 class="welcome-title">Bem-vindo, {{cliente.name}}!</h1>
            <p class="subtitle">Escolha uma das opções abaixo para gerenciar seus veículos e serviços em nossa plataforma.</p>
            
            <!-- Botões de ação -->
            <div class="d-grid">
                <a href="/clientes/listar/{{cliente.id}}" class="action-btn btn-list">
                    <i class="fas fa-car"></i>
                    Listar Veículos
                </a>
                
                <a href="/clientes/cad/{{cliente.id}}" class="action-btn btn-add">
                    <i class="fas fa-plus-circle"></i>
                    Adicionar Veículo
                </a>
                
                <a href="/cliente/edit/{{cliente.id}}" class="action-btn btn-edit">
                    <i class="fas fa-edit"></i>
                    Editar Perfil
                </a>
                
                <a href="/clientes/del/{{cliente.id}}" class="action-btn btn-delete">
                    <i class="fas fa-trash-alt"></i>
                    Remover Veículo
                </a>
                
                <a href="/cliente/pagar/{{cliente.id}}" class="action-btn btn-payment">
                    <i class="fas fa-credit-card"></i>
                    Pagamentos
                </a>
            </div>
        </div>
    </div>

    <!-- Elemento decorativo -->
    <div class="wave-bg"></div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>