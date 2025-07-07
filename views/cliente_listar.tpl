<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Navegação de Listagem</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #74b9ff 0%, #0984e3 100%);
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
            font-size: 1.1rem;
        }
        
        .action-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .btn-cars {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }
        
        .btn-cars:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
        }
        
        .btn-inspections {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
        }
        
        .btn-inspections:hover {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
        }
        
        .btn-orders {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: white;
        }
        
        .btn-orders:hover {
            background: linear-gradient(45deg, #e67e22, #f39c12);
            color: white;
        }
        
        .btn-back {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
            margin-top: 1rem;
        }
        
        .btn-back:hover {
            background: linear-gradient(45deg, #7f8c8d, #95a5a6);
            color: white;
            transform: translateY(-1px);
        }
        
        .nav-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(45deg, #74b9ff, #0984e3);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem auto;
            color: white;
            font-size: 1.5rem;
        }
        
        .container-custom {
            max-width: 500px;
            margin: 0 auto;
        }
        
        .back-section {
            text-align: center;
            margin-top: 1.5rem;
        }
    </style>
</head>
<body class="d-flex flex-column align-items-center justify-content-center">

    <div class="container-custom">
        <div class="welcome-card">
            <!-- Ícone de navegação -->
            <div class="nav-icon">
                <i class="fas fa-list-ul"></i>
            </div>
            
            <!-- Título de navegação -->
            <h1 class="welcome-title">Navegação de Listagem</h1>
            <p class="subtitle">Escolha qual tipo de informação deseja visualizar</p>
            
            <!-- Botões de ação -->
            <div class="d-grid gap-3">
                <a href="/clientes/car/{{cliente.id}}" class="action-btn btn-cars">
                    <i class="fas fa-car"></i>
                    Listar Carros
                </a>
                
                <a href="/clientes/vist/{{cliente.id}}" class="action-btn btn-inspections">
                    <i class="fas fa-clipboard-check"></i>
                    Listar Vistorias
                </a>
                
                <a href="/clientes/ped/{{cliente.id}}" class="action-btn btn-orders">
                    <i class="fas fa-shopping-cart"></i>
                    Listar Pedidos
                </a>
            </div>
            
            <!-- Botão de voltar -->
            <div class="back-section">
                <a href="/clientes/home/{{cliente.id}}" class="btn-back">
                    <i class="fas fa-arrow-left"></i>
                    Voltar ao Menu Principal
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>