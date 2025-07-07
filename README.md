# Concessionária Fachada: POO com Python + Bottle + JSON

Este é um projeto de template educacional voltado para o ensino de **Programação Orientada a Objetos (POO)** do Prof. Lucas Boaventura, Universidade de Brasília (UnB).

Utiliza o microframework **Bottle**. Ideal para uso em disciplinas introdutórias de Engenharia de Software ou Ciência da Computação.

## 📌: Principais Funcionalidades

- Login e Cadastro;
- Funcionários e Clientes;
- Clientes consegue: cadastrar carro,cadastrar vistoria ,cadastrar pedido, editar cada um destes, listar cada um deles, e pagar o preço 
- Salva os dados em .JSON;
- uso da hashlib para codificação de dados sensíveis.

---

## 🗂 Estrutura de Pastas

```bash
poo-python-bottle-template/
├── app.py # Ponto de entrada do sistema
├── config.py # Configurações e caminhos do projeto
├── main.py # Inicialização da aplicação
├── requirements.txt # Dependências do projeto
├── README.md # Este arquivo
├── controllers/ # Controladores e rotas
├── models/ # Definição das entidades (ex: User)
├── services/ # Lógica de persistência (JSON)
├── views/ # Arquivos HTML (Bottle Templating)
├── static/ # CSS, JS e imagens
├── data/ # Arquivos JSON de dados
└── .vscode/ # Configurações opcionais do VS Code
```

## diagrama de classes
![Diagrama de Class](static\img\1000054426.jpg)
---

## 📁 Descrição das Pastas

### `controllers/`
Contém as classes responsáveis por lidar com as rotas da aplicação. Exemplos:
- `user_controller.py`: rotas para listagem, adição, edição e remoção de usuários.
- `base_controller.py`: classe base com utilitários comuns.
- `auth_controller.py`: são as rotas relacionadas a auteticação do login
- `cliente_controller.py`: rotas relacionadas as ações de um 'cliente'
- `funcionarios_controller.py`: rotas relacionadas as ações de um 'funcionario'
- `home_controller.py`: rotas especificas da home 

### `models/`
Define as classes que representam os dados da aplicação. Exemplo:
- `auth_user.py`: classe `auth_user`, com atributos de um usario comum a diferencça é que esse usuario ta sendo 'rastreado' pra ser autenticado.

- `carro.py`: classe `Carro`, com atributos como `numero_chassi`,`modelo`,`ano`,`marca`, etc.

- `funcionario.py`: classe `Funcionario`, com atributos como `id`, `name`, `email`,igual a `auth_user`, com metodos as mais que são as listas como, `listas_vistorias_id`,`lista_pedidos_id`

- `pedidos.py`: classe `Pedido`,É a classe de pedidos que vai ser uma solicitação do `cliente` tbm pro `funcionario` mas agora pra concertar o ``carro``

- `vistoria.py`: classe `Vistoria`, É a classe de vistorias que vai ser uma solicitação do `cliente` pro `funcionario` pra tal achar o `problema` do carro.

- `problema.py`: classe `Problema`, com atributos como `peca quebrada`, `valor`, `e prazo` ele vai ser adicionado ao carro durante a vistoria.

- `user.py`: classe `User`, com atributos como `id`, `name`, `email`, etc.

### `services/`
Responsável por salvar, carregar e manipular dados usando arquivos JSON. Exemplo:
- `user_service.py`: contém métodos como `get_all`, `add_user`, `delete_user`.

### `views/`
Contém os arquivos `.tpl` utilizados pelo Bottle como páginas HTML:
- `layout.tpl`: estrutura base com navegação e bloco `content`.
- `users.tpl`: lista os usuários.
- `user_form.tpl`: formulário para adicionar/editar usuário.

### `static/`
Arquivos estáticos como:
- `css/style.css`: estilos básicos.
- `js/main.js`: scripts JS opcionais.
- `img/BottleLogo.png`: exemplo de imagem.
- `img/1000054426.png`: diagrama de classes.

### `data/`
Armazena os arquivos `.json` que simulam o banco de dados:
- `users.json`: onde os dados dos usuários são persistidos.

---

## ▶️ Como Executar

1. Crie o ambiente virtual na pasta fora do seu projeto:
```bash
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\\Scripts\\activate     # Windows  rodar isso aqui pra ativar a venv 
```

2. Entre dentro do seu projeto criado a partir do template e instale as dependências:
```bash
pip install -r requirements.txt
```

3. Rode a aplicação:
```bash
python main.py
```

4. Accese sua aplicação no navegador em: [http://localhost:8080](http://localhost:8080)

---

