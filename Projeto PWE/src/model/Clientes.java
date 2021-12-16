package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Clientes{
	private String CPF; // chave prim�ria
	private String Telefone;
	private String Nome;
	private String CEP;
	private String Endereco;
	
	private String tableName = "clientes";
	private String fieldsName = "CPF,Telefone,Nome, CEP, Endereco";
	private String keyField = "CPF";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Clientes() {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Clientes(String CPF,String Telefone,String Nome, String CEP, String Endereco) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setCPF(CPF);
		this.setTelefone(Telefone);
		this.setNome(Nome);
		this.setCEP(CEP);
		this.setEndereco(Endereco);
	}
	
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getCPF(),
					""+this.getTelefone(),
					""+this.getNome(),
					""+this.getCEP(),
					""+this.getEndereco(),
			}
		);
	}
	
	public void save() {
		if(this.getCPF() == "") {
			this.dbQuery.insert(this.toArray());
		}else {
			this.dbQuery.update(this.toArray());
		}
	}
	
	public void delete() {
		if(this.getCPF() != "") {
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
				saida += "<td>" + rs.getString("CPF")+"</td>";
				saida += "<td>" + rs.getString("Telefone")+"</td>";
				saida += "<td>" + rs.getString("Nome")+"</td>";
				saida += "<td>" + rs.getString("CEP")+"</td>";
				saida += "<td>" + rs.getString("Endereco")+"</td>";
				saida += "</tr> <br>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String cPF) {
		CPF = cPF;
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

	public String getCEP() {
		return CEP;
	}

	public void setCEP(String cEP) {
		CEP = cEP;
	}

	public String getEndereco() {
		return Endereco;
	}

	public void setEndereco(String endereco) {
		Endereco = endereco;
	}
}
