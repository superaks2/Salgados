<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import = "java.sql.ResultSet" %>
    <%
    	ResultSet rs = (ResultSet) request.getAttribute("produtos");
    
    	/* Verifica se existe registro no banco de dados */
	    if (!rs.isBeforeFirst() ) {    
	       	out.println("<h3 class=\"text-white text-center\">Nenhum dado para exibir!</h3>");
	    } 
    %>
    
    <% while(rs.next()) { %>
		<div class="col-4 mb-4 salgado" onclick="acaoProduto(event, this)" data-produto='{"id": <%= rs.getString("Id") %>, "foto": "<%= rs.getString("foto") %>", "nome": "<%= rs.getString("nome") %>", "valor": <%= rs.getString("valor") %>}'>
            <div class="prato bg-white rounded overflow-hidden">
              <figure class="rounded overflow-hidden mb-0">
                <img src="<%= rs.getString("Foto") %>">
              </figure>
              <div class="prato-textos p-3 text-dark bg-white">
                <h5><%= rs.getString("nome") %></h5>
                  <!-- coxinha recheada com hambúrguer, maionese e ketchup. -->
                  <small class="mt-2 text-success"><b>R$ <%= rs.getString("valor") %></b></small>
              </div>
              <hr class="w-80 mx-auto my-0">
              <div class="row prato-footer d-flex p-3">
                  <div class="col-6 prato-footer-esquerda">
                  	<div class="input-group input-group-sm input-add">
					  <button class="btn btn-outline-secondary left minus" type="button"><span class="fa fa-minus"></span></button>
					  <input type="text" class="form-control normal input-number text-center" value="1" min="1" max="10">
					  <button class="btn btn-outline-secondary right plus" type="button"><span class="fa fa-plus"></span></button>
					</div>
                </div>
                <div class="col-6 prato-footer-direita ml-auto">
                  <div class="d-flex justify-content-end">
                    <button class="btn btn-primary style-1 sem-box btn-sm ml-auto btn-add">Adicionar</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
   	<% } %>
   	
   	
          