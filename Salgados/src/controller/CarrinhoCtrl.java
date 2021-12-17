package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produtos;

/**
 * Servlet implementation class CarrinhoCtrl
 */
@WebServlet("/api/carrinho/*")
public class CarrinhoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarrinhoCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/")+1);
		
		switch(action) {
			/*
			 * Retorna os produtos do carrinho
			 * 
			 * */
			case "produtos": {
				
				ArrayList<String> idsArray = new ArrayList<String>();
				
				System.out.println(request.getParameter("produtos"));

				String ids = null;
				
				/*
				 * Coleta o JSON no formato:
				 * [
				 * 	{id: 2, foto: '...'},
				 * 	...
				 * ]
				 *
				 * e considiera somente o id para adicionar na string id
				 * */
				Enumeration<String> parameterList = request.getParameterNames();
				while( parameterList.hasMoreElements() )
				{
				  String sName = parameterList.nextElement().toString();
				  if(sName.toLowerCase().startsWith("produtos")){
				    String[] sMultiple = request.getParameterValues( sName );
				    if( 1 >= sMultiple.length && sName.contains("[id]")) {
				      // System.out.println( sName + " = " + request.getParameter( sName ) + "" );
				      idsArray.add(request.getParameter(sName));
				    }
				    else {
				      for(int i=0; i<sMultiple.length; i++ ) {
				      	System.out.println( sName + "[" + i + "] = " + sMultiple[i] + "" );    
				      }  	
				    }
				  }
				}
				
				ids = String.join(",", idsArray);
				Produtos produtos = new Produtos();
				ResultSet rs = produtos.getProdutos("ID IN (" + ids + ")");
				ArrayList<String> produtosArray = new ArrayList<String>();
				
				try {
					String jsonProduto = "";
					while(rs.next()) {
						jsonProduto += "{\"id\": " + rs.getString("Id") + ", \"foto\": \"" + rs.getString("foto") + "\", \"nome\": \"" + rs.getString("nome") + "\", \"valor\": " + rs.getString("valor") + "}";
						produtosArray.add(jsonProduto);
						jsonProduto = "";
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				String jsonProdutos = String.join(",", produtosArray);
				jsonProdutos = "[" + jsonProdutos + "]";
				response.setContentType("application/json");
				response.getWriter().print(jsonProdutos);

				
				break;
			}
			default: {
				Produtos produtos = new Produtos();
				RequestDispatcher tagFile = null;
				tagFile = getServletContext().getRequestDispatcher("/app/cardapio-detalhe.jsp");
				tagFile.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
