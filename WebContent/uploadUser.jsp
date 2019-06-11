<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
<%@ page language="java"  import="conexao.Conectar" %>


<%

	Integer id = (Integer) session.getAttribute("IdSessao");
	String nome = request.getParameter("emailUser");
	String primeiroNome = request.getParameter("firstName");
	String ultimoNome = request.getParameter("lastName");
	String cartao = request.getParameter("nCartao");
	String cpf = request.getParameter("cpf");


		try {
			Connection conn = Conectar.getConnection();
			String sql = "update user set nome = ?, primeiroNome = ?, ultimoNome = ?, cartao = ?, cpf = ? WHERE id = ?";
			
			
			PreparedStatement sts = conn.prepareStatement(sql);
		
			sts.setString(1, nome);
			sts.setString(2, primeiroNome);
			sts.setString(3, ultimoNome);
			sts.setString(4, cartao);
			sts.setString(5, cpf);
			sts.setInt(6, id);
			
			sts.execute();
			session.setAttribute("success", "success");
			response.sendRedirect("account.jsp");
			
			
			
			
		}catch (SQLException e){
			session.setAttribute("Nsuccess", "Nsuccess");
			response.sendRedirect("account.jsp");
		    
	}
	


%>