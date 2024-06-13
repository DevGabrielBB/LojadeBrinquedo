<%@ page import="br.edu.loja.model.Brinquedo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Brinquedo</title>
    <!-- Adicione os links para os arquivos Bootstrap CSS e JS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-BZR7fT6U5EbxHt1LzjvA7WjPRPcZB5kN+2s9N+4lDawlfCrLnpB9cD8hxB6jtw" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- Adicione o link para o seu arquivo de estilo CSS personalizado -->
    <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_editarBrinquedo.css">
</head>
<script>
    function mostrarPopup() {
        var senhaCorreta = "admin123";
        var senhaInserida = prompt("Por favor, insira a senha:");

        if (senhaInserida === senhaCorreta) {
            alert("Acesso concedido!");
            // Aqui você pode redirecionar o usuário para a página de admin
            window.location.href = "ServletBrinquedo?action=listaAdmin";
        } else {
            alert("Senha incorreta. Tente novamente.");
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

    <body>
        <div id="destaque">
            <h3>Editar Brinquedo</h3>
            
            </br>
            <!-- Use classes Bootstrap para estilizar seu formulário -->
            <form class="needs-validation" method="post" action="../ServletBrinquedo?action=update" enctype="multipart/form-data" novalidate>
                <!-- Adicione classes Bootstrap aos seus elementos de formulário -->
                <div class="form-group">
                    <label for="codBrinquedo">Código do Brinquedo:</label>
                    <input type="text" class="form-control" id="codBrinquedo" name="codBrinquedo" value="<%= request.getParameter("codBrinquedo") %>" readonly>
                </div>

                <div class="form-group">
                    <label for="descricao">Descrição:</label>
                    <input type="text" class="form-control" id="descricao" name="descricao" value="<%= request.getParameter("descricao") %>">
                </div>

                <div class="form-group">
                    <label for="categoria">Categoria:</label>
                    <input type="text" class="form-control" id="categoria" name="categoria" value="<%= request.getParameter("categoria") %>">
                </div>

                <div class="form-group">
                    <label for="marca">Marca:</label>
                    <input type="text" class="form-control" id="marca" name="marca" value="<%= request.getParameter("marca") %>">
                </div>

                <div class="form-group">
                    <label for="imagem">Imagem:</label>
                    <input type="file" class="form-control-file" id="nomeImagem" name="nomeImagem" accept="image/*" required>
                </div>

                <div class="form-group">
                    <label for="valor">Valor:</label>
                    <input type="text" class="form-control" id="valor" name="valor" value="<%= request.getParameter("valor") %>">
                </div>

                <div class="form-group">
                    <label for="detalhes">Detalhes:</label>
                    <textarea class="form-control" id="detalhes" name="detalhes"><%= request.getParameter("detalhes") %></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Salvar Alterações</button>
            </form>
        </div>
    </body>
</html>
