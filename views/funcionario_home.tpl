<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Home - Funcionários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        .welcome-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .welcome-title {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 1rem;
            text-align: center;
        }
        
        .subtitle {
            color: #6c757d;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.1rem;
        }
        
        .action-btn {
            border: none;
            border-radius: 15px;
            padding: 1rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .btn-list {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }
        
        .btn-list:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
        }
        
        .btn-add {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
        }
        
        .btn-add:hover {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
        }
        
        .btn-edit {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: white;
        }
        
        .btn-edit:hover {
            background: linear-gradient(45deg, #e67e22, #f39c12);
            color: white;
        }
        
        .btn-delete {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
        }
        
        .btn-delete:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            color: white;
        }
        
        .btn-time {
            background: linear-gradient(45deg, #9b59b6, #8e44ad);
            color: white;
        }
        
        .btn-time:hover {
            background: linear-gradient(45deg, #8e44ad, #9b59b6);
            color: white;
        }
        
        .user-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(45deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem auto;
            color: white;
            font-size: 2rem;
        }
        
        .container-custom {
            max-width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body class="d-flex flex-column align-items-center justify-content-center">

    <div class="container-custom">
        <div class="welcome-card">
            <!-- Avatar do usuário -->
            <div class="user-avatar">
                <i class="fas fa-user"></i>
            </div>
            
            <!-- Título de boas-vindas -->
            <h1 class="welcome-title">Bem-vindo, {{funcionario.name}}!</h1>
            <p class="subtitle">Escolha uma das opções abaixo para gerenciar o sistema</p>
            
            <!-- Botões de ação -->
            <div class="d-grid gap-3">
                <a href="/funcionarios/listar/{{funcionario.id}}" class="action-btn btn-list">
                    <i class="fas fa-list"></i>
                    Listar Funcionários
                </a>
                
                <a href="/funcionarios/cad/{{funcionario.id}}" class="action-btn btn-add">
                    <i class="fas fa-user-plus"></i>
                    Cadastrar Funcionário
                </a>
                
                <a href="/funcionario/edit/{{funcionario.id}}" class="action-btn btn-edit">
                    <i class="fas fa-edit"></i>
                    Editar Funcionário
                </a>
                
                <a href="/funcionarios/del/{{funcionario.id}}" class="action-btn btn-delete">
                    <i class="fas fa-trash"></i>
                    Deletar Funcionário
                </a>
                
                <a href="/funcionario/ponto/{{funcionario.id}}" class="action-btn btn-time">
                    <i class="fas fa-clock"></i>
                    Registrar Ponto
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>