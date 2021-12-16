package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Carrinhos{
	private float ValorTotal;
	private int FKVendas;
	private int FKProdutos;
	private int    Id; // chave primária
	private int Quantidade;
	
	private String tableName = "carrinhos";
	private String fieldsName = "ValorTotal, FKVendas, FKProdutos, Id, Quantidade";
	private String keyField = "Id";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Carrinhos() {

		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Carrinhos(float ValorTotal,int FKVendas,int FKProdutos, int Id,int Quantidade) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setValorTotal(ValorTotal);
		this.setFKVendas(FKVendas);
		this.setFKProdutos(FKProdutos);
		this.setId(Id);
		this.setQuantidade(Quantidade);
	}
	
	public Carrinhos(String ValorTotal,String FKVendas,String FKProdutos, String Id,String Quantidade) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setValorTotal((ValorTotal==null) ? 0 : Float.valueOf(ValorTotal));
		this.setFKVendas((FKVendas==null) ? 0 : Integer.valueOf(FKVendas));
		this.setFKProdutos((FKProdutos==null) ? 0 : Integer.valueOf(FKProdutos));
		this.setId((Id==null) ? 0 : Integer.valueOf(Id));
		this.setQuantidade((Quantidade==null) ? 0 : Integer.valueOf(Quantidade));
	}
	
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getValorTotal(),
					""+this.getFKVendas(),
					""+this.getFKProdutos(),
					""+this.getId(),
					""+this.getQuantidade(),
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
				saida += "<td>" + rs.getString("ValorTotal")+"</td>";
				saida += "<td>" + rs.getString("FKVendas")+"</td>";
				saida += "<td>" + rs.getString("FKProdutos")+"</td>";
				saida += "<td>" + rs.getString("Id")+"</td>";
				saida += "<td>" + rs.getString("Quantidade")+"</td>";
				saida += "</tr> <br>";
			};
		}catch (SQLException e) {
			e.printStackTrace();
		}
		saida += "</table>";
		return (saida);
	}

	public float getValorTotal() {
		return ValorTotal;
	}

	public void setValorTotal(float valorTotal) {
		ValorTotal = valorTotal;
	}

	public int getFKVendas() {
		return FKVendas;
	}

	public void setFKVendas(int fKVendas) {
		FKVendas = fKVendas;
	}

	public int getFKProdutos() {
		return FKProdutos;
	}

	public void setFKProdutos(int fKProdutos) {
		FKProdutos = fKProdutos;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getQuantidade() {
		return Quantidade;
	}

	public void setQuantidade(int quantidade) {
		Quantidade = quantidade;
	}


}
	