<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Botões com Rotas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light d-flex flex-column align-items-center justify-content-center vh-100">
    <h1 class="mb-4">Navegação de delete</h1>

    <div class="d-grid gap-3 col-6 mx-auto">
        <a href="/clientes/del_car/<id_cliente:int>" class="btn btn-primary btn-lg">deletar carro</a>
        <a href="/clientes/del_vist/<id_cliente:int>" class="btn btn-success btn-lg">deletar vistoria</a>
        <a href="/clientes/del_ped/<id_cliente:int>" class="btn btn-warning btn-lg">deletar pedido</a>
    </div>

</body>

</html>