<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar Carro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-4">
<div class="container">
    <h2 class="mb-4 text-primary">Editar carro de {{cliente.name}}</h2>

    <form action="{{action}}" method="post" class="bg-white p-4 rounded shadow-sm">
        <div class="mb-3">
            <label class="form-label">Número do Chassi</label>
            <input type="text" class="form-control" name="numero_chassi" value="{{carro.numero_chassi}}" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Marca</label>
            <input type="text" class="form-control" name="marca" value="{{carro.marca}}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Modelo</label>
            <input type="text" class="form-control" name="modelo" value="{{carro.modelo}}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Ano</label>
            <input type="number" class="form-control" name="ano" value="{{carro.ano}}" required>
        </div>

        <button type="submit" class="btn btn-success">Salvar Alterações</button>
        <a href="/clientes/edit_car/{{cliente.id}}" class="btn btn-secondary ms-2">Voltar</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
