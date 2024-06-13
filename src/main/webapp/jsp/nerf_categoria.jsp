<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.edu.loja.model.Brinquedo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
	    <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_nerf_categoria.css">
	    <title>Categoria Nerf</title>
	    <!--  <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_index.css">-->
	   
	   
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
    	
	   <h1>
    		<img alt="Nerf" src="/LojaDeBrinquedos/images/nerf.png" height="150px" width = "200px">
		</h1>
	

	
	    <% List<Brinquedo> brinquedos = (List<Brinquedo>) request.getAttribute("brinquedos"); %>
	
	    <% for (Brinquedo brinquedo : brinquedos) { %>
	        <div class="brinquedo">
	            <a href="/LojaDeBrinquedos/ServletBrinquedo?action=mostrarInfo&codBrinquedo=<%= brinquedo.getCodBrinquedo() %>"><img src="/LojaDeBrinquedos/images/<%= brinquedo.getNomeImagem() %>" alt="Imagem do Brinquedo"></a>
	            <!--<p>Código do Brinquedo: <%= brinquedo.getCodBrinquedo() %></p>-->
	            <p><%= brinquedo.getDescricao() %></p>
	            <!-- <p>Marca: <%= brinquedo.getMarca() %></p>-->
	            <p>R$<%= brinquedo.getValor() %></p>
	            <!--<p>Detalhes: <%= brinquedo.getDetalhes() %></p>-->
	        </div>
	    <% } %>
	    </div>
	</body>
</html>
