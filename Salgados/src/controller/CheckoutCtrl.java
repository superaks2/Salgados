package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Clientes;
import model.Produtos;
import model.Usuarios2;
import model.Vendas;

/**
 * Servlet implementation class CheckoutCtrl
 */
@WebServlet("/app/finaliza-pedido")
public class CheckoutCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// Dados usuário
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String cpf = request.getParameter("cpf");
		String telefone = request.getParameter("telefone");
		
		// Endereço
		String cep = request.getParameter("cep");
		String endereco = request.getParameter("endereco");
		
		// Salva dados do usuário
		Clientes clientes = new Clientes(cpf, telefone, nome, cep, endereco);
		clientes.save();
		
		// Produto
		ArrayList<String> allIds = new ArrayList<String>();
		ArrayList<String> allQuantidades = new ArrayList<String>();
		Enumeration<String> parameterList = request.getParameterNames();
		while( parameterList.hasMoreElements() )
		{
		  String sName = parameterList.nextElement().toString();
		  if(sName.toLowerCase().startsWith("produtos")){
		    String[] sMultiple = request.getParameterValues( sName );
		    if( 1 >= sMultiple.length && sName.contains("[id]")) {
		    	allIds.add(request.getParameter(sName));
		      // System.out.println( sName + " = " + request.getParameter( sName ) + "" );
		    }
		    else if( 1 >= sMultiple.length && sName.contains("[quantidade]")) {
		    	allQuantidades.add(request.getParameter(sName));
		    }
		    else {
		      for(int i=0; i<sMultiple.length; i++ ) {
		      	System.out.println( sName + "[" + i + "] = " + sMultiple[i] + "" );    
		      }  	
		    }
		  }
		}
		
		// Busca produtos:
		Produtos prod = new Produtos();
		ResultSet resultProdutos = prod.getProdutos("Id in (" + String.join(",", allIds) +")");
		
		// Calcula custo total
		Float custo = (float)0.0;
		try {
			while(resultProdutos.next()) {
				for(int i = 0; i < allIds.size(); i++) {
					if(resultProdutos.getString("Id").contains(allIds.get(i))) {
						Float valor =  Float.parseFloat(resultProdutos.getString("valor"));
						int quantidade = Integer.parseInt(allQuantidades.get(i));
						custo += valor * quantidade;
						Vendas vendas = new Vendas(valor * quantidade, cpf);
						vendas.save();
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// Vendas(int Quantidade,float ValorTotal,String Data, String FK_Carrinhos,int Id,String FK_Produtos) {
		
		response.getWriter().print("ok");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
