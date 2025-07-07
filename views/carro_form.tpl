<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Carro</title>
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
        
        .car-icon {
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
        
        .form-label {
            font-weight: 600;
            color: #2c3e50;
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            border-radius: 12px;
            border: 2px solid #e9ecef;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }
        
        .input-group {
            margin-bottom: 1.5rem;
        }
        
        .input-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 5;
        }
        
        .form-control-icon {
            padding-left: 2.5rem;
        }
        
        .btn-submit {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            font-size: 1.1rem;
        }
        
        .btn-submit:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
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
        }
        
        .btn-back:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .button-group {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        @media (max-width: 768px) {
            .button-group {
                flex-direction: column;
                align-items: center;
            }
            
            .btn-submit, .btn-back {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body class="d-flex flex-column align-items-center justify-content-center">

    <div class="form-card">
        <!-- Ícone do carro -->
        <div class="car-icon">
            <i class="fas fa-car"></i>
        </div>
        
        <!-- Título do formulário -->
        <h2 class="form-title">Cadastro de Carro</h2>
        <p class="form-subtitle">Para {{cliente.name}}</p>
        
        <!-- Formulário -->
        <form action="{{action}}" method="post">
            <div class="input-group">
                <label for="modelo" class="form-label">
                    <i class="fas fa-car-side me-2"></i>Modelo
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-car-side input-icon"></i>
                    <input type="text" class="form-control form-control-icon" id="modelo" name="modelo" 
                           placeholder="Ex: Doblô, Civic, Corolla" required>
                </div>
            </div>
            
            <div class="input-group">
                <label for="Marca" class="form-label">
                    <i class="fas fa-industry me-2"></i>Marca
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-industry input-icon"></i>
                    <input type="text" class="form-control form-control-icon" id="Marca" name="marca" 
                           placeholder="Ex: Fiat, Honda, Toyota" required>
                </div>
            </div>

            <div class="input-group">
                <label for="ano" class="form-label">
                    <i class="fas fa-calendar-alt me-2"></i>Ano
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-calendar-alt input-icon"></i>
                    <input type="number" class="form-control form-control-icon" id="ano" name="ano" 
                           placeholder="Ex: 2020" min="1900" max="2030" required>
                </div>
            </div>
            
            <div class="input-group">
                <label for="numero_chassi" class="form-label">
                    <i class="fas fa-barcode me-2"></i>Número do Chassi
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-barcode input-icon"></i>
                    <input type="text" class="form-control form-control-icon" id="numero_chassi" name="numero_chassi" 
                           placeholder="Ex: 9BD12345678901234" required>
                </div>
            </div>
            
            <!-- Botões -->
            <div class="button-group">
                <button type="submit" class="btn-submit">
                    <i class="fas fa-save me-2"></i>Cadastrar Carro
                </button>
                <a href="/clientes/cad/{{cliente.id}}" class="btn-back">
                    <i class="fas fa-arrow-left me-2"></i>Voltar
                </a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>