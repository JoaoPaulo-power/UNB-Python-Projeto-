<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Confirmação de Dados</title>
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
            max-width: 500px;
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
        
        .user-icon {
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
            background: linear-gradient(45deg, #27ae60, #2ecc71);
            color: white;
            border: none;
            border-radius: 12px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            font-size: 1.1rem;
        }
        
        .btn-submit:hover {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.4);
        }
        
        .btn-back {
            background: linear-gradient(45deg, #95a5a6, #7f8c8d);
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
            background: linear-gradient(45deg, #7f8c8d, #95a5a6);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 140, 141, 0.4);
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
        
        .info-box {
            background: rgba(52, 152, 219, 0.1);
            border-left: 4px solid #3498db;
            padding: 1rem;
            margin-bottom: 2rem;
            border-radius: 8px;
            color: #2c3e50;
            font-weight: 500;
        }
        
        .date-helper {
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 0.25rem;
        }
        
        @media (max-width: 768px) {
            .form-card {
                padding: 1.5rem;
                margin: 1rem;
            }
            
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
        <!-- Ícone do usuário -->
        <div class="user-icon">
            <i class="fas fa-user-check"></i>
        </div>
        
        <!-- Título do formulário -->
        <h2 class="form-title">Confirmação de Dados</h2>
        <p class="form-subtitle">Por favor confirme seus dados</p>
        
        <!-- Caixa informativa -->
        <div class="info-box">
            <i class="fas fa-info-circle me-2"></i>
            Para sua segurança, precisamos confirmar sua data de nascimento.
        </div>
        
        <!-- Formulário -->
        <form action="{{action}}" method="post">
            <div class="input-group">
                <label for="data_nascimento" class="form-label">
                    <i class="fas fa-calendar-day me-2"></i>Data de Nascimento
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-calendar-day input-icon"></i>
                    <input type="date" class="form-control form-control-icon" id="data_nascimento" name="data_nascimento" required>
                </div>
                <div class="date-helper">
                    <i class="fas fa-question-circle me-1"></i>
                    Use o formato DD/MM/AAAA ou selecione no calendário
                </div>
            </div>
            
            <!-- Botões -->
            <div class="button-group">
                <button type="submit" class="btn-submit">
                    <i class="fas fa-check me-2"></i>Salvar
                </button>
                <a href="/login" class="btn-back">
                    <i class="fas fa-arrow-left me-2"></i>Voltar
                </a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>