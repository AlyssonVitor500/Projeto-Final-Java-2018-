<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
<%@ page language="java"  import="conexao.Conectar" %>


<%

	int count = 0;

	String nome = request.getParameter("emailLogin");
	String senha = request.getParameter("senhaLogin");
	Integer id = 0;
	if (nome.equals("admin@admin") &&  senha.equals("master450")){
		session.setAttribute("logadoNome", "Admin");
		response.sendRedirect("home.jsp");
	}else {
		try {
			Connection conn = Conectar.getConnection();
			String sql = "SELECT * FROM user WHERE nome = ? and senha = ?";
			
			
			PreparedStatement sts = conn.prepareStatement(sql);
		
			sts.setString(1, nome);
			sts.setString(2, senha);
			ResultSet rs = sts.executeQuery();
			
			while (rs.next()) {
				count++;
				id = rs.getInt("id");
				
			}
			
			if(count>0){
				session.setAttribute("IdSessao", (Integer) id);
				session.setAttribute("logadoNome", nome);
				response.sendRedirect("home.jsp");
				
			
			}else {
				session.setAttribute("errorEntrar", "ERROR");
				response.sendRedirect("index.jsp");
			}
			
		}catch (SQLException e){
		     throw  e;
		    
		} 
	}
	
	


%>