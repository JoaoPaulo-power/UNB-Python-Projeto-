<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de carro </title>
</head>

<body>
    <h1>{{"Editar" if cliente else "Novo"}} cliente</h1>

    <form action="{{action}}" method="post">
        <label for="name">name:</label><br>
        <input type="text" id="name" name="name" required value="{{cliente.name if cliente else ''}}" ><br><br>

        <label for="email">email:</label><br>
        <textarea id="email" name="email" required>{{cliente.id if cliente else ''}}</textarea><br><br>

        <label for="birthdate">data de nascimento:</label><br>
        <textarea id="birthdate" name="birthdate" required>{{cliente.id if cliente else ''}}</textarea><br><br>

        <label for="">Descrição:</label><br>
        <textarea id="descricao" name="descricao" required>{{cliente.id if cliente else ''}}</textarea><br><br>

        <label for="descricao">Descrição:</label><br>
        <textarea id="descricao" name="descricao" required>{{cliente.id if cliente else ''}}</textarea><br><br>

        <input type="submit" value="Salvar">
    </form>

    <a href="/cliente">Voltar</a>
</body>
</html>
