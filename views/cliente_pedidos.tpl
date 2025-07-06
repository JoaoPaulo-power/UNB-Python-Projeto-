<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Lista de Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container mt-5">
        <h1 class="mb-4 text-center">Pedidos do cliente</h1>

        % for pedido in pedidos:
        <div class="d-flex align-items-center my-4">
            <hr class="flex-grow-1 border-primary">
            <span class="mx-3 text-primary fw-bold">
                <i class="bi bi-car-front-fill"></i> pedidos registrados
            </span>
            <hr class="flex-grow-1 border-primary">
        </div>

        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">id:{{pedido.id}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">id_carro do pedido:{{pedido.carro_id}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">id_funcionarios do pedido:{{pedido.funcionarios_id}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">prazo:{{pedido.prazo}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">status:{{pedido.status}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">progresso:{{pedido.progresso}}</h5>

            </div>
        </div>
        % end

        <a href="/clientes/home" class="btn btn-outline-secondary mt-4">Voltar para Início</a>
    </div>

</body>

</html>