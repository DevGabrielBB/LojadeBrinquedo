package br.edu.loja.dao;

import br.edu.loja.model.Brinquedo;
import br.edu.loja.util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BrinquedoDAO {

	// Método para criar um novo brinquedo
	public void criarBrinquedo(Brinquedo brinquedo) {
	    Connection conn = null;
	    PreparedStatement stmt = null;

	    try {
	        conn = ConnectionFactory.getConnection();
	        String sql = "INSERT INTO BRINQUEDOS (COD_BRINQUEDO, DESCRICAO, CATEGORIA, MARCA, VALOR, DETALHES, NOME_IMAGEM) VALUES (?, ?, ?, ?, ?, ?, ?)";
	        stmt = conn.prepareStatement(sql);
	        stmt.setInt(1, brinquedo.getCodBrinquedo()); // Defina o código do brinquedo
	        stmt.setString(2, brinquedo.getDescricao());
	        stmt.setString(3, brinquedo.getCategoria());
	        stmt.setString(4, brinquedo.getMarca());
	        stmt.setFloat(5, brinquedo.getValor());
	        stmt.setString(6, brinquedo.getDetalhes());
	        stmt.setString(7, brinquedo.getNomeImagem());
	        stmt.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	            if (conn != null) {
	                conn.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}


    // Método para recuperar todos os brinquedos
    public List<Brinquedo> listarBrinquedos() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Brinquedo> brinquedos = new ArrayList<>();

        try {
            conn = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM BRINQUEDOS";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Brinquedo brinquedo = new Brinquedo();
                brinquedo.setCodBrinquedo(rs.getInt("COD_BRINQUEDO"));
                brinquedo.setDescricao(rs.getString("DESCRICAO"));
                brinquedo.setCategoria(rs.getString("CATEGORIA"));
                brinquedo.setMarca(rs.getString("MARCA"));
                brinquedo.setValor(rs.getFloat("VALOR"));
                brinquedo.setDetalhes(rs.getString("DETALHES"));
                brinquedo.setNomeImagem(rs.getString("NOME_IMAGEM"));
                brinquedos.add(brinquedo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return brinquedos;
    }
    
    //Listar os brinquedos por categoria
    public List<Brinquedo> listarBrinquedosPorCategoria(String categoria) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        List<Brinquedo> brinquedosPorCategoria = new ArrayList<>();

        try {
            conn = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM BRINQUEDOS WHERE CATEGORIA=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, categoria);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Brinquedo brinquedo = new Brinquedo();
                brinquedo.setCodBrinquedo(rs.getInt("COD_BRINQUEDO"));
                brinquedo.setDescricao(rs.getString("DESCRICAO"));
                brinquedo.setCategoria(rs.getString("CATEGORIA"));
                brinquedo.setMarca(rs.getString("MARCA"));
                brinquedo.setValor(rs.getFloat("VALOR"));
                brinquedo.setDetalhes(rs.getString("DETALHES"));
                brinquedo.setNomeImagem(rs.getString("NOME_IMAGEM"));
                brinquedosPorCategoria.add(brinquedo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return brinquedosPorCategoria;
    }

    
    //Pesquisar brinquedo pelo codBrinquedo
    public Brinquedo getBrinquedoByCodigo(int codigo) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Brinquedo brinquedo = null;

        try {
            conn = ConnectionFactory.getConnection();
            String sql = "SELECT * FROM BRINQUEDOS WHERE COD_BRINQUEDO = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, codigo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                brinquedo = new Brinquedo();
                brinquedo.setCodBrinquedo(rs.getInt("COD_BRINQUEDO"));
                brinquedo.setDescricao(rs.getString("DESCRICAO"));
                brinquedo.setCategoria(rs.getString("CATEGORIA"));
                brinquedo.setMarca(rs.getString("MARCA"));
                brinquedo.setValor(rs.getFloat("VALOR"));
                brinquedo.setDetalhes(rs.getString("DETALHES"));
                brinquedo.setNomeImagem(rs.getString("NOME_IMAGEM"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Tratamento de exceções e fechamento de recursos
        }

        return brinquedo;
    }
    

    // Método para atualizar informações de um brinquedo
    public void atualizarBrinquedo(Brinquedo brinquedo) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionFactory.getConnection();
            String sql = "UPDATE BRINQUEDOS SET DESCRICAO=?, CATEGORIA=?, MARCA=?, VALOR=?, DETALHES=?, NOME_IMAGEM=? WHERE COD_BRINQUEDO=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, brinquedo.getDescricao());
            stmt.setString(2, brinquedo.getCategoria());
            stmt.setString(3, brinquedo.getMarca());
            stmt.setFloat(4, brinquedo.getValor());
            stmt.setString(5, brinquedo.getDetalhes());
            stmt.setString(6, brinquedo.getNomeImagem());
            stmt.setInt(7, brinquedo.getCodBrinquedo());
            
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para excluir um brinquedo
    public void excluirBrinquedo(int codBrinquedo) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionFactory.getConnection();
            String sql = "DELETE FROM BRINQUEDOS WHERE COD_BRINQUEDO=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, codBrinquedo);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
