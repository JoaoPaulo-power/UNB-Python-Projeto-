# Concessionária Fachada: POO com Python + Bottle + JSON
Este é um projeto de template educacional voltado para o ensino de **Programação Orientada a Objetos (POO)** do Prof. Lucas Boaventura, Universidade de Brasília (UnB).

Utiliza o microframework **Bottle**. Ideal para uso em disciplinas introdutórias de Engenharia de Software ou Ciência da Computação.

## 📌: Principais Funcionalidades

- Login e Cadastro;
- Funcionários e Clientes;
- Login diferencia cliente de funcionario na hora de logar;
- Clientes consegue: cadastrar carro,cadastrar vistoria ,cadastrar pedido, editar cada um destes, listar cada um deles, e pagar o preço ;
- Salva os dados em .JSON;
- Uso da hashlib para codificação de dados sensíveis;
- Gestão de Usuários (CRUD);

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
├── models/ # Definição das entidades (ex: auth_users)
├── services/ # Lógica de persistência (JSON)
├── views/ # Arquivos HTML (Bottle Templating)
├── static/ # CSS, JS e imagens
├── data/ # Arquivos JSON de dados
└── .vscode/ # Configurações opcionais do VS Code
```

## Diagrama de Classe

![Diagrama de Classe](https://github.com/user-attachments/assets/3a108733-0ac5-40f2-934c-3ab2cc49d641)




---

## 📁 Descrição das Pastas

### `controllers/`
Contém as classes responsáveis por lidar com as rotas da aplicação. Exemplos:
- `user_controller.py`: Rotas para listagem, adição, edição e remoção de usuários.
- `base_controller.py`: Classe base com utilitários comuns.
- `auth_controller.py`: São as rotas relacionadas a auteticação do login
- `cliente_controller.py`: Rotas relacionadas as ações de um 'cliente'
- `funcionarios_controller.py`: Rotas relacionadas as ações de um 'funcionario'
- `home_controller.py`: Rotas especificas da home 

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
- `auth_service.py`: contém métodos de autenticação do usuário.
- `carro_service.py`: contém métodos de carros.
- `cliente_service.py`: contém métodos que compõem o cliente.
- `funcionario_service.py`: contém métodos do funcionario.
- `pedido_service.py`: contém métodos do pedido.
- `problema_service.py`: contém métodos de problema.
- `vistoria_service.py`: contém métodos da vistoria.

### `views/`
Contém os arquivos `.tpl` utilizados pelo Bottle como páginas HTML:
- `layout.tpl`: estrutura base com navegação e bloco `content`.
- `users.tpl`: lista os usuários.
- `carro_form.tpl`: formulário do cliente.
- `clientecad.tpl`: formulário para adicionar/editar usuário.
- `cliente_del_car.tpl`: formulário para deletar carro do cliente.
- `cliente_del_ped.tpl`: formulário para deletar pedido de cliente.
- `cliente_del_vist.tpl`: formulário para deletar vistoria do cliente.
- `cliente_home.tpl`: formulário que leva para a home do cliente.
- `cliente_listar.tpl`: formulário que lista clientes.
- `cliente_pedidos.tpl`: formulário que leva aos pedidos do usuário.
- `cliente_vistorias.tpl`: formulário para levar acesso as vistorias do cliente.
- `clientes_del.tpl`: formulário para acesso a remoção de dados do cliente.
- `clientes_form.tpl`: formulário para adicionar o formulário.
- `clientes_list.tpl`: formulário para adicionar a lista de clientes cadastrados.
- `dashboard.tpl`: formulário para adicionar a dashboard do usuário.
- `funcionario_home.tpl`: formulário para adicionar a home do funcionário.
- `funcionarios_form.tpl`: formulário para adicionar o formulário do funcionário.
- `home.tpl`: formulário para adicionar a home inicial.
- `login.tpl`: formulário para adicionar o login do usuário.
- `pedido_form.tpl`: formulário para adicionar pedido do cliente.
- `register.tpl`: formulário para adicionar cadastro.
- `vistoria.tpl`: formulário para adicionar/editar a vistoria determinada pelo cliente.
### `static/`
Arquivos estáticos como:
- `css/style.css`: estilos básicos.

- `js/main.js`: scripts JS opcionais.
- `img/BottleLogo.png`: exemplo de imagem.
- `img/1000054426.png`: diagrama de classes.

### `data/`
Armazena os arquivos `.json` que simulam o banco de dados:
- `carros.json`: onde os dados dos carros são persistidos.
- `clientes.json`: onde os dados do cliente são persistidos.
- `funcionarios.json`: onde os dados dos login dos funcionarios são persistidos.
- `pedidos.json`: onde os pedidos dos clientes são persistidos.
- `problemas..json`: onde os problemas listados pelo mecanico são persistidos.
- `vistorias.json`: onde a vistoria dada pelo cliente são persistidos.

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

