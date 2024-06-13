<%@ page import="br.edu.loja.model.Brinquedo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Brinquedos</title>
    <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_admin.css"> <!-- Seu arquivo de estilo personalizado -->
    <!-- Adicione o link do Bootstrap diretamente aqui -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<script>
    function confirmarExclusao(codBrinquedo) {
        var resposta = confirm("Exclusão de Brinquedo: Você deseja excluir este Brinquedo escolhido?");
        if (resposta) {
            window.location.href = "/LojaDeBrinquedos/ServletBrinquedo?action=delete&codBrinquedo=" + codBrinquedo;
        }
    }
</script>
<body>
    <header>
        <img alt="Logo" src="/LojaDeBrinquedos/images/toys_land-logo.png" height="200" width="400">
    </header>
    
    <nav id="navegador">
 	<h3>Menu Principal</h3>
    <!--<button onclick="mostrarPopup()">Ir para a Página de Administração</button>-->
    <p><a href= "/LojaDeBrinquedos/ServletBrinquedo?action=list">Home (destaques)</a></p>
    <p><a href= "/LojaDeBrinquedos/jsp/catalago.jsp">Catálogo de Brinquedos</a></p>
    <p><a href = "javascript:void(0)" onclick="mostrarPopup()">Administração</a></p>
    <p><a href = "/LojaDeBrinquedos/jsp/sobre.jsp">Sobre a equipe</a></p>
    
        
    </nav>
    <div id="destaque">
        <h3>Listagem de Brinquedos</h3>
        <!-- Adicione a classe "table" do Bootstrap à sua tabela -->
        <table class="table">
            <thead>
                <tr>
                    <th>Código do Brinquedo</th>
                    <th>Descrição</th>
                    <th>Categoria</th>
                    <th>Marca</th>
                    <th>Valor</th>
                    <th>Detalhes</th>
                    <th>Controles</th>
                </tr>
            </thead>
            <tbody>
                <% List<Brinquedo> brinquedos = (List<Brinquedo>) request.getAttribute("brinquedos");
                for (Brinquedo brinquedo : brinquedos) { %>
                <tr>
                    <td><%= brinquedo.getCodBrinquedo() %></td>
                    <td><%= brinquedo.getDescricao() %></td>
                    <td><%= brinquedo.getCategoria() %></td>
                    <td><%= brinquedo.getMarca() %></td>
                    <td>R$<%= brinquedo.getValor() %></td>
                    <td><%= brinquedo.getDetalhes() %></td>
                    <td>
                        <a href="/LojaDeBrinquedos/jsp/editarBrinquedo.jsp?codBrinquedo=<%= brinquedo.getCodBrinquedo() %>&descricao=<%= brinquedo.getDescricao() %>&categoria=<%= brinquedo.getCategoria() %>&marca=<%= brinquedo.getMarca() %>&nomeImagem=<%= brinquedo.getNomeImagem() %>&valor=<%= brinquedo.getValor() %>&detalhes=<%= brinquedo.getDetalhes() %>">Editar</a>                   
                        <a href="javascript:void(0);" onclick="confirmarExclusao(<%= brinquedo.getCodBrinquedo() %>)">Excluir</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="/LojaDeBrinquedos/html/criar_brinquedo.html">Novo Brinquedo</a>
    </div>
</body>
</html>
