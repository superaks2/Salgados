package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Usuarios{
	private String Nome;
	private String Senha;
	private String Email;
	private String Nivel_Acesso;
	private int    Id; // chave primária
	private String Fk_rg;
	
	private String tableName = "usuarios";
	private String fieldsName = "Nome,Senha,Email,Nivel_acesso,Id,FK_rg";
	private String keyField = "Id";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Usuarios() {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	
	public Usuarios(String Nome,String Senha,String Email, String Nivel_Acesso,int Id,String Fk_rg) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNome(Nome);
		this.setSenha(Senha);
		this.setEmail(Email);
		this.setNivel_Acesso(Nivel_Acesso);
		this.setId(Id);
		this.setFk_rg(Fk_rg);
	}
	
	public Usuarios(String Nome,String Senha,String Email, String Nivel_Acesso,String Id,String Fk_rg) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNome(Nome);
		this.setSenha(Senha);
		this.setEmail(Email);
		this.setNivel_Acesso(Nivel_Acesso);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
		this.setFk_rg(Fk_rg);
	}
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getNome(),
					""+this.getSenha(),
					""+this.getEmail(),
					""+this.getNivel_Acesso(),
					""+this.getId(),
					""+this.getFk_rg(),
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
				saida += "<td>" + rs.getString("nome")+"</td>";
				saida += "<td>" + rs.getString("senha")+"</td>";
				saida += "<td>" + rs.getString("email")+"</td>";
				saida += "<td>" + rs.getString("Nivel_Acesso")+"</td>";
				saida += "<td>" + rs.getString("id")+"</td>";
				saida += "<td>" + rs.getString("Fk_rg")+"</td>";
				saida += "</tr> <br>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}
	
	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public String getSenha() {
		return Senha;
	}

	public void setSenha(String senha) {
		Senha = senha;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getNivel_Acesso() {
		return Nivel_Acesso;
	}

	public void setNivel_Acesso(String nivel_Acesso) {
		Nivel_Acesso = nivel_Acesso;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}


	public String getFk_rg() {
		return Fk_rg;
	}

	public void setFk_rg(String fk_rg) {
		Fk_rg = fk_rg;
	}
}
