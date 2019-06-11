<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%@ page language="java"  import="conexao.Conectar" %>



<%
	String nome = request.getParameter("dir");
	int idCar = Integer.parseInt(request.getParameter("id"));
	
	try {
		Connection conn = Conectar.getConnection();
		String sql = "insert into dirCars (dir, carFk) VALUES (?,?)";
		
		
		PreparedStatement sts = conn.prepareStatement(sql);
		sts.setString(1, nome);
		sts.setInt(2, idCar);
	
		
		sts.execute();
		sts.close();
		conn.close();
		session.setAttribute("ImgAddS", "Cadastrar");
		response.sendRedirect("imagemCarros.jsp?id="+idCar);
		
	}catch (SQLException e){
		System.out.print(e);
		session.setAttribute("ImgAddD", "Cadastrar");
		response.sendRedirect("imagemCarros.jsp?id="+idCar);
	     
	} 
	
	
	
%>