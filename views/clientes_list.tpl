%rebase('layout', title='Usuários')

<section class="users-section">
    <div class="section-header">
        <h1 class="section-title"><i class="fas fa-users"></i> Gestão de Usuários</h1>
        <a href="/clientes/add" class="btn btn-primary">
            <i class="fas fa-plus"></i> Novo Usuário
        </a>
    </div>

    <div class="table-container">
        <table class="styled-table">
            
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Email</th>
                    <th>Data Nasc.</th>
                    <th>Ações</th>
                </tr>
            </thead>

            <tbody>
                % for cliente in clientes:
                <tr>
                    <td>{{cliente.id}}</td>
                    <td>{{cliente.name}}</td>
                    <td><a href="mailto:{{cliente.email}}">{{cliente.email}}</a></td>
                    <td>{{cliente.birthdate}}</td>
                    
                    <td class="actions">
                        <a href="/users/edit/{{cliente.id}}" class="btn btn-sm btn-edit">
                            <i class="fas fa-edit"></i> Editar
                        </a>

                        <form action="/users/delete/{{cliente.id}}" method="post" 
                              onsubmit="return confirm('Tem certeza?')">
                            <button type="submit" class="btn btn-sm btn-danger">
                                <i class="fas fa-trash-alt"></i> Excluir
                            </button>
                        </form>
                    </td>
                </tr>
                % end
            </tbody>
        </table>
    </div>
</section>