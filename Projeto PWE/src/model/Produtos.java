package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Produtos{
	private String NomeProduto;
	private float ValorProduto;
	private String Tipo;
	private int    Id; // chave primária
	
	private String tableName = "produtos";
	private String fieldsName = "NomeProduto,ValorProduto,Tipo,Id";
	private String keyField = "Id";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Produtos() {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	
	
	public Produtos(String NomeProduto,Float ValorProduto,String Tipo,int Id) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNomeProduto(NomeProduto);
		this.setValorProduto(ValorProduto);
		this.setTipo(Tipo);
		this.setId(Id);
	}
	
	public Produtos(String NomeProduto,String ValorProduto,String Tipo,String Id) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNomeProduto(NomeProduto);
		this.setValorProduto(((ValorProduto==null) ? 0 : Float.valueOf(ValorProduto)));
		this.setTipo(Tipo);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
	}
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getNomeProduto(),
					""+this.getValorProduto(),
					""+this.getTipo(),
					""+this.getId(),
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
		ResultSet rs= this.dbQuery.select(this.where);
		String saida = "<br>";
		saida += "<table border=1>";
		
		try{
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("NomeProduto")+"</td>";
				saida += "<td>" + rs.getString("ValorProduto")+"</td>";
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



	public String getNomeProduto() {
		return NomeProduto;
	}



	public void setNomeProduto(String nomeProduto) {
		NomeProduto = nomeProduto;
	}



	public float getValorProduto() {
		return ValorProduto;
	}



	public void setValorProduto(float valorProduto) {
		ValorProduto = valorProduto;
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
