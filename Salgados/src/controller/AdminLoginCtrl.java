package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBQuery;
import model.Usuarios;
import model.Usuarios2;

/**
 * Servlet implementation class AdminLoginCtrl
 */
@WebServlet("/admin/login/*")
public class AdminLoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Usuarios usuario = new Usuarios();
		
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		
		ResultSet rs = usuario.query("senha=md5(" + senha + ") AND email=\"" + email + "\"");
		
		try {
			// Existe usuário
			Boolean as = rs.isBeforeFirst();
			System.out.println("resultado de as: " + as);
			if(as) {
				rs.next();
				HttpSession session=request.getSession();  
				System.out.println("Usuário: " + rs.getString("nome"));
			    session.setAttribute("usuario", rs.getString("nome"));
			    request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
			} else { 
				request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// request.getRequestDispatcher("/admin/produtos/gerenciar.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
