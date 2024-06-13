package br.edu.loja.model;

public class Brinquedo {
	
	//Atributos
	private int codBrinquedo;
	private String descricao;
	private String categoria;
	private String marca;
	private float valor;
	private String detalhes;
	private String nomeImagem;
	
	//Construtor
	public Brinquedo(int codBrinquedo, String descricao, String categoria, String marca, float valor, String detalhes, String nomeImagem) {
		this.codBrinquedo = codBrinquedo;
		this.descricao = descricao;
		this.categoria = categoria;
		this.marca = marca;
		this.valor = valor;
		this.detalhes = detalhes;
		this.nomeImagem = nomeImagem;
	}
	
	
	//Construtor vazio
	public Brinquedo() {
		
	}

	
	//Getters e Setters
	public int getCodBrinquedo() {
		return codBrinquedo;
	}


	public void setCodBrinquedo(int codBrinquedo) {
		this.codBrinquedo = codBrinquedo;
	}


	public String getDescricao() {
		return descricao;
	}


	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}


	public String getMarca() {
		return marca;
	}


	public void setMarca(String marca) {
		this.marca = marca;
	}


	public float getValor() {
		return valor;
	}


	public void setValor(float valor) {
		this.valor = valor;
	}


	public String getDetalhes() {
		return detalhes;
	}


	public void setDetalhes(String detalhes) {
		this.detalhes = detalhes;
	}
	
	
	public String getNomeImagem() {
		return nomeImagem ;
	}


	public void setNomeImagem(String nomeImagem) {
		this.nomeImagem = nomeImagem;
	}
	
}
