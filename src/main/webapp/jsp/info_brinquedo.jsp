<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.edu.loja.model.Brinquedo" %>
<!DOCTYPE html>
<html>
	<head>
	    <title>Informações do Brinquedo</title>
	    <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_info.css">
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
</head>
<body>
	<header>
        <img alt="Logo" src="/LojaDeBrinquedos/images/toys_land-logo.png" height="200" width="400">
    </header>

 	<nav id="navegador">
 	<h2>Menu Principal</h2>
    <!--<button onclick="mostrarPopup()">Ir para a Página de Administração</button>-->
    <p><a href= "/LojaDeBrinquedos/ServletBrinquedo?action=list">Home (destaques)</a></p>
    <p><a href= "/LojaDeBrinquedos/jsp/catalago.jsp">Catálogo de Brinquedos</a></p>
    <p><a href = "javascript:void(0)" onclick="mostrarPopup()">Administração</a></p>
    <p><a href = "/LojaDeBrinquedos/jsp/sobre.jsp">Sobre a equipe</a></p>
    </nav>
    
   <div id="destaque">
	
	    <%-- Recuperando os dados do Brinquedo --%>
    <% Brinquedo brinquedo = (Brinquedo) request.getAttribute("brinquedo"); %>

    <div class="info-brinquedo">
        <img src="/LojaDeBrinquedos/images/<%= brinquedo.getNomeImagem() %>" alt="Imagem do Brinquedo">
        <div id = "dados">
            <h1><%= brinquedo.getDescricao() %></h1>
                        
            <h2>R$<%= brinquedo.getValor() %></h2>
            
            <p>Código: <%= brinquedo.getCodBrinquedo() %></p>

        </div>
    </div>
    <textarea rows="4" cols="50" readonly><%= brinquedo.getDetalhes() %></textarea>
</div>

	    
	</body>
</html>
