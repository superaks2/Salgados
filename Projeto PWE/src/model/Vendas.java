package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Vendas{
	private int Quantidade;
	private float ValorTotal;
	private String Data;
	private int    Id; // chave primária
	private String Fk_Carrinhos;
	private String Fk_Produtos;
	
	private String tableName = "vendas";
	private String fieldsName = "Quantidade,ValorTotal,Data,Id,FK_Carrinhos,FK_Produtos";
	private String keyField = "Id";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Vendas() {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Vendas(int Quantidade,float ValorTotal,String Data, String FK_Carrinhos,int Id,String FK_Produtos) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setQuantidade(Quantidade);
		this.setValorTotal(ValorTotal);
		this.setData(Data);
		this.setFk_Carrinhos(FK_Carrinhos);
		this.setId(Id);
		this.setFk_Produtos(FK_Produtos);
	}
	
	public Vendas(String Quantidade,String ValorTotal,String Data, String FK_Carrinhos,String Id,String FK_Produtos) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setQuantidade(((Quantidade==null) ? 0 : Integer.valueOf(Quantidade)));
		this.setValorTotal(((ValorTotal==null) ? 0 : Float.valueOf(ValorTotal)));
		this.setData(Data);
		this.setFk_Carrinhos(FK_Carrinhos);
		this.setId(((Id==null) ? 0 : Integer.valueOf(Id)));
		this.setFk_Produtos(FK_Produtos);
	}
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getQuantidade(),
					""+this.getValorTotal(),
					""+this.getData(),
					""+this.getFk_Carrinhos(),
					""+this.getId(),
					""+this.getFk_Produtos(),
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
				saida += "<td>" + rs.getString("Quantidade")+"</td>";
				saida += "<td>" + rs.getString("ValorTotal")+"</td>";
				saida += "<td>" + rs.getString("Data")+"</td>";
				saida += "<td>" + rs.getString("FK_Carrinhos")+"</td>";
				saida += "<td>" + rs.getString("id")+"</td>";
				saida += "<td>" + rs.getString("FK_Produtos")+"</td>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}

	public int getQuantidade() {
		return Quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.Quantidade = quantidade;
	}

	public float getValorTotal() {
		return ValorTotal;
	}

	public void setValorTotal(float valorTotal) {
		this.ValorTotal = valorTotal;
	}

	public String getData() {
		return Data;
	}

	public void setData(String data) {
		this.Data = data;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		this.Id = id;
	}

	public String getFk_Carrinhos() {
		return Fk_Carrinhos;
	}

	public void setFk_Carrinhos(String fk_Carrinhos) {
		this.Fk_Carrinhos = fk_Carrinhos;
	}

	public String getFk_Produtos() {
		return Fk_Produtos;
	}

	public void setFk_Produtos(String fk_Produtos) {
		this.Fk_Produtos = fk_Produtos;
	}
}
	