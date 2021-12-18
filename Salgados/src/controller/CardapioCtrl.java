package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produtos;

/**
 * Servlet implementation class CardapioCtrl
 */
@WebServlet("/cardapio-detalhe/*")
public class CardapioCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CardapioCtrl() {
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
			 * A rota cardapio-detalhe/detalhe deve receber o parametro (tipo)
			 * para retornar todos os produtos de uma categoria
			 * 
			 * */
			case "detalhe": {
				Produtos produtos = new Produtos();
				String tipo = request.getParameter("tipo");
				ResultSet rs = null;
				if(tipo != null) {
					rs = produtos.getProdutos("Tipo=\"" + tipo + "\"");
				} else {
					rs = produtos.getProdutos("");
				}
				request.setAttribute("produtos", rs);
				getServletContext().getRequestDispatcher("/app/cardapio/detalhe.jsp").forward(request, response);;
				break;
			}
			default: {
				Produtos produtos = new Produtos();
				RequestDispatcher tagFile = null;
				ResultSet rs = produtos.getProdutos("");
				request.setAttribute("produtos", rs);
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
