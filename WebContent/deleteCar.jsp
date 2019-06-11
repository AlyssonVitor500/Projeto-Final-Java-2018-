<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%@ page language="java"  import="conexao.Conectar" %>



<%
	int id = Integer.parseInt(request.getParameter("id"));
	
	
	
	try {
		Connection conn = Conectar.getConnection();
		String sql = "DELETE FROM cars WHERE id = ?";
		PreparedStatement sts = conn.prepareStatement(sql);
		
		sts.setInt(1,id);
		sts.execute();
		sts.close();
		conn.close();
		session.setAttribute("DellS", "!@#");
		response.sendRedirect("listCars.jsp");
		
	}catch (SQLException e){
		session.setAttribute("DellN", "!@#");
		response.sendRedirect("listCars.jsp");
	     
	} 
	
	
	
%>