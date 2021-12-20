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
	
	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Usuarios() {
		this.tableName = "usuarios";
		this.fieldsName = "Nome,Senha,Email,Nivel_Acesso,Id";
		this.keyField = "Id";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	

	public ResultSet query(String where) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		ResultSet rs= this.dbQuery.select(where);
		return rs;
	}
	public ResultSet getUsuario(String id) {
		ResultSet rs= this.dbQuery.select("Id=" + id);
		return rs;
	}
	

	public Usuarios(String Nome,String Senha,String Email,String Nivel_Acesso,int Id) {
		this.tableName = "usuarios";
		this.fieldsName = "Nome,Senha,Email,Nivel_Acesso,Id";
		this.keyField = "Id";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNome(Nome);
		this.setSenha("md5(" + Senha + ")");
		this.setEmail(Email);
		this.setNivel_Acesso(Nivel_Acesso);
		this.setId(Id);
	}
	
	
	
	public Usuarios(String Nome,String Senha,String Email,String Nivel_Acesso,String Id) {
		this.tableName = "usuarios";
		this.fieldsName = "Nome,Senha,Email,Nivel_Acesso,Id";
		this.keyField = "Id";
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setNome(Nome);
		this.setSenha("md5(" + Senha + ")");
		this.setEmail(Email);
		this.setNivel_Acesso(Nivel_Acesso);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
	}
	
	
	public String[] toArray() {
			return (
				new String[] {
					""+this.getNome(),
					""+this.getSenha(),
					""+this.getEmail(),
					""+this.getNivel_Acesso(),
					""+this.getId(),
					}
				);
	}
	
	public void save() {
		if((this.getId() == 0)) {
			this.dbQuery.insert(this.toArray());
		} else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public int insertSql(String sql) {
		return this.dbQuery.execute(sql);
	}
	
	public void update() {
		this.dbQuery.update(this.toArray());
	}
	
	public void delete(String where) {
		System.out.println("Model delete");
		this.dbQuery.delete("Id=" + where);
	}
	
	
	public String listAll() {
		ResultSet rs= this.dbQuery.select("");
		String saida = "<br>";
		
		try{
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("Id")+"</td>";
				saida += "<td>" + rs.getString("Nome")+"</td>";
				saida += "<td>" + rs.getString("Email")+"</td>";
				saida += "<td>" + rs.getString("Nivel_Acesso")+"</td>";
				saida += "<td><form action=\"editar\"><input class=\"btn btn-primary\" style=\"width: 80px;\" type=\"submit\" value=\"editar\"><input type=\"hidden\" name=\"id\" value=\"" + rs.getString("Id") + "\"></form> <form action=\"deletar\"><input type=\"hidden\" name=\"id\" value=\"" + rs.getString("Id") + "\"><input style=\"width: 80px;\" class=\"btn btn-danger\" type=\"submit\" name=\"acao\" value=\"deletar\"></form></td>";
				saida += "</tr>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return (saida);
	}

	
	
	public ResultSet getUsuarios(String where) {
		 ResultSet rs = this.dbQuery.select(where);
		return rs;
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

	public void setNivel_Acesso(String Nivel_Acesso) {
		this.Nivel_Acesso = Nivel_Acesso;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}
	
	
}
