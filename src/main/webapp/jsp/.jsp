<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listagem de Brinquedos</title>
    <style>
        .brinquedo {
            border: 1px solid #ccc;
            padding: 10px;
            margin: 10px;
            display: inline-block;
        }

        .brinquedo h2 {
            font-size: 1.2em;
            margin: 0;
        }

        .brinquedo img {
            max-width: 100%;
            height: auto;
        }

        .brinquedo p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <h1>Listagem de Brinquedos</h1>
    <div class="brinquedo">
        <%
            // Supondo que você tenha uma lista de brinquedos com seus caminhos de imagem
            List<Brinquedo> brinquedos = (List<Brinquedo>) request.getAttribute("brinquedos");
            for (Brinquedo brinquedo : brinquedos) {
        %>
            <div class="brinquedo">
                <h2><%= brinquedo.getDescricao() %></h2>
                <img src="<%= brinquedo.getCaminhoImagem() %>" alt="<%= brinquedo.getDescricao() %>">
                <p>Categoria: <%= brinquedo.getCategoria() %></p>
                <p>Marca: <%= brinquedo.getMarca() %></p>
                <p>Valor: R$ <%= brinquedo.getValor() %></p>
                <p>Detalhes: <%= brinquedo.getDetalhes() %></p>
            </div>
        <%
            }
        %>
    </div>
</body>
</html>
