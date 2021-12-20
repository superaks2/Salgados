package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produtos;
import model.Usuarios;
import model.Usuarios2;

/**
 * Servlet implementation class AdminCtrl
 */
@WebServlet(urlPatterns = {"/admin/usuarios/gerenciar","/admin/usuarios/deletar", "/admin/usuarios/atualizar", "/admin/usuarios/editar", "/admin/usuarios/inserir"})
public class AdminUsuariosCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUsuariosCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String uri = request.getRequestURI();
			String action = uri.substring(uri.lastIndexOf("/")+1);
			
			System.out.println("============== AdminUsuariosCtrl ==============\n");
			switch (action) {
				case "inserir": {
					String Nome = request.getParameter("Nome"); 
					String Senha = request.getParameter("Senha");
					String Email = request.getParameter("Email");
					String Nivel_Acesso = request.getParameter("Nivel_Acesso");
					System.out.println("Nível de Acesso: " + Nivel_Acesso);
					
					String sql = "INSERT INTO usuarios (nome, senha, email, nivel_acesso) values (\"" + Nome + "\",md5(" + Senha + "), \"" + Email + "\"," + Nivel_Acesso + ")";
					System.out.println("sql de inserir: " + sql);
					Usuarios usuarios = new Usuarios();
					usuarios.insertSql(sql);
					
					request.getRequestDispatcher("/admin/usuarios/gerenciar.jsp").forward(request, response);
					break;
				}
				case "editar": { // Realiza a ação de editar os dados
					// Redireciona o usuário para a página de editar com os dados preenchidos
					String id = request.getParameter("id");
					System.out.println("Id recebido: " + id);
					Usuarios usuarios = new Usuarios();
					ResultSet rs = usuarios.getUsuarios("Id=" + id );
					request.setAttribute("usuarios", rs);
			
					
					request.getRequestDispatcher("/admin/usuarios/editar.jsp").forward(request, response);
					break;
				}
				case "atualizar": { // Realiza a ação de atualizar os dados
					System.out.println("Controller.atualizar");
					String Nome = request.getParameter("Nome"); 
					String Senha = request.getParameter("Senha");
					String Email = request.getParameter("Email");
					String id = request.getParameter("id");
					String Nivel_Acesso = request.getParameter("Nivel_Acesso");
					System.out.println("Nível de Acesso: " + Nivel_Acesso);
					System.out.println("Id para atualizar: " + id);
					Usuarios usuarios = new Usuarios();
					String sql = "UPDATE usuarios set nome=\"" + Nome + "\", senha=md5(\"" + Senha + "\"), email=\"" + Email + "\", nivel_acesso=" + Nivel_Acesso + " WHERE id = " + id;
					System.out.println("sql de aatualizar: " + sql);
					usuarios.insertSql(sql);
					request.getRequestDispatcher("/admin/usuarios/gerenciar.jsp").forward(request, response);
					break;
				}
				case "deletar": {
					System.out.println("Controller deletar");
					String id = request.getParameter("id");
					Usuarios usuarios = new Usuarios();
					usuarios.delete(id);
					request.getRequestDispatcher("/admin/usuarios/gerenciar.jsp").forward(request, response);
					break;
				}
				default:
					request.getRequestDispatcher("/admin/usuarios/gerenciar.jsp").forward(request, response);
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
