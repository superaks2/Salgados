package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class home
 */
@WebServlet( urlPatterns = {"/Usuarios/*"})
public class UsuariosCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsuariosCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/")+1);
		
		RequestDispatcher tagFile = null;
		
		switch(action) {
			case "view": {
				tagFile = getServletContext().getRequestDispatcher("/ViewUsuario.jsp");
				tagFile.forward(request, response);
			}break;
			
			
			case "del": {
				Usuarios usuarios = new Usuarios();
				usuarios.deletar();
				tagFile = getServletContext().getRequestDispatcher("/ViewUsuario.jsp");
				tagFile.forward(request, response);
			}break;
			
			
			case "update": {
				Usuarios usuarios = new Usuarios();
				usuarios.atualizar();
				tagFile = getServletContext().getRequestDispatcher("/ViewUsuario.jsp");
				tagFile.forward(request, response);
			}break;
			
			
			case "add": {
				Usuarios usuarios = new Usuarios();
				usuarios.adicionar();
				tagFile = getServletContext().getRequestDispatcher("/ViewUsuario.jsp");
				request.setAttribute("acao", "add");
				tagFile.forward(request, response);
			}break;
			
			
			
			
			default:
			//throw new IllegalArgumentException("Unexpected value: " + action);
				response.getWriter().write("UsuariosCtrl.java");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPut(request, response);
	}
	
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doDelete(request, response);
	}
}