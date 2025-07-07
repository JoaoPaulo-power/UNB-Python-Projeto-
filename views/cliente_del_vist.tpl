<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <title>Deletar Vistorias do Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4 bg-light">
    <div class="container">
        <h2 class="mb-4 text-primary">Deletar Vistorias do Cliente {{cliente.name}}</h2>

        % if vistorias_ids:
            <ul class="list-group">
                % for id_vist in vistorias_ids:
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    Vistoria ID: {{id_vist}}
                    <form action="{{action}}" method="post" style="margin:0;">
                        <input type="hidden" name="id_vistoria" id="id_vistoria" value="{{id_vist}}" />
                        <button type="submit" class="btn btn-danger btn-sm">Deletar</button>
                    </form>
                </li>
                % end
            </ul>
        % else:
            <p>Este cliente não possui vistorias cadastradas.</p>
        % end

        <a href="/clientes/home/{{cliente.id}}" class="btn btn-secondary mt-3">Voltar</a>
    </div>
</body>
</html>
