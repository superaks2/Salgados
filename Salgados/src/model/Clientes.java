package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Clientes {
	private String CPF; // chave primária
	private String Telefone;
	private String Nome;
	private String CEP;
	private String Endereco;
	


	private String tableName = "";
	private String fieldsName = "";
	private String keyField = "";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Clientes() {
		this.tableName = "clientes";
		this.fieldsName = "CPF,Telefone,Nome,CEP,Endereco";
		this.keyField = "CPF";
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	
	
	public Clientes(String cpf,String Telefone,String Nome, String Cep, String Endereco) {
		this.tableName = "clientes";
		this.fieldsName = "CPF,Telefone,Nome,CEP,Endereco";
		this.keyField = "CPF";
		
		this.setCPF(cpf);
		this.setTelefone(Telefone);
		this.setNome(Nome);
		this.setCEP(Cep);
		this.setEndereco(Endereco);
		
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getCPF(),
					""+this.getTelefone(),
					""+this.getNome(),
					""+this.getCEP(),
					""+this.getEndereco()
			}
		);
	}
	
	public void save() {
		ResultSet rs = this.dbQuery.select("CPF=\"" + this.getCPF() + "\"");
		try {
			if (!rs.isBeforeFirst() ) {    
				this.dbQuery.insert(this.toArray());
			}  else {
				this.dbQuery.update(this.toArray());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public void delete() {
		if(this.getCPF() != "") {
			this.dbQuery.deleteValues(this.toArray());
		}
	}
	
	public String listAll() {
		ResultSet rs= this.dbQuery.select("");
		String saida = "<br>";
		saida += "<table border=1>";
		
		try{
			while(rs.next()) {
				saida += "<tr>";
				saida += "<td>" + rs.getString("CPF")+"</td>";
				saida += "<td>" + rs.getString("Telefone")+"</td>";
				saida += "<td>" + rs.getString("Nome")+"</td>";
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



	public void setCPF(String cpf) {
		CPF = cpf;
	}



	public String getTelefone() {
		return Telefone;
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