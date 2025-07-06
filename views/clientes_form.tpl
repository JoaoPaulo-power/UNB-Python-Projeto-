<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de carro </title>
</head>

<body>
    <h1>Por favor confirme seus dados</h1>

    <form action="{{action}}" method="post">
        
        <label for="data_nascimento">ponha sua data de nascimento:</label><br>
        <input type="text" id="data_nascimento" name="data_nascimento" required class="form_control" ><br><br>

       
        <input type="submit" value="Salvar">
    </form>

    <a href="/login">Voltar</a>
</body>
</html>
