<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*" %>    
<%@ page language="java" import="conexao.Conectar" %>
<%
	String logado = (String) session.getAttribute("logadoNome");

	if (logado == null || logado != "Admin") {
		response.sendRedirect("index.jsp");
	}
	

%>	
<%

	int id = Integer.parseInt(request.getParameter("id"));
	String nome = request.getParameter("nomeCarro");
	String origem = request.getParameter("origemCarro");
	float preco = Float.parseFloat(request.getParameter("precoCarro"));
	String marca = request.getParameter("marcaCarro");
	String desc = request.getParameter("descCarro");
	String img = request.getParameter("imgDefaul");

		try {
			Connection conn = Conectar.getConnection();
			String sql = "update cars set nomeCar = ?, origemCar = ?, precoCar = ?, marcaCar = ?, descricao = ?, defaultImg = ? WHERE id = " + id;
			
			
			PreparedStatement sts = conn.prepareStatement(sql);
		
			sts.setString(1, nome);
			sts.setString(2, origem);
			sts.setFloat(3, preco);
			sts.setString(4, marca);
			sts.setString(5, desc);
			sts.setString(6, img);
			
			
			sts.execute();
			session.setAttribute("AlterCarS", "success");
			response.sendRedirect("listCars.jsp");
			
			
			
			
		}catch (SQLException e){
			System.out.print(e);
			session.setAttribute("AlterCarN", "Nsuccess");
			response.sendRedirect("listCars.jsp");
		    
	}
	


%>