<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Vistorias do Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }
        
        .container {
            max-width: 1000px;
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
        
        .surveys-container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            margin-bottom: 2rem;
        }
        
        .survey-card {
            border-bottom: 1px solid rgba(52, 152, 219, 0.1);
            padding: 2rem;
            transition: all 0.3s ease;
        }
        
        .survey-card:last-child {
            border-bottom: none;
        }
        
        .survey-card:hover {
            background: rgba(52, 152, 219, 0.05);
            transform: translateX(5px);
        }
        
        .survey-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .survey-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
            flex-shrink: 0;
        }
        
        .survey-id {
            font-size: 1.3rem;
            font-weight: 700;
            color: #2c3e50;
        }
        
        .survey-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }
        
        .detail-item {
            background: rgba(52, 152, 219, 0.05);
            border-radius: 10px;
            padding: 1rem;
            border-left: 4px solid #27ae60;
        }
        
        .detail-label {
            font-weight: 600;
            color: #2c3e50;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .detail-value {
            color: #34495e;
            font-size: 1.1rem;
            font-weight: 500;
            font-family: 'Courier New', monospace;
        }
        
        .status-badge {
            display: inline-block;
            padding: 0.25rem 0.8rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
        }
        
        .status-agendada {
            background: #fff3cd;
            color: #856404;
        }
        
        .status-em-andamento {
            background: #d1ecf1;
            color: #0c5460;
        }
        
        .status-concluida {
            background: #d4edda;
            color: #155724;
        }
        
        .status-cancelada {
            background: #f8d7da;
            color: #721c24;
        }
        
        .status-pendente {
            background: #e2e3e5;
            color: #383d41;
        }
        
        .no-surveys {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 3rem;
            text-align: center;
            color: #7f8c8d;
            font-size: 1.1rem;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            margin-bottom: 2rem;
        }
        
        .no-surveys-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: linear-gradient(45deg, #bdc3c7, #95a5a6);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1rem auto;
            color: white;
            font-size: 2rem;
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
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .page-header {
                padding: 1.5rem;
            }
            
            .survey-details {
                grid-template-columns: 1fr;
            }
            
            .survey-header {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <div class="page-icon">
                <i class="fas fa-search"></i>
            </div>
            <h2 class="page-title">Vistorias do Cliente</h2>
            <p class="page-subtitle">{{cliente.name}}</p>
        </div>

        % if vistorias:
            <div class="surveys-container">
                % for vistoria in vistorias:
                    <div class="survey-card">
                        <div class="survey-header">
                            <div class="survey-icon">
                                <i class="fas fa-clipboard-check"></i>
                            </div>
                            <div class="survey-id">Vistoria #{{vistoria.id}}</div>
                        </div>
                        
                        <div class="survey-details">
                            <div class="detail-item">
                                <div class="detail-label">
                                    <i class="fas fa-car"></i>
                                    ID do Carro
                                </div>
                                <div class="detail-value">{{vistoria.carro_id}}</div>
                            </div>
                            
                            <div class="detail-item">
                                <div class="detail-label">
                                    <i class="fas fa-user-tie"></i>
                                    ID do Funcionário
                                </div>
                                <div class="detail-value">{{vistoria.funcionarios_id}}</div>
                            </div>
                            
                            <div class="detail-item">
                                <div class="detail-label">
                                    <i class="fas fa-calendar-alt"></i>
                                    Prazo
                                </div>
                                <div class="detail-value">{{vistoria.prazo}}</div>
                            </div>
                            
                            <div class="detail-item">
                                <div class="detail-label">
                                    <i class="fas fa-info-circle"></i>
                                    Status
                                </div>
                                <div class="detail-value">
                                    <span class="status-badge status-{{vistoria.status.lower().replace(' ', '-')}}">
                                        {{vistoria.status}}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                % end
            </div>
        % else:
            <div class="no-surveys">
                <div class="no-surveys-icon">
                    <i class="fas fa-search-minus"></i>
                </div>
                <h4 style="color: #7f8c8d; margin-bottom: 1rem;">Nenhuma vistoria registrada</h4>
                <p>Este cliente ainda não possui vistorias cadastradas no sistema.</p>
            </div>
        % end

        <div class="back-container">
            <a href="/clientes/home/{{cliente.id}}" class="btn-back">
                <i class="fas fa-arrow-left"></i>
                Voltar para Início
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>
</html>