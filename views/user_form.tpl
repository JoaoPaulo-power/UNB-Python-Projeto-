<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>{{'Editar Usuário' if user else 'Adicionar Usuário'}}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            --success-gradient: linear-gradient(45deg, #27ae60, #2ecc71);
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
            max-width: 500px;
        }
        
        .user-icon {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background: var(--primary-gradient);
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
        
        .form-control {
            width: 100%;
            padding: 12px 15px 12px 45px;
            border-radius: 12px;
            border: 2px solid #e9ecef;
            font-size: 1rem;
            transition: all 0.3s ease;
            height: 48px;
            box-sizing: border-box;
        }
        
        .form-control:focus {
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
        
        .btn-submit {
            background: var(--success-gradient);
            color: var(--white);
        }
        
        .btn-submit:hover {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.4);
        }
        
        .btn-cancel {
            background: var(--secondary-gradient);
            color: var(--white);
            text-decoration: none;
        }
        
        .btn-cancel:hover {
            background: linear-gradient(45deg, #7f8c8d, #95a5a6);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(127, 140, 141, 0.4);
            color: var(--white);
        }
        
        @media (max-width: 576px) {
            .form-card {
                padding: 30px 20px;
            }
            
            .user-icon {
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
        <div class="user-icon">
            <i class="fas fa-user-edit"></i>
        </div>
        
        <h1 class="form-title">{{'Editar Usuário' if user else 'Adicionar Usuário'}}</h1>
        
        <form action="{{action}}" method="post">
            <div class="form-group">
                <label for="name">
                    <i class="fas fa-user"></i>Nome
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" class="form-control" id="name" name="name" 
                           required value="{{user.name if user else ''}}" 
                           placeholder="Digite o nome completo">
                </div>
            </div>
            
            <div class="form-group">
                <label for="email">
                    <i class="fas fa-envelope"></i>Email
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-envelope input-icon"></i>
                    <input type="email" class="form-control" id="email" name="email" 
                           required value="{{user.email if user else ''}}" 
                           placeholder="Digite o email">
                </div>
            </div>
            
            <div class="form-group">
                <label for="birthdate">
                    <i class="fas fa-calendar-day"></i>Data de Nascimento
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-calendar-day input-icon"></i>
                    <input type="date" class="form-control" id="birthdate" name="birthdate" 
                           required value="{{user.birthdate if user else ''}}">
                </div>
            </div>
            
            <div class="button-group">
                <button type="submit" class="btn btn-submit">
                    <i class="fas fa-save"></i>Salvar
                </button>
                <a href="/users" class="btn btn-cancel">
                    <i class="fas fa-arrow-left"></i>Voltar
                </a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>