<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Carro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <h2 class="mb-4 text-primary">Cadastro de Carro para {{cliente.name}}</h2>

    <form action="{{action}}" method="post" class="p-4 bg-white rounded shadow-sm">
         <div class="mb-3">
            <label for="modelo" class="form-label">Modelo</label>
            <input type="text" class="form-control" id="modelo" name="modelo" placeholder="Ex: Doblô" required>
        </div>
         <div class="mb-3">
            <label for="ano" class="form-label">Ano</label>
            <input type="text" class="form-control" id="ano" name="ano" placeholder="Ex: 2020" required>
        </div>
         <div class="mb-3">
            <label for="numero_chassi" class="form-label">Numero Do Chassi</label>
            <input type="text" class="form-control" id="numero_chassi" name="numero_chassi" placeholder="Ex: Doblô" required>
        </div>
         <div class="mb-3">
            <label for="modelo" class="form-label">Modelo</label>
            <input type="text" class="form-control" id="modelo" name="modelo" placeholder="Ex: Doblô" required>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>