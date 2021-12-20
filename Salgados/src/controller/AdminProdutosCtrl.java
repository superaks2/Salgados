package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.concurrent.ExecutorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produtos;

/**
 * Servlet implementation class AdminProdutosCtrl
 */
// @WebServlet("/admin/produtos_controller/*")
@WebServlet(urlPatterns = {"/admin/produtos/editar", "/admin/produtos/adicionar", "/admin/produtos/deletar", "/admin/produtos/atualizar"})
public class AdminProdutosCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProdutosCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Chamou adiminporodutosctrl");
		// String acao = request.getParameter("acao");
		// System.out.println("Ação aqui: " + acao);
		
		
		String uri = request.getRequestURI();
		String action = uri.substring(uri.lastIndexOf("/")+1);

		
		System.out.println("============== INICIA ==============\n");
		System.out.println("\nAção: "+ action);
		switch (action) {
			case "editar": {
				System.out.println("controller Editar");
				// Redireciona o usuário para a página de editar com os dados preenchidos
				String id = request.getParameter("id");
				System.out.println("Id recebido: " + id);
				Produtos prod = new Produtos();
				ResultSet rs = prod.getProduto(id);
				request.setAttribute("produtos", rs);
				
				request.getRequestDispatcher("/admin/produtos/editar.jsp").forward(request, response);
				break;
			}
			case "atualizar": { // Realiza a ação de atualizar os dados
				System.out.println("Atualizando dados...");
				String foto = request.getParameter("foto");
				String nome = request.getParameter("nome");
				String valor = request.getParameter("valor");
				String tipo = request.getParameter("tipo");
				String id = request.getParameter("id");
				
				/*if(tipo == null || valor == null || foto == null || nome = null) {
					request.getRequestDispatcher("/admin/produtos/gerenciar.jsp").forward(request, response);
				} else {
					*/
//				}
				Produtos produtos = new Produtos(foto, nome, valor, tipo, id);
				produtos.update();
				request.getRequestDispatcher("/admin/produtos/gerenciar.jsp").forward(request, response);
				
				break;
			}
			case "deletar": {
				String id = request.getParameter("id");
				Produtos produtos = new Produtos();
				produtos.delete(id);
				request.getRequestDispatcher("/admin/produtos/gerenciar.jsp").forward(request, response);
				break;
			}
			case "adicionar": {
				System.out.println("AÇÃO ADICIONAR");
				String nome = request.getParameter("nome"); // isso
				String valor = request.getParameter("valor");
				String tipo = request.getParameter("tipo");
				String foto = request.getParameter("foto");
				
				Produtos produtos = new Produtos(foto, nome, valor, tipo, 0);
				produtos.save();
				request.getRequestDispatcher("/admin/produtos/gerenciar.jsp").forward(request, response);
				break;
			}
		}
		System.out.println("============== FINALIZA ==============\n");
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
