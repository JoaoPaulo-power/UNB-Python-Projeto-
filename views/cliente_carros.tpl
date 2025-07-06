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
        <h1 class="mb-4 text-center">Carros do cliente</h1>

        % for carro in carros:
        <div class="d-flex align-items-center my-4">
            <hr class="flex-grow-1 border-primary">
            <span class="mx-3 text-primary fw-bold">
                <i class="bi bi-car-front-fill"></i> Carros Registrados
            </span>
            <hr class="flex-grow-1 border-primary">
        </div>

        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">numero_chassi:{{carro.numero_chassi}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">modelo:{{carro.modelo}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">ano:{{carro.ano}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">marca:{{carro.marca}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">id dos problemas:{{carro.problemas_id}}</h5>

            </div>
        </div>
        % end

        <a href="/clientes/home" class="btn btn-outline-secondary mt-4">Voltar para Início</a>
    </div>

</body>

</html>