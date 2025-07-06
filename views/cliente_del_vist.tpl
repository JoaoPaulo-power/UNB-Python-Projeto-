<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Vistorias do Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5">
        <h2 class="mb-4 text-primary">Vistorias do Cliente: {{cliente.name}}</h2>

        % if cliente.lista_vistorias_id:
            <div class="list-group">
                % for id_vist in cliente.lista_vistorias_id:
                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <span>Vistoria ID: {{id_vist}}</span>
                        <form method="post" action="{{action}}" class="m-0 p-0">
                            <input type="hidden" name="id_vistoria" value="{{id_vist}}">
                            <button type="submit" class="btn btn-danger btn-sm">Excluir</button>
                        </form>
                    </div>
                % end
            </div>
        % else:
            <div class="alert alert-info">
                Nenhuma vistoria registrada para este cliente.
            </div>
        % end

        <a href="/clientes/home/{{cliente.id}}" class="btn btn-secondary mt-4">Voltar</a>
    </div>
</body>
</html>
