<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Botões com Rotas(edit)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex flex-column align-items-center justify-content-center vh-100">

    <h1 class="mb-4">Navegação de edição</h1>

    <div class="d-grid gap-3 col-6 mx-auto">
        <a href="/clientes/edit_car/{{cliente.id}}" class="btn btn-primary btn-lg">editar carro</a>
        <a href="/clientes/edit_vist/{{cliente.id}}" class="btn btn-success btn-lg">editar vistoria</a>
        <a href="/clientes/edit_ped/{{cliente.id}}" class="btn btn-warning btn-lg">editar pedido</a>
    </div>

    
    <a href="/clientes/home/{{cliente.id}}" class="mt-2 btn btn-secondary">Voltar</a>
</body>
</html>
