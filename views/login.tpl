<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Login - Sistema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            --success-gradient: linear-gradient(45deg, #27ae60, #2ecc71);
            --secondary-color: #95a5a6;
            --text-dark: #2c3e50;
            --text-blue: #3498db;
            --white: #ffffff;
            --error-bg: #f8d7da;
            --error-text: #721c24;
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
        
        .auth-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            width: 100%;
            max-width: 450px;
        }
        
        .auth-icon {
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
        
        .auth-title {
            color: var(--text-dark);
            font-weight: 700;
            margin-bottom: 8px;
            text-align: center;
            font-size: 1.8rem;
        }
        
        .auth-subtitle {
            color: var(--text-blue);
            text-align: center;
            margin-bottom: 30px;
            font-size: 1.1rem;
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
        
        .btn-auth {
            width: 100%;
            padding: 14px;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 1.1rem;
            margin-top: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        
        .btn-primary {
            background: var(--success-gradient);
            color: var(--white);
        }
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #2ecc71, #27ae60);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 204, 113, 0.4);
        }
        
        .auth-footer {
            text-align: center;
            margin-top: 24px;
            font-size: 0.95rem;
        }
        
        .auth-footer a {
            color: var(--text-blue);
            text-decoration: none;
            font-weight: 600;
        }
        
        .auth-footer a:hover {
            text-decoration: underline;
        }
        
        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
        }
        
        .alert-error {
            background-color: var(--error-bg);
            color: var(--error-text);
        }
        
        .alert i {
            margin-right: 12px;
            font-size: 1.2rem;
        }
        
        @media (max-width: 576px) {
            .auth-card {
                padding: 30px 20px;
            }
            
            .auth-icon {
                width: 70px;
                height: 70px;
                font-size: 1.5rem;
            }
            
            .auth-title {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="auth-card">
        <div class="auth-icon">
            <i class="fas fa-user"></i>
        </div>
        
        <h1 class="auth-title">Login</h1>
        <p class="auth-subtitle">Entre com suas credenciais</p>
        
        % if error:
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            {{error}}
        </div>
        % end
        
        <form action="/login" method="post">
            <div class="form-group">
                <label for="username">
                    <i class="fas fa-user"></i>Usuário
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-user input-icon"></i>
                    <input type="text" class="form-control" 
                           id="username" name="username" required 
                           placeholder="Digite seu usuário">
                </div>
            </div>
            
            <div class="form-group">
                <label for="password">
                    <i class="fas fa-lock"></i>Senha
                </label>
                <div class="input-wrapper">
                    <i class="fas fa-lock input-icon"></i>
                    <input type="password" class="form-control" 
                           id="password" name="password" required 
                           placeholder="Digite sua senha">
                </div>
            </div>
            
            <button type="submit" class="btn-auth btn-primary">
                <i class="fas fa-sign-in-alt"></i>Entrar
            </button>
        </form>
        
        <div class="auth-footer">
            <p>Não tem uma conta? <a href="/register">Registre-se aqui</a></p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>