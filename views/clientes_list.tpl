<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Gestão de Usuários</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            padding: 2rem 0;
        }
        
        .users-section {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            padding: 2.5rem;
            border: 1px solid rgba(255, 255, 255, 0.2);
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid #e9ecef;
        }
        
        .section-title {
            color: #2c3e50;
            font-weight: 700;
            font-size: 1.8rem;
            margin: 0;
        }
        
        .btn {
            border-radius: 12px;
            padding: 0.5rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #3498db, #2980b9);
            color: white;
        }
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }
        
        .btn-edit {
            background: linear-gradient(45deg, #f39c12, #e67e22);
            color: white;
            font-size: 0.85rem;
        }
        
        .btn-edit:hover {
            background: linear-gradient(45deg, #e67e22, #f39c12);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(243, 156, 18, 0.4);
        }
        
        .btn-danger {
            background: linear-gradient(45deg, #e74c3c, #c0392b);
            color: white;
            font-size: 0.85rem;
        }
        
        .btn-danger:hover {
            background: linear-gradient(45deg, #c0392b, #e74c3c);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 3px 10px rgba(231, 76, 60, 0.4);
        }
        
        .table-container {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .styled-table {
            width: 100%;
            border-collapse: collapse;
            margin: 0;
            font-size: 1rem;
            font-family: inherit;
        }
        
        .styled-table thead tr {
            background: linear-gradient(45deg, #2c3e50, #34495e);
            color: white;
            text-align: left;
        }
        
        .styled-table th,
        .styled-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #e9ecef;
        }
        
        .styled-table th {
            font-weight: 600;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .styled-table tbody tr {
            background: white;
            transition: all 0.3s ease;
        }
        
        .styled-table tbody tr:hover {
            background: #f8f9fa;
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        .styled-table tbody tr:nth-child(even) {
            background: #f8f9fa;
        }
        
        .styled-table tbody tr:nth-child(even):hover {
            background: #e9ecef;
        }
        
        .styled-table td a {
            color: #3498db;
            text-decoration: none;
            font-weight: 500;
        }
        
        .styled-table td a:hover {
            color: #2980b9;
            text-decoration: underline;
        }
        
        .actions {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }
        
        .actions form {
            margin: 0;
        }
        
        .btn-sm {
            padding: 0.4rem 0.8rem;
            font-size: 0.8rem;
        }
        
        @media (max-width: 768px) {
            .users-section {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .section-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }
            
            .table-container {
                overflow-x: auto;
            }
            
            .styled-table {
                min-width: 600px;
            }
            
            .actions {
                flex-direction: column;
                gap: 0.25rem;
            }
            
            .btn-sm {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <section class="users-section">
        <div class="section-header">
            <h1 class="section-title"><i class="fas fa-users"></i> Gestão de Usuários</h1>
            <a href="/clientes/add" class="btn btn-primary">
                <i class="fas fa-plus"></i> Novo Usuário
            </a>
        </div>

        <div class="table-container">
            <table class="styled-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Email</th>
                        <th>Data Nasc.</th>
                        <th>Ações</th>
                    </tr>
                </thead>

                <tbody>
                    % for cliente in clientes:
                    <tr>
                        <td>{{cliente.id}}</td>
                        <td>{{cliente.name}}</td>
                        <td><a href="mailto:{{cliente.email}}">{{cliente.email}}</a></td>
                        <td>{{cliente.birthdate}}</td>
                        
                        <td class="actions">
                            <a href="/users/edit/{{cliente.id}}" class="btn btn-sm btn-edit">
                                <i class="fas fa-edit"></i> Editar
                            </a>

                            <form action="/users/delete/{{cliente.id}}" method="post" 
                                  onsubmit="return confirm('Tem certeza?')">
                                <button type="submit" class="btn btn-sm btn-danger">
                                    <i class="fas fa-trash-alt"></i> Excluir
                                </button>
                            </form>
                        </td>
                    </tr>
                    % end
                </tbody>
            </table>
        </div>
    </section>
</body>
</html>