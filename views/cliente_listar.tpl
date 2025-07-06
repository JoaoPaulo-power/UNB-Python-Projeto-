<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Botões com Rotas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex flex-column align-items-center justify-content-center vh-100">

    <h1 class="mb-4">Navegação de listagem</h1>

    <div class="d-grid gap-3 col-6 mx-auto">
        <a href="/clientes/car/<id_cliente:int>" class="btn btn-primary btn-lg">listar carros</a>
        <a href="/clientes/vist/<id_cliente:int>" class="btn btn-success btn-lg">listar vistorias</a>
        <a href="/clientes/ped/<id_cliente:int>" class="btn btn-warning btn-lg">listar pedidos</a>
    </div>

</body>
</html>
