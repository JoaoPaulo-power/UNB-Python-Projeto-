<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <title>cadastro de vistorias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
    <h2 class="mb-4 text-primary">Cadastro de vistoria para {{cliente.name}}</h2>

    <form action="{{action}}" method="post" class="p-4 bg-white rounded shadow-sm">
        <div class="mb-3">
            <label for="numero_chassi_carro" class="form-label">Numero do chasssi do carro</label>
            <input type="text" class="form-control" id="numero_chassi_carro" name="numero_chassi_carro" placeholder="Ex: 1234-56" required>
        </div>
        <button type="submit" class="btn btn-danger">Cadastrar vistoria</button>
        <a href="/clientes/cad/{{cliente.id}}" class="ms-2 btn btn-primary">Voltar</a>

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>