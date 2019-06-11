<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<%@ page language="java"  import="conexao.Conectar" %>



<%
	String nome = request.getParameter("nome");
	String senha = request.getParameter("senha");
	String first = request.getParameter("Fnome");
	String last = request.getParameter("Lnome");
	String cpf = request.getParameter("cpf");
	String banco = request.getParameter("bancoNum");
	try {
		Connection conn = Conectar.getConnection();
		String sql = "INSERT INTO user (nome, senha, primeiroNome, ultimoNome, cpf, cartao) VALUES (?,?,?,?,?,?)";
		
		
		PreparedStatement sts = conn.prepareStatement(sql);
		
		sts.setString(1, nome);
		sts.setString(2, senha);
		sts.setString(3, first);
		sts.setString(4, last);
		sts.setString(5, cpf);
		sts.setString(6, banco);
		sts.execute();
		sts.close();
		conn.close();
		session.setAttribute("cadastraS", "Cadastrar");
		response.sendRedirect("index.jsp");
		
	}catch (SQLException e){
	     
		session.setAttribute("cadastraD", "Cadastrar");
		response.sendRedirect("index.jsp");
	} 
	
	
	
%>