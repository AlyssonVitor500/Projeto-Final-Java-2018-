<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>    
<%@ page language="java" import="conexao.Conectar" %>
<%
	String logado = (String) session.getAttribute("logadoNome");

	if (logado == null || logado != "Admin") {
		response.sendRedirect("index.jsp");
	}

%>
<html>
<head>
 <style>
 	@font-face {
 		font-family: 'AdminFont';
 		src:url('_fonts/Square.ttf');
 	}
 </style>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
 <link rel="icon" href="_img/logo.png" >
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Página do Administrador</title>
</head>
<body>
	<%
				String DellS = (String) session.getAttribute("DellS");
				String DellN = (String) session.getAttribute("DellN");
				if (DellS != null){
					
					out.print(" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Deletado Com Sucesso!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
					session.setAttribute("DellS", null);
				}
				
				if (DellN != null){
					
					out.print(" <div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Erro ao Deletar! Tente novamente mais Tarde!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
					session.setAttribute("DellN", null);
				}
		%>
		<%
			String alterN = (String) session.getAttribute("AlterCarN");
			String alterS = (String) session.getAttribute("AlterCarS");
			if (alterN != null){
				
				out.print(" <div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Erro ao Alterar, Tente novamente!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
				session.setAttribute("AlterCarN", null);
			}
			
			if (alterS != null){
				
				out.print(" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Alterado Com Sucesso!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
				session.setAttribute("AlterCarS", null);
			}
		
		%>
	<div class="container-fluid h1" style="padding: 2% 0% 2% 0%; background-color: #071f4c; color: white; padding-left: 35%;">
		<div class=" mx-auto" style="font-family: 'AdminFont';"><a href='adminPage.jsp' style="text-decoratin: none; color: white">Página do Administrador <i class='fab fa-battle-net'></i></a> <a href='home.jsp' class='btn btn-primary ml-5'>Home <i class="fab fa-phoenix-squadron"></i></a> <a href='desloga.jsp' class='btn btn-primary ml-1'>Sair <i class="fas fa-sign-out-alt"></i></a> 
		</div>
	</div>
	<div class="container text-center">
		<div class="h2">Carros Cadastrados <i class="fas fa-th"></i></div>
	</div>
	<div class="container">
			<table class='table table-hover'>
					<thead class='text-center' style='background-color: #071f4c; color: white'>
						<th>ID</th>
						<th>Nome do Carro</th>
						<th>Marca do Carro</th>
						<th>Origem do Carro</th>
						<th>Preço do Carro</th>
						<th></th>
						<th></th>
						<th></th>
					</thead>
					<tbody class='text-center'>
						<%
							try{
								Connection conn = Conectar.getConnection();
								String sql = "SELECT * FROM cars";
								PreparedStatement psm = conn.prepareStatement(sql);
								ResultSet rs = psm.executeQuery(sql);
								
								while(rs.next()){
									out.print("<tr><td>"+ rs.getInt("id") +" <td>"+ rs.getString("nomeCar") +" <td>"+ rs.getString("marcaCar") +"<td>"+ rs.getString("origemCar") +"<td>R$ "+ rs.getFloat("precoCar") +"<td ><a title='Ver Imagens do Carro' href='imagemCarros.jsp?id="+rs.getInt("id")+"' class='text-info'><i class='fas fa-images'></i></a> <td ><a href='deleteCar.jsp?id="+rs.getInt("id")+"'  class='text-danger'><i title='Deletar Carro' class='far fa-times-circle'></i></a> <td > <a href='alterCar.jsp?id="+rs.getInt("id")+"' class='text-primary'><i title='Alter Dados' class='fas fa-pencil-alt'></i></a></tr>");
								}
								
							}catch(Exception e){
								
							}
							
							
						%>
					</tbody>
			</table>
	</div>
	
</body>
</html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>