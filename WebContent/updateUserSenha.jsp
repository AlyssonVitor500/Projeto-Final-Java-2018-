<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
<%@ page language="java"  import="conexao.Conectar" %>


<%

	Integer id = (Integer) session.getAttribute("IdSessao");
	String senhaAntiga = request.getParameter("senhaAntiga");
	String senhaNova = request.getParameter("senhaNova");



		try {
			Connection conn = Conectar.getConnection();
			String sql = "select senha from user WHERE id = ?";
			PreparedStatement sts = conn.prepareStatement(sql);
			
			sts.setInt(1, (Integer) id);
			ResultSet rs = sts.executeQuery();
			
			while (rs.next()){
				if(senhaAntiga.equals(rs.getString("senha"))){
					String sql1 = "update user set senha = ?  WHERE id = ?";
					PreparedStatement stm = conn.prepareStatement(sql1);
					stm.setString(1, senhaNova);
					stm.setInt(2, id);
					stm.execute();
					session.setAttribute("success", "success");
										
				}else {
					session.setAttribute("senhaError", "Nsuccess");
					
				}
				
				response.sendRedirect("account.jsp");
			}
			

			
		}catch (SQLException e){
			throw  e;
		    
	}
	


%>