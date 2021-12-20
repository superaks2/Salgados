package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import database.DBQuery;

public class Produtos{
	private String Nome;
	private float Valor;
	private String Tipo;
	private int    Id; // chave primária
	private String Foto;



	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	private String arrs[];
	
	public Produtos() {
		this.tableName = "produtos";
		this.fieldsName = "Foto,Nome,Valor,Tipo,Id";
		this.keyField = "Id";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	
	
	public Produtos(String Nome,Float Valor,String Tipo,int Id) {
		
		this.tableName = "produtos";
		this.fieldsName = "Nome,Valor,Tipo,Id";
		this.keyField = "Id";
		
		this.setNome(Nome);
		this.setValor(Valor);
		this.setTipo(Tipo);
		this.setId(Id);
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public void update() {
		this.dbQuery.update(this.toArrayComplete());
	}
	
	public Produtos(String Foto, String Nome,String Valor,String Tipo,int Id) {
		this.tableName = "produtos";
		this.fieldsName = "Foto,Nome,Valor,Tipo,Id";
		this.keyField = "Id";
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		this.setNome(Nome);
		this.setValor(((Valor==null) ? 0 : Float.parseFloat(Valor)));
		this.setTipo(Tipo);
		this.setId(Id);
		this.setFoto(Foto);
	}
	
	/*
	public ArrayList<String> getProdutos(String tipo) {
		this.tableName = "produtos";
		this.fieldsName = "Nome,Valor,Tipo,Id";
		this.keyField = "";
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		ResultSet res = null;
		
		if(tipo != null) {
			res = this.dbQuery.select("Tipo=\"" + tipo + "\"");
		} else {
			res = this.dbQuery.select("");
		}

		
		ArrayList<String> arr = new ArrayList<String>();
		
		try {
			String dados = null;
			
			while(res.next()) {
				dados = "{\"nome\": \"" + res.getString("Nome") + "\", \"preco\": " + res.getString("Valor") + "}";
				arr.add(dados);
				dados = null;
				
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		return arr;
		
		
	}*/
	
	public Produtos(String Foto,String Nome,String Valor,String Tipo,String Id) {
		
		this.tableName = "produtos";
		this.fieldsName = "Foto,Nome,Valor,Tipo,Id";
		this.keyField = "Id";
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		this.setNome(Nome);
		this.setValor(((Valor==null) ? 0 : Float.valueOf(Valor)));
		this.setTipo(Tipo);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
		this.setFoto(Foto);
	}
	
	
	public Produtos(String Nome,String Valor,String Tipo,String Id) {
		
		this.tableName = "produtos";
		this.fieldsName = "Nome,Valor,Tipo,Id";
		this.keyField = "Id";
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		this.setNome(Nome);
		this.setValor(((Valor==null) ? 0 : Float.valueOf(Valor)));
		this.setTipo(Tipo);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
	}
	
	public String[] toArrayComplete() {

		return (
			new String[] {
					""+this.getFoto(),
					""+this.getNome(),
					""+this.getValor(),
					""+this.getTipo(),
					""+this.getId()
			}
		);
	}
	
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getNome(),
					""+this.getValor(),
					""+this.getTipo(),
					""+this.getId()
			}
		);
	}
	
	public void save() {
		if((this.getId() == 0)) {
			this.dbQuery.insert(this.toArrayComplete());
		}else {
			this.dbQuery.update(this.toArrayComplete());
		}
	}
	
	public void delete(String where) {
		System.out.println("Model.produtos where: " + where);
		this.dbQuery.delete("Id=" + where);
	}
	
	public ResultSet getProduto(String id) {
		ResultSet rs= this.dbQuery.select("Id=" + id);
		return rs;
	}
	
	
	public String listAll() {
		ResultSet rs= this.dbQuery.select("");
		String saida = "<br>";
		
		try{
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td><img style=\"max-width: 40px;\" src=\"" + rs.getString("Foto") + "\"></td>";
				saida += "<td>" + rs.getString("Nome")+"</td>";
				saida += "<td>" + rs.getString("Valor")+"</td>";
				saida += "<td>" + rs.getString("Tipo")+"</td>";
				saida += "<td><form action=\"editar\"><input style=\"width: 80px;\" class=\"btn btn-primary\" type=\"submit\" value=\"editar\"><input type=\"hidden\" name=\"id\" value=\"" + rs.getString("Id") + "\"></form> <form action=\"deletar\"><input type=\"hidden\" name=\"id\" value=\"" + rs.getString("Id") + "\"><input style=\"width: 80px;\" class=\"btn btn-danger\" type=\"submit\" name=\"acao\" value=\"deletar\"></form></td>";
				saida += "</tr>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}
	
	public ResultSet getProdutos(String where) {
		// ResultSet rs = this.dbQuery.select("Tipo=\"" + tipo + "\"");
		 ResultSet rs = this.dbQuery.select(where);
		return rs;
	}



	public String getNome() {
		return Nome;
	}



	public void setNome(String nome) {
		Nome = nome;
	}

	public String getFoto() {
		return Foto;
	}



	public void setFoto(String foto) {
		Foto = foto;
	}


	public float getValor() {
		return Valor;
	}



	public void setValor(float valor) {
		Valor = valor;
	}



	public String getTipo() {
		return Tipo;
	}



	public void setTipo(String tipo) {
		Tipo = tipo;
	}



	public int getId() {
		return Id;
	}



	public void setId(int id) {
		Id = id;
	}

}	
