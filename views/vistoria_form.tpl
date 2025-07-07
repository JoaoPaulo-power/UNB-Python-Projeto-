<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Vistoria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            --danger-gradient: linear-gradient(45deg, #e74c3c, #c0392b);
            --secondary-gradient: linear-gradient(45deg, #95a5a6, #7f8c8d);
            --text-dark: #2c3e50;
            --text-blue: #3498db;
            --white: #ffffff;
        }
        
        body {
            background: var(--primary-gradient);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 20px;
        }
        
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 600px;
        }
        
        .inspection-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: var(--danger-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: var(--white);
            font-size: 1.8rem;
        }
        
        .form-title {
            color: var(--text-dark);
            font-weight: 700;
            margin-bottom: 8px;
            text-align: center;
            font-size: 1.8rem;
        }
        
        .client-name {
            color: var(--text-blue);
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.2rem;
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 24px;
        }
        
        .form-label {
            display: block;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 8px;
            padding-left: 5px;
        }
        
        .form-label i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .form-select {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border-radius: 12px;
            border: 2px solid #e9ecef;
            font-size: 1rem;
            transition: all 0.3s ease;
            height: 48px;
            appearance: none;
            background-color: var(--white);
            box-sizing: border-box;
        }
        
        .form-select:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            outline: none;
        }
        
        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            justify-content: center;
        }
        
        .btn {
            padding: 14px 28px;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .btn-danger {
            background: var(--danger-gradient);
            color: var(--white);
        }
        
        .btn-danger:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(192, 57, 43, 0.4);
        }
        
        .btn-secondary {
            background: var(--secondary-gradient);
            color: var(--white);
            text-decoration: none;
        }
        
        .btn-secondary:hover {
            background: linear-gradient(45deg, #7f8c8d, #95a5a6);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 140, 141, 0.4);
            color: var(--white);
        }
        
        .select-wrapper {
            position: relative;
        }
        
        .select-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
            z-index: 2;
        }
        
        @media (max-width: 576px) {
            .form-card {
                padding: 30px 20px;
            }
            
            .inspection-icon {
                width: 70px;
                height: 70px;
                font-size: 1.5rem;
            }
            
            .form-title {
                font-size: 1.5rem;
            }
            
            .button-group {
                flex-direction: column;
            }
            
            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="form-card">
        <div class="inspection-icon">
            <i class="fas fa-clipboard-check"></i>
        </div>
        
        <h1 class="form-title">Cadastrar Vistoria</h1>
        <p class="client-name">Para {{cliente.name}}</p>
        
        <form action="{{action}}" method="post">
            <div class="form-group">
                <label for="numero_chassi_carro">
                    <i class="fas fa-car"></i>Selecionar Chassi do Carro
                </label>
                <div class="select-wrapper">
                    <i class="fas fa-car select-icon"></i>
                    <select class="form-select" name="numero_chassi_carro" id="numero_chassi_carro" required>
                        <option value="" disabled selected>Selecione um chassi</option>
                        % for chassi in carros:
                            <option value="{{chassi}}">{{chassi}}</option>
                        % end
                    </select>
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn btn-danger">
                    <i class="fas fa-save"></i>Cadastrar Vistoria
                </button>
                <a href="/clientes/home/{{cliente.id}}" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i>Voltar
                </a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>