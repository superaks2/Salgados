package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBQuery;

public class Vendas{
	private float ValorTotal;
	private String Data;
	private int    Id; // chave primária
	private String FkClientes;
	private String Metodo_Pagamento;
	
	private String tableName = "vendas";
	private String fieldsName = "Id, ValorTotal, Metodo_Pagamento, Data, FKClientes";
	private String keyField = "Id";
	private String where = "";
	private DBQuery dbQuery = null;
	
	public Vendas() {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
	}
	
	public Vendas(float ValorTotal, int Id, String FKClientes, String Metodo_Pagamento) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setValorTotal(ValorTotal);
		this.setId(Id);
		this.setFkClientes(FKClientes);
		this.setMetodo_Pagamento(Metodo_Pagamento);
	}
	
	public Vendas(String ValorTotal, String Id, String FKClientes, String Metodo_Pagamento, String Data) {
		this.dbQuery = new DBQuery(this.tableName, this.fieldsName, this.keyField);
		
		this.setValorTotal((ValorTotal==null) ? 0 : Float.valueOf(ValorTotal));
		this.setId((Id==null) ? 0 : Integer.valueOf(Id));
		this.setFkClientes(FKClientes);
		this.setMetodo_Pagamento(Metodo_Pagamento);
		this.setData(Data);
	}
	
	public String[] toArray() {

		return (
			new String[] {
					""+this.getValorTotal(),
					""+this.getId(),
					""+this.getFkClientes(),
					""+this.getMetodo_Pagamento(),
					""+this.getData(),
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
				saida += "<td>" + rs.getString("Quantidade")+"</td>";
				saida += "<td>" + rs.getString("ValorTotal")+"</td>";
				saida += "<td>" + rs.getString("Data")+"</td>";
				saida += "<td>" + rs.getString("FK_Carrinhos")+"</td>";
				saida += "<td>" + rs.getString("id")+"</td>";
				saida += "<td>" + rs.getString("FK_Produtos")+"</td>";
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

	public String getData() {
		return Data;
	}

	public void setData(String data) {
		Data = data;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getFkClientes() {
		return FkClientes;
	}

	public void setFkClientes(String fkClientes) {
		FkClientes = fkClientes;
	}

	public String getMetodo_Pagamento() {
		return Metodo_Pagamento;
	}

	public void setMetodo_Pagamento(String metodo_Pagamento) {
		Metodo_Pagamento = metodo_Pagamento;
	}

}
	