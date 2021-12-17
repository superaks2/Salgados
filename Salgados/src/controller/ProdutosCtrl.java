package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produtos;

/**
 * Servlet implementation class ProdutosCtrl
 */
@WebServlet("/app/produtos")
public class ProdutosCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdutosCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		Produtos prod = new Produtos();
		
		prod.getProdutos(null);
		
		request.setAttribute("teste", "salve");
		request.setAttribute("produtos", "");
		request.getRequestDispatcher("/app/carrinho.jsp").forward(request, response);
		
		/*
		RequestDispatcher tagFile = null;
		tagFile = getServletContext().getRequestDispatcher("/app/carrinho.jsp");
		tagFile.forward(request, response);
		*/
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
