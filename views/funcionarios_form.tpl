<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de carro</title>
</head>

<body>
    <h1>{{"Editar" if funcionarios else "Nova"}} carro</h1>

    <form action="{{action}}" method="post">
        <label for="titulo">Título:</label><br>
        <input type="text" id="id" name="id" required value="{{.id if funcionarios else ''}}" ><br><br>

        <label for="descricao">name:</label><br>
        <textarea id="descricao" name="descricao" required>{{funcionarios.name if funcionarios else ''}}</textarea><br><br>

        <label for="descricao">Descrição:</label><br>
        <textarea id="descricao" name="descricao" required>{{funcionarios.name if funcionarios else ''}}</textarea><br><br>

        <label for="descricao">Descrição:</label><br>
        <textarea id="descricao" name="descricao" required>{{funcionarios.name if funcionarios else ''}}</textarea><br><br>

        <label for="descricao">Descrição:</label><br>
        <textarea id="descricao" name="descricao" required>{{funcionarios.name if funcionarios else ''}}</textarea><br><br>

        <input type="submit" value="Salvar">
    </form>

    <a href="/activities">Voltar</a>
</body>
</html>
