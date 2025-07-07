<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Navegação de Delete</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }
        
        .nav-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 600px;
            margin: 0 auto;
        }
        
        .nav-title {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 0.5rem;
            text-align: center;
            font-size: 1.8rem;
        }
        
        .nav-subtitle {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.1rem;
            font-weight: 600;
        }
        
        .delete-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem auto;
            color: white;
            font-size: 1.8rem;
        }
        
        .btn-delete {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            font-size: 1.1rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            width: 100%;
            justify-content: center;
            margin-bottom: 1rem;
        }
        
        .btn-delete:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }
        
        .btn-delete-vistoria {
            background: linear-gradient(45deg, #f39c12, #e67e22);
        }
        
        .btn-delete-vistoria:hover {
            background: linear-gradient(45deg, #e67e22, #f39c12);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(243, 156, 18, 0.4);
        }
        
        .btn-delete-pedido {
            background: linear-gradient(45deg, #9b59b6, #8e44ad);
        }
        
        .btn-delete-pedido:hover {
            background: linear-gradient(45deg, #8e44ad, #9b59b6);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(155, 89, 182, 0.4);
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
            margin-top: 2rem;
        }
        
        .btn-back:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            margin-bottom: 2rem;
        }
        
        .back-group {
            display: flex;
            justify-content: center;
        }
        
        .warning-text {
            background: rgba(231, 76, 60, 0.1);
            border-left: 4px solid #e74c3c;
            padding: 1rem;
            margin-bottom: 2rem;
            border-radius: 8px;
            color: #c0392b;
            font-weight: 600;
        }
        
        @media (max-width: 768px) {
            .nav-card {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .btn-delete, .btn-back {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body class="d-flex flex-column align-items-center justify-content-center">

    <div class="nav-card">
        <!-- Ícone de delete -->
        <div class="delete-icon">
            <i class="fas fa-trash-alt"></i>
        </div>
        
        <!-- Título da navegação -->
        <h2 class="nav-title">Navegação de Delete</h2>
        <p class="nav-subtitle">Para {{cliente.name}}</p>
        
        <!-- Aviso importante -->
        <div class="warning-text">
            <i class="fas fa-exclamation-triangle me-2"></i>
            Atenção: As exclusões são permanentes e não podem ser desfeitas.
        </div>
        
        <!-- Botões de navegação -->
        <div class="button-group">
            <a href="/clientes/del_car/{{cliente.id}}" class="btn-delete">
                <i class="fas fa-car me-2"></i>Deletar Carro
            </a>
            <a href="/clientes/del_vist/{{cliente.id}}" class="btn-delete btn-delete-vistoria">
                <i class="fas fa-clipboard-check me-2"></i>Deletar Vistoria
            </a>
            <a href="/clientes/del_ped/{{cliente.id}}" class="btn-delete btn-delete-pedido">
                <i class="fas fa-shopping-cart me-2"></i>Deletar Pedido
            </a>
        </div>
        
        <!-- Botão voltar -->
        <div class="back-group">
            <a href="/clientes/home/{{cliente.id}}" class="btn-back">
                <i class="fas fa-arrow-left me-2"></i>Voltar
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>