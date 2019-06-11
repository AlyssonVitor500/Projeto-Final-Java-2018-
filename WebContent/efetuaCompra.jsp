<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page language="java" import="java.util.Date" %>
<%@ page language="java" import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.text.DateFormat" %>
<%@ page language="java"  import="conexao.Conectar" %>


<%
	DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy"); 
	DateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");
	Date date = new Date(); 

	
	
	int idCar = Integer.parseInt(request.getParameter("id"));
	Integer idUser = (Integer) session.getAttribute("IdSessao"); 
	String cep = request.getParameter("cep");
	String localizacao = request.getParameter("localizacao");
	
	
	try{
		
		Connection conn = Conectar.getConnection();
		String sql = "INSERT INTO comprasFeitas (cep, localizacao, idUser, idCar, dataHora,time) values (?,?,?,?,?,?)";
		PreparedStatement stm = conn.prepareStatement(sql);
		stm.setString(1,cep);
		stm.setString(2,localizacao);
		stm.setInt(3, idUser);
		stm.setInt(4, idCar);
		stm.setString(5, dateFormat1.format(date));
		stm.setString(6, dateFormat2.format(date));
		
		stm.execute();
		stm.close();
		conn.close();
		
		session.setAttribute("CompraFeita", "Right");
		response.sendRedirect("home.jsp");
		

		
	}catch(SQLException e){
		out.print(e);
	}
%>