<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Catálogo de Brinquedos</title>
    <link rel="stylesheet" type="text/css" href="/LojaDeBrinquedos/css/styles_catalago.css">
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
    <p><a href = "javascript:void(0)" onclick="mostrarPopup()">Administração</a></p>
    <p><a href = "/LojaDeBrinquedos/jsp/sobre.jsp">Sobre a equipe</a></p>
    </nav>

    <div id="destaque">
        

        <div class="item">
            <a href="/LojaDeBrinquedos/ServletBrinquedo?action=lego"><img src="/LojaDeBrinquedos/images/lego_logo.png" alt="Lego"></a>

        </div>
        <div class="item">
            <a href="/LojaDeBrinquedos/ServletBrinquedo?action=nerf"><img src="/LojaDeBrinquedos/images/nerf_logo.jpg" alt="Nerf"></a>

        </div>
        <div class="item">
            <a href="/LojaDeBrinquedos/ServletBrinquedo?action=barbie"><img src="/LojaDeBrinquedos/images/barbie_logo.jpg" alt="Barbie"></a>

        </div>
    </div>
</body>
</html>