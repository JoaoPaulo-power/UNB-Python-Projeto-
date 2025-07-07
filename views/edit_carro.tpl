<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Carros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">

<div class="container">
    <h2 class="mb-4 text-primary">Carros de {{cliente.name}}</h2>

    % if carros:
        <div class="list-group">
        % for carro in carros:
            <div class="list-group-item d-flex justify-content-between align-items-center">
                <div>
                    <strong>Modelo:</strong> {{carro.modelo}} <br>
                    <strong>Chassi:</strong> {{carro.numero_chassi}}
                </div>
                <a href="/clientes/edit_carro/{{cliente.id}}/{{carro.numero_chassi}}" class="btn btn-warning">Editar</a>
            </div>
        % end
        </div>
    % else:
        <p class="text-muted">Nenhum carro cadastrado para este cliente.</p>
    % end

    <a href="/clientes/home/{{cliente.id}}" class="btn btn-secondary mt-4">Voltar</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
