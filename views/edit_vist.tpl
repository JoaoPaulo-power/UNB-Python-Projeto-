<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Vistorias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">
<div class="container">
    <h2 class="mb-4 text-primary">Editar vistorias de {{cliente.name}}</h2>

    % if carros:
        <div class="list-group">
        % for vist in carros:
            <div class="list-group-item d-flex justify-content-between align-items-center">
                <div>
                    <strong>ID Vistoria:</strong> {{vist.id}}<br>
                    <strong>Chassi do carro:</strong> {{vist.carro_id}}<br>
                    <strong>Status:</strong> {{vist.status}}<br>
                    <strong>Prazo:</strong> {{vist.prazo if vist.prazo else '---'}}
                </div>
                <a href="/clientes/edit_vist/{{cliente.id}}/{{vist.id}}" class="btn btn-warning">Editar</a>
            </div>
        % end
        </div>
    % else:
        <p class="text-muted">Nenhuma vistoria encontrada.</p>
    % end

    <a href="/clientes/home/{{cliente.id}}" class="btn btn-secondary mt-4">Voltar</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
