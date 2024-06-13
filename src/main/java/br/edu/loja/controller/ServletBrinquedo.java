package br.edu.loja.controller;

import br.edu.loja.dao.BrinquedoDAO;
import br.edu.loja.model.Brinquedo;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/ServletBrinquedo")
@MultipartConfig
public class ServletBrinquedo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listarBrinquedos(request, response);
                break;                
            case "listaAdmin":
                listarBrinquedosParaAdmin(request, response);
                break;                
            case "create":
                criarBrinquedo(request, response);
                break;
            case "update":
                atualizarBrinquedo(request, response);
                break;
            case "delete":
                excluirBrinquedo(request, response);
                break;
            case "lego":
                listarBrinquedosPorCategoria(request, response, "lego");
                break;
            case "nerf":
                listarBrinquedosPorCategoria(request, response, "nerf");
                break;
            case "barbie":
                listarBrinquedosPorCategoria(request, response, "barbie");
                break;
            case "mostrarInfo":
                mostrarInformacoesBrinquedo(request, response);
                break;
            default:
                listarBrinquedos(request, response);
        }
    }

    private void listarBrinquedos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrinquedoDAO dao = new BrinquedoDAO();
        List<Brinquedo> brinquedos = dao.listarBrinquedos();
        if (brinquedos != null) {
        	//Encaminha a lista de brinquedos para a página index.jsp
            request.setAttribute("brinquedos", brinquedos);
            request.getRequestDispatcher("/index.jsp").forward(request, response);
            
        } else {
            // Lida com o caso de nenhum brinquedo encontrado
        }               
        
    }
    
    
    private void listarBrinquedosParaAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BrinquedoDAO dao = new BrinquedoDAO();
        List<Brinquedo> brinquedos = dao.listarBrinquedos();

        if (brinquedos != null) {
            request.setAttribute("brinquedos", brinquedos);
            request.getRequestDispatcher("/jsp/admin.jsp").forward(request, response);
        } else {
            // Lidar com a situação em que nenhum brinquedo foi encontrado no banco de dados
            
        }
    }
    
    
    private void listarBrinquedosPorCategoria(HttpServletRequest request, HttpServletResponse response, String categoria)
            throws ServletException, IOException {
	    BrinquedoDAO dao = new BrinquedoDAO();
	    List<Brinquedo> brinquedosPorCategoria = dao.listarBrinquedosPorCategoria(categoria);
	
	    if (brinquedosPorCategoria != null) {
	        request.setAttribute("brinquedos", brinquedosPorCategoria);
	        request.getRequestDispatcher("/jsp/" + categoria + "_categoria.jsp").forward(request, response);
	    } else {
	        // Lidar com a situação em que nenhum brinquedo foi encontrado na categoria especificada
	    }
    }
    
    
    private void mostrarInformacoesBrinquedo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codBrinquedo = request.getParameter("codBrinquedo");

        if (codBrinquedo != null && !codBrinquedo.isEmpty()) {
            try {
                int codigo = Integer.parseInt(codBrinquedo);
                BrinquedoDAO brinquedoDAO = new BrinquedoDAO();
                Brinquedo brinquedo = brinquedoDAO.getBrinquedoByCodigo(codigo);

                if (brinquedo != null) {
                    request.setAttribute("brinquedo", brinquedo);
                    request.getRequestDispatcher("/jsp/info_brinquedo.jsp").forward(request, response);
                } else {
                    // Lidar com o caso em que o brinquedo não foi encontrado
                }
            } catch (NumberFormatException e) {
                // Lidar com a entrada inválida do código do brinquedo
            }
        } else {
            // Lidar com a ausência do código do brinquedo na solicitação
        }
    }
    
    //LEMBRAR DE EXCLUIR ESSE MÉTODO DEPOIS
    private void exibirFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("formulario.jsp").forward(request, response);
    }
    
    
    private String salvarImagem(Part filePart) throws IOException {
        if (filePart != null) {
            String nomeImagem = filePart.getSubmittedFileName();
            String path = getServletContext().getRealPath("/images/") + File.separator + nomeImagem;
            File file = new File(path);

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, file.toPath());
            } catch (IOException e) {
                e.printStackTrace();
            }
            return nomeImagem;
        }

        return null;
    }
    
    private void criarBrinquedo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codBrinquedo = Integer.parseInt(request.getParameter("codBrinquedo"));
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String marca = request.getParameter("marca");
        float valor = Float.parseFloat(request.getParameter("valor"));
        String detalhes = request.getParameter("detalhes");
        
        
        Part filePart = request.getPart("nomeImagem");
        String nomeImagem = salvarImagem(filePart); // Salvar a imagem e obter o nome

        Brinquedo brinquedo = new Brinquedo(codBrinquedo, descricao, categoria, marca, valor, detalhes, nomeImagem);
        BrinquedoDAO dao = new BrinquedoDAO();
        dao.criarBrinquedo(brinquedo);

        // Atualize a lista de brinquedos após criar um novo brinquedo
        List<Brinquedo> brinquedos = dao.listarBrinquedos();
        request.setAttribute("brinquedos", brinquedos);

        // Redirecione para a página de listagem
        request.getRequestDispatcher("/jsp/admin.jsp").forward(request, response);
    }
    
   
    private void atualizarBrinquedo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codBrinquedo = Integer.parseInt(request.getParameter("codBrinquedo"));
        String descricao = request.getParameter("descricao");
        String categoria = request.getParameter("categoria");
        String marca = request.getParameter("marca");
        float valor = Float.parseFloat(request.getParameter("valor"));
        String detalhes = request.getParameter("detalhes");
        
        // A parte que faz a atualização da imagem
        Part filePart = request.getPart("nomeImagem");
        String nomeImagem = salvarImagem(filePart); // Salvar a nova imagem

        Brinquedo brinquedo = new Brinquedo(codBrinquedo, descricao, categoria, marca, valor, detalhes, nomeImagem);
        BrinquedoDAO dao = new BrinquedoDAO();
        dao.atualizarBrinquedo(brinquedo);

        response.sendRedirect("ServletBrinquedo?action=listaAdmin");

    }

    private void excluirBrinquedo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int codBrinquedo = Integer.parseInt(request.getParameter("codBrinquedo"));
        BrinquedoDAO dao = new BrinquedoDAO();
        dao.excluirBrinquedo(codBrinquedo);

        response.sendRedirect("ServletBrinquedo?action=listaAdmin");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            criarBrinquedo(request, response);
        } else if ("update".equals(action)) {
            atualizarBrinquedo(request, response);
        } else {
        	
        }
    }


}
