<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.edu.loja.model.Brinquedo" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
	<head>
	    <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_sobreequipe.css">
	    <title>Categoria Nerf</title>
	    <!--  <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_index.css">-->
	   
	   
	    <script>
       		 function mostrarPopup() {
            var senhaCorreta = "admin123";
            var senhaInserida = prompt("Por favor, insira a senha:");
            
            if (senhaInserida === senhaCorreta) {
                alert("Acesso concedido!");
                // Aqui você pode redirecionar o usuário para a página de admin
                window.location.href = "../ServletBrinquedo?action=listaAdmin";
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
    <p><a href = "javascript:void(0);" onclick="mostrarPopup()">Administração</a></p>
    <p><a href = "/LojaDeBrinquedos/jsp/sobre.jsp">Sobre a equipe</a></p>
    </nav>
    
    
    <div id="destaque">
	    <div class="img-container">
	        <img alt="Rayane" src="/LojaDeBrinquedos/images/cabecinha.jpg">
	        <p>Rayane Lima</p>
	    	<p>RGM:30340268</p>
	    
	    </div>
	    <div class="img-container">
	        <img alt="Luiz Fernando" src="/LojaDeBrinquedos/images/cachorropancudo.jpeg">
	        <p>Luiz Fernando</p>
	    	<p>RGM:29452490 </p>
	    </div>
	    
	    <div class="img-container">
	        <img alt="vini" src="/LojaDeBrinquedos/images/pingu.jpg">
	        <p>Vinicius Bernardo</p>
	    	<p>RGM:30258707</p>
	    </div>
	    
	    <div class="img-container">
	        <img alt="Luis Eduardo" src="/LojaDeBrinquedos/images/golira.jpg">
	        <p>Luis Eduardo</p>
	    	<p>RGM:30340268</p>
	    </div>
	    
	    <div class="img-container">
	        <img alt="Gabriel Batista" src="/LojaDeBrinquedos/images/tortuga.jpeg">
	        <p>Gabriel Batista</p>
	        <p>RGM:30012813</p>
	    </div>
	    
	    <div class="img-container">
	        <img alt="Lucas Barbosa" src="/LojaDeBrinquedos/images/lucas.png">
	        <p>Lucas Gonzalez</p>
	    	<p>RGM:29371783</p>
	    </div>
	    
	    <div class="img-container">
	        <img alt="Guilherme" src="/LojaDeBrinquedos/images/gui_fla.jpg">
	        <p>Guilherme Soares</p>
	    	<p>RGM:29242975</p>
	    </div>
	   
	    <div class="img-container">
	        <img alt="Rafael" src="/LojaDeBrinquedos/images/luizao.png">
	        <p>Rafael</p>
	    	<p>RGM:29361842</p>
	    </div>
	    
	    <div class="img-container">
	        <img alt="Rodrigo" src="/LojaDeBrinquedos/images/diguin.png">
	        <p>Rodrigo Alcides</p>
	    	<p>RGM:29728592</p>
	    </div>
	    
	
	</div>
 </body>
 </html>   