<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Botões com Links</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex flex-column align-items-center justify-content-center vh-100">

    <h1 class="mb-4">Home do cliente</h1>

    <div class="d-grid gap-3 col-6 mx-auto">
        <a href="/clientes/listar" class="btn btn-primary">listar</a>
        <a href="/clientes/cad" class="btn btn-secondary">cadastrar</a>
        <a href="/cliente/edit" class="btn btn-success">editar</a>
        <a href="/clientes/del" class="btn btn-warning">deletar</a>
        <a href="/cliente/pagar" class="btn btn-danger">pagar</a>
    </div>

</body>
</html>
