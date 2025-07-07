<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Vistoria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4 bg-light">
    <div class="container">
        <h2 class="text-primary mb-4">Cadastrar vistoria para {{cliente.name}}</h2>

        <form action="{{action}}" method="post" class="bg-white p-4 rounded shadow-sm">
            <div class="mb-3">
                <label for="numero_chassi_carro" class="form-label">Selecionar chassi do carro</label>
                <select class="form-select" name="numero_chassi_carro" id="numero_chassi_carro" required>
                    <option value="" disabled selected>Selecione um chassi</option>
                    % for chassi in carros:
                        <option value="{{chassi}}">{{chassi}}</option>
                    % end
                </select>
            </div>

            <button type="submit" class="btn btn-danger">Cadastrar Vistoria</button>
            <a href="/clientes/home/{{cliente.id}}" class="btn btn-secondary ms-2">Voltar</a>
        </form>
    </div>
</body>
</html>
