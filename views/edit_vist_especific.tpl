<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <title>Editar Vistoria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light p-4">
<div class="container">
    <h2 class="mb-4 text-primary">Editar vistoria do cliente {{cliente.name}}</h2>

    <form action="{{action}}" method="post" class="p-4 bg-white rounded shadow-sm">

    <div class="mb-3">
        <label class="form-label">ID da Vistoria</label>
        <input type="text" name="id_vist" value="{{vistoria.id}}" readonly class="form-control" />
    </div>

    <div class="mb-3">
        <label class="form-label">Número do Chassi do Carro</label>
        <input type="text" name="carro_id" value="{{vistoria.carro_id}}"  class="form-control" placeholder="lembre de colocar um chassi valido"/>
    </div>

    <div class="mb-3">
        <label class="form-label">Status</label>
        <select name="status" disabled class="form-select">
            <option value="open" {% if vistoria.status == 'open' %}selected{% endif %}>Aberto</option>
            <option value="in_progress" {% if vistoria.status == 'in_progress' %}selected{% endif %}>Em andamento</option>
            <option value="closed" {% if vistoria.status == 'closed' %}selected{% endif %}>Fechado</option>
        </select>
        <!-- Campo escondido para enviar o valor do select, já que disabled não envia -->
        <input type="hidden" name="status" value="{{vistoria.status}}" />
    </div>

    <div class="mb-3">
        <label class="form-label">Funcionários Responsáveis (IDs)</label>
        <input type="text" name="funcionarios_id" value="{{vistoria.funcionarios_id or ''}}" readonly class="form-control" />
    </div>

    <div class="mb-3">
        <label class="form-label">Prazo</label>
        <input type="date" name="prazo" value="{{vistoria.prazo or ''}}" readonly class="form-control" />
    </div>

    <button type="submit" class="btn btn-primary" disabled>Salvar</button> <!-- botão desabilitado pois não quer edição -->
    <a href="/clientes/edit_vist/{{cliente.id}}" class="btn btn-secondary ms-2">Voltar</a>
</form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
