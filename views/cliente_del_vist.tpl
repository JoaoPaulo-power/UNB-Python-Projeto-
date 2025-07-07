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
            max-width: 800px;
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
        
        .survey-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1.5rem;
            border-bottom: 1px solid rgba(52, 152, 219, 0.1);
            transition: all 0.3s ease;
        }
        
        .survey-item:last-child {
            border-bottom: none;
        }
        
        .survey-item:hover {
            background: rgba(52, 152, 219, 0.05);
            transform: translateX(5px);
        }
        
        .survey-info {
            display: flex;
            align-items: center;
            gap: 1rem;
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
        
        .survey-details {
            flex-grow: 1;
        }
        
        .survey-label {
            font-weight: 600;
            color: #2c3e50;
            font-size: 0.9rem;
            margin-bottom: 0.25rem;
        }
        
        .survey-value {
            color: #34495e;
            font-size: 1.1rem;
            font-weight: 500;
            font-family: 'Courier New', monospace;
        }
        
        .btn-delete {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 0.5rem 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-delete:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
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
        
        .delete-form {
            margin: 0;
            padding: 0;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            
            .page-header {
                padding: 1.5rem;
            }
            
            .survey-item {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .survey-info {
                flex-direction: column;
                text-align: center;
            }
            
            .btn-delete {
                width: 100%;
                justify-content: center;
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

        % if vistorias_ids:
            <div class="surveys-container">
                % for id_vist in vistorias_ids:
                    <div class="survey-item">
                        <div class="survey-info">
                            <div class="survey-icon">
                                <i class="fas fa-clipboard-check"></i>
                            </div>
                            <div class="survey-details">
                                <div class="survey-label">ID da Vistoria</div>
                                <div class="survey-value">{{id_vist}}</div>
                            </div>
                        </div>
                        <form method="post" action="{{action}}" class="delete-form">
                            <input type="hidden" name="id_vistoria" value="{{id_vist}}">
                            <button type="submit" class="btn-delete" onclick="return confirm('Tem certeza que deseja excluir esta vistoria?')">
                                <i class="fas fa-trash"></i>
                                Excluir
                            </button>
                        </form>
                    </div>
                % end
            </div>
        % else:
            <div class="no-surveys">
                <div class="no-surveys-icon">
                    <i class="fas fa-search-minus"></i>
                </div>
                <h4 style="color: #7f8c8d; margin-bottom: 1rem;">Nenhuma vistoria registrada</h4>
                <p>Este cliente não possui vistorias cadastradas no sistema.</p>
            </div>
        % end

        <div class="back-container">
            <a href="/clientes/home/{{cliente.id}}" class="btn-back">
                <i class="fas fa-arrow-left"></i>
                Voltar
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
</body>
</html>