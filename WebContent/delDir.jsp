<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%@ page language="java"  import="conexao.Conectar" %>



<%
	
	int id = Integer.parseInt(request.getParameter("idDir"));
	int idCar = Integer.parseInt(request.getParameter("idCar"));
	try {
		Connection conn = Conectar.getConnection();
		String sql = "delete from dirCars where id = "+ id;
		
		
		PreparedStatement sts = conn.prepareStatement(sql);
		
	
		
		sts.execute();
		sts.close();
		conn.close();
		session.setAttribute("ImgRmS", "Cadastrar");
		response.sendRedirect("imagemCarros.jsp?id="+idCar);
		
	}catch (SQLException e){
		System.out.print(e);
		session.setAttribute("ImgRmD", "Cadastrar");
		response.sendRedirect("imagemCarros.jsp?id="+idCar);
	     
	} 
	
	
	
%>