package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Clientes{
	private String RG; // chave primária
	private String Telefone;
	private String Nome;
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Clientes() {
		this.tableName = "clientes";
		this.fieldsName = "RG,Telefone,Nome";
		this.keyField = "RG";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	
	
	public Clientes(String RG,String Telefone,String Nome) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setRG(RG);
		this.setTelefone(Telefone);
		this.setNome(Nome);
	}
	
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getRG(),
					""+this.getTelefone(),
					""+this.getNome()
			}
		);
	}
	
	public void save() {
		if((this.getRG() == "")) {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if(this.getRG() != "") {
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
				saida += "<td>" + rs.getString("RG")+"</td>";
				saida += "<td>" + rs.getString("Telefone")+"</td>";
				saida += "<td>" + rs.getString("Nome")+"</td>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}



	public String getRG() {
		return RG;
	}



	public void setRG(String rG) {
		RG = rG;
	}



	public String getTelefone() {
		return Telefone;
	}



	public void setTelefone(String telefone) {
		Telefone = telefone;
	}



	public String getNome() {
		return Nome;
	}



	public void setNome(String nome) {
		Nome = nome;
	}

}