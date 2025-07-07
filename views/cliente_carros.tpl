<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }
        
        .container {
            max-width: 900px;
        }
        
        .page-header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .page-icon {
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
        
        .page-title {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
        }
        
        .page-subtitle {
            color: #3498db;
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
        }
        
        .section-divider {
            display: flex;
            align-items: center;
            margin: 2rem 0 1.5rem 0;
        }
        
        .section-divider hr {
            flex-grow: 1;
            border: none;
            height: 2px;
            background: linear-gradient(45deg, #3498db, #2980b9);
            margin: 0;
        }
        
        .section-title {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 25px;
            padding: 0.75rem 1.5rem;
            margin: 0 1rem;
            color: #2c3e50;
            font-weight: 700;
            font-size: 1.1rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .car-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 1.5rem;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .car-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
        }
        
        .car-info {
            padding: 1.5rem;
        }
        
        .info-row {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
            padding: 0.75rem;
            background: rgba(52, 152, 219, 0.05);
            border-radius: 10px;
            border-left: 4px solid #3498db;
        }
        
        .info-row:last-child {
            margin-bottom: 0;
        }
        
        .info-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(45deg, #3498db, #2980b9);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1rem;
            margin-right: 1rem;
            flex-shrink: 0;
        }
        
        .info-content {
            flex-grow: 1;
        }
        
        .info-label {
            font-weight: 600;
            color: #2c3e50;
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }
        
        .info-value {
            color: #34495e;
            font-size: 1.1rem;
            font-weight: 500;
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
            margin: 2rem auto;
            font-size: 1.1rem;
        }
        
        .btn-back:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .back-container {
            text-align: center;
            margin-top: 2rem;
        }
        
        .no-cars {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 3rem;
            text-align: center;
            color: #7f8c8d;
            font-size: 1.1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .page-header {
                padding: 1.5rem;
            }
            
            .car-info {
                padding: 1rem;
            }
            
            .info-row {
                flex-direction: column;
                text-align: center;
                gap: 0.5rem;
            }
            
            .info-icon {
                margin-right: 0;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Cabeçalho da página -->
        <div class="page-header">
            <div class="page-icon">
                <i class="fas fa-car"></i>
            </div>
            <h1 class="page-title">Carros do Cliente</h1>
            <p class="page-subtitle">Para {{cliente.name}}</p>
        </div>

        % for carro in carros:
        <!-- Divisor de seção -->
        <div class="section-divider">
            <hr>
            <div class="section-title">
                <i class="fas fa-car me-2"></i>Carros Registrados
            </div>
            <hr>
        </div>

        <!-- Card do carro -->
        <div class="car-card">
            <div class="car-info">
                <div class="info-row">
                    <div class="info-icon">
                        <i class="fas fa-barcode"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Número do Chassi</div>
                        <div class="info-value">{{carro.numero_chassi}}</div>
                    </div>
                </div>
                
                <div class="info-row">
                    <div class="info-icon">
                        <i class="fas fa-car-side"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Modelo</div>
                        <div class="info-value">{{carro.modelo}}</div>
                    </div>
                </div>
                
                <div class="info-row">
                    <div class="info-icon">
                        <i class="fas fa-calendar-alt"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Ano</div>
                        <div class="info-value">{{carro.ano}}</div>
                    </div>
                </div>
                
                <div class="info-row">
                    <div class="info-icon">
                        <i class="fas fa-industry"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">Marca</div>
                        <div class="info-value">{{carro.marca}}</div>
                    </div>
                </div>
                
                <div class="info-row">
                    <div class="info-icon">
                        <i class="fas fa-exclamation-triangle"></i>
                    </div>
                    <div class="info-content">
                        <div class="info-label">ID dos Problemas</div>
                        <div class="info-value">{{carro.problemas_id}}</div>
                    </div>
                </div>
            </div>
        </div>
        % end

        <!-- Botão voltar -->
        <div class="back-container">
            <a href="/clientes/home/{{cliente.id}}" class="btn-back">
                <i class="fas fa-arrow-left"></i>
                Voltar para Início
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>