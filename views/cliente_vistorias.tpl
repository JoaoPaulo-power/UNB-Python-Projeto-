<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Botões com Rotas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container mt-5">
        <h1 class="mb-4 text-center">vistorias do cliente</h1>

        % for vistoria in vistorias:
       
        <div class="d-flex align-items-center my-4">
            <hr class="flex-grow-1 border-primary">
            <span class="mx-3 text-primary fw-bold">
                <i class="bi bi-car-front-fill"></i> vistorias registradas
            </span>
            <hr class="flex-grow-1 border-primary">
        </div>

        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">id:{{vistoria.id}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">carro_id:{{vistoria.carro_id}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">funcionarios_id:{{vistoria.funcionarios_id}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">prazo:{{vistoria.prazo}}</h5>

            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0">status:{{vistoria.status}}</h5>

            </div>
        </div>
        % end

        <a href="/clientes/home/{{cliente.id}}" class="btn btn-outline-secondary mt-4">Voltar para Início</a>
    </div>

</body>

</html>