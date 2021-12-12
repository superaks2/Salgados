package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Carrinhos{
	private float Valor;
	private String FK_Produtos;
	private String FK_Clientes;
	private String Metodo_Pagamento;
	private int    Id; // chave primária
	private String FK_RG;
	
	private String tableName = "carrinhos";
	private String fieldsName = "Valor,FK_produtos,FK_Clientes,Metodo_Pagamento,Id,FK_RG";
	private String keyField = "Id";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Carrinhos() {

		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Carrinhos(float Valor,String FK_Produtos,String FK_Clientes, String Metodo_Pagamento,int Id,String FK_RG) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setValor(Valor);
		this.setFK_Produtos(FK_Produtos);
		this.setFK_Clientes(FK_Clientes);
		this.setMetodo_Pagamento(Metodo_Pagamento);
		this.setId(Id);
		this.setFK_RG(FK_RG);
	}
	
	public Carrinhos(String Valor,String FK_Produtos,String FK_Clientes, String Metodo_Pagamento,String Id,String FK_RG) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setValor(((Valor==null) ? 0 : Float.valueOf(Valor)));
		this.setFK_Produtos(FK_Produtos);
		this.setFK_Clientes(FK_Clientes);
		this.setMetodo_Pagamento(Metodo_Pagamento);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
		this.setFK_RG(FK_RG);
	}
	
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getValor(),
					""+this.getFK_Produtos(),
					""+this.getFK_Clientes(),
					""+this.getMetodo_Pagamento(),
					""+this.getId(),
					""+this.getFK_RG(),
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
				saida += "<td>" + rs.getString("Valor")+"</td>";
				saida += "<td>" + rs.getString("FK_Produtos")+"</td>";
				saida += "<td>" + rs.getString("FK_Clientes")+"</td>";
				saida += "<td>" + rs.getString("Metodo_Pagamento")+"</td>";
				saida += "<td>" + rs.getString("Id")+"</td>";
				saida += "<td>" + rs.getString("FK_RG")+"</td>";
				saida += "</tr> <br>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}



	public Float getValor() {
		return Valor;
	}

	public void setValor(Float valor) {
		Valor = valor;
	}

	public String getFK_Produtos() {
		return FK_Produtos;
	}

	public void setFK_Produtos(String fK_Produtos) {
		FK_Produtos = fK_Produtos;
	}

	public String getFK_Clientes() {
		return FK_Clientes;
	}

	public void setFK_Clientes(String fK_Clientes) {
		FK_Clientes = fK_Clientes;
	}

	public String getMetodo_Pagamento() {
		return Metodo_Pagamento;
	}

	public void setMetodo_Pagamento(String metodo_Pagamento) {
		Metodo_Pagamento = metodo_Pagamento;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getFK_RG() {
		return FK_RG;
	}

	public void setFK_RG(String fK_RG) {
		FK_RG = fK_RG;
	}

}
	