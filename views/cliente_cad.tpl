<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Navegação de Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }
        
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 600px;
            margin: 0 auto;
        }
        
        .form-title {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-align: center;
            font-size: 1.8rem;
        }
        
        .form-subtitle {
            color: #3498db;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.1rem;
            font-weight: 600;
        }
        
        .nav-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(45deg, #2c3e50, #3498db);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem auto;
            color: white;
            font-size: 1.8rem;
        }
        
        .nav-buttons {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .btn-nav {
            border: none;
            border-radius: 12px;
            padding: 1rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            font-size: 1.1rem;
            min-height: 60px;
        }
        
        .btn-nav:hover {
            transform: translateY(-2px);
            text-decoration: none;
        }
        
        .btn-car {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
        }
        
        .btn-car:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            color: white;
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }
        
        .btn-vistoria {
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
        }
        
        .btn-vistoria:hover {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.4);
        }
        
        .btn-pedido {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: white;
        }
        
        .btn-pedido:hover {
            background: linear-gradient(45deg, #e67e22, #f39c12);
            color: white;
            box-shadow: 0 5px 15px rgba(243, 156, 18, 0.4);
        }
        
        .btn-back {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin: 0 auto;
        }
        
        .btn-back:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .back-container {
            text-align: center;
        }
        
        @media (max-width: 768px) {
            .form-card {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .btn-nav {
                font-size: 1rem;
                padding: 0.75rem 1.5rem;
            }
        }
    </style>
</head>
<body class="d-flex flex-column align-items-center justify-content-center">

    <div class="form-card">
        <!-- Ícone de navegação -->
        <div class="nav-icon">
            <i class="fas fa-plus-circle"></i>
        </div>
        
        <!-- Título -->
        <h2 class="form-title">Navegação de Cadastro</h2>
        <p class="form-subtitle">Para {{cliente.name}}</p>
        
        <!-- Botões de navegação -->
        <div class="nav-buttons">
            <a href="/clientes/cad_car/{{cliente.id}}" class="btn-nav btn-car">
                <i class="fas fa-car"></i>
                Cadastrar Carro
            </a>
            <a href="/clientes/cad_vist/{{cliente.id}}" class="btn-nav btn-vistoria">
                <i class="fas fa-search"></i>
                Cadastrar Vistoria
            </a>
            <a href="/clientes/cad_ped/{{cliente.id}}" class="btn-nav btn-pedido">
                <i class="fas fa-clipboard-list"></i>
                Cadastrar Pedido
            </a>
        </div>
        
        <!-- Botão voltar -->
        <div class="back-container">
            <a href="/clientes/home/{{cliente.id}}" class="btn-back">
                <i class="fas fa-arrow-left"></i>
                Voltar
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
