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
	private int    Id; // chave prim�ria
	
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
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		this.setNome(Nome);
		this.setValor(Valor);
		this.setTipo(Tipo);
		this.setId(Id);
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
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if(this.getId() > 0) {
			this.dbQuery.delete(this.toArray());
		}
	}
	
	public String listAll() {
		ResultSet rs= this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		
		try{
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("Nome")+"</td>";
				saida += "<td>" + rs.getString("Valor")+"</td>";
				saida += "<td>" + rs.getString("Tipo")+"</td>";
				saida += "<td>" + rs.getString("Id")+"</td>";
				saida += "</tr> <br>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
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
