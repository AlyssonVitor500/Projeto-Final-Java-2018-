<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%@ page language="java"  import="conexao.Conectar" %>



<%
	String nome = request.getParameter("nomeCarro");
	String origem = request.getParameter("origemCarro");
	String preco = request.getParameter("precoCarro");
	String marca = request.getParameter("marcaCarro");
	String img = request.getParameter("defaultImg");
	String desc = request.getParameter("descCarro");
	
	try {
		Connection conn = Conectar.getConnection();
		String sql = "INSERT INTO cars (marcaCar, precoCar, origemCar, nomeCar, descricao,defaultImg) VALUES (?,?,?,?,?,?)";
		
		
		PreparedStatement sts = conn.prepareStatement(sql);
		
		sts.setString(1, marca);
		sts.setString(2, preco);
		sts.setString(3, origem);
		sts.setString(4, nome);
		sts.setString(5, desc);
		sts.setString(6, img);
		
		sts.execute();
		sts.close();
		conn.close();
		session.setAttribute("cadastrarS", "Cadastrar");
		response.sendRedirect("cadastroCarro.jsp");
		
	}catch (SQLException e){
		session.setAttribute("Ncadastrar", "Cadastrar");
		response.sendRedirect("cadastroCarro.jsp");
	     
	} 
	
	
	
%>
