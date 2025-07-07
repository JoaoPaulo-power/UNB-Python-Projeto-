<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8" />
    <title>Editar Pedido por ID</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="bg-light p-4">
    <div class="container">
        <h2 class="mb-4 text-primary">Digite o ID do pedido para editar - {{ cliente.name }}</h2>

        <form action="{{ action }}" method="post" class="form-inline">
            <div class="mb-3">
                <label for="pedido_id" class="form-label">ID do Pedido:</label>
                <input type="number" class="form-control" id="pedido_id" name="pedido_id" placeholder="Digite o ID do pedido" required>
            </div>
            <button type="submit" class="btn btn-primary">Editar Pedido</button>
        </form>

        <a href="/clientes/home/{{ cliente.id }}" class="btn btn-secondary mt-4">Voltar</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
