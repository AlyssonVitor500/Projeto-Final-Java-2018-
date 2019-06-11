<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page language="java" import="conexao.Conectar"%>
<%
	String logado = (String) session.getAttribute("logadoNome");
	int id = (Integer) session.getAttribute("IdSessao");
	if (logado == null) {
		response.sendRedirect("index.jsp");
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="icon" href="_img/logo.png">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Fairy Cars</title>
</head>
<body>
	<style>
::-webkit-scrollbar {
	width: 2px;
}

::-webkit-scrollbar-thumb {
	background-color: rgb(143, 8, 8);
}

div#fotos figure#fgr:hover div.legenda {
	opacity: 1;
}

div#fotos figure#fgr div.legenda {
	opacity: 0;
	transition: .4s;
}
</style>








	<!-- Barra de Navegação -->
	<nav style="border-bottom: 2px solid rgb(143, 8, 8);"
		class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a class="navbar-brand" href="home.jsp"> <img src="_img/logo.png"
			width="40" height="40" alt="" srcset="">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Alterna navegação">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">

				<li class="nav-item"><a href='allCars.jsp'
					class="btn btn-default"
					style="background-color: white; color: black">Ver todos os
						Carros</a>

					<div class="dropdown float-right" style="margin-left: 950px">
						<button style="background-color: white"
							class="btn btn-default dropdown-toggle text-center" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<%=session.getAttribute("logadoNome")%>
							&nbsp;&nbsp;&nbsp; <i class="fas fa-cog fa-spin text-dark"></i>
						</button>
						<div class="dropdown-menu" style="width: 100%;"
							aria-labelledby="dropdownMenuButton">
							<%
								if (logado != "Admin") {
									out.print("<a class='dropdown-item' href='account.jsp'> <i class='far fa-user-circle text-danger'></i> Conta </a>");
									out.print("<a class='dropdown-item' href='comprasFeitas.jsp'><i class='fas fa-shopping-basket text-danger'></i> Compras Feitas </a>");
								}
							%>


							<%
								if (logado == "Admin") {
									out.print("<a class='dropdown-item' href='adminPage.jsp'><i class='fab fa-battle-net text-danger'></i> AdminPage </a>");
								}
							%>
							<hr>
							<a class="dropdown-item" href="desloga.jsp"><i
								class='fas fa-sign-out-alt text-dark'></i> Sair </a>
						</div>
					</div></li>


			</ul>
		</div>
	</nav>


	<!-- Conteúdo -->
	<div class="container  mt-5 pt-5">
		<div class="container-fluid h2 mt-5">
			<div class="container text-center mt-5">Todas suas Compras na
				FairyCars</div>
		</div>

		<div class="container text-center">
			<table class="table table-hover mt-4">
				<thead class='bg-danger text-light'>
					<th>Identificador da Compra</th>
					<th>CEP</th>
					<th>Localização</th>
					<th>Nome do Carro</th>
					<th>Marca do Carro</th>
					<th>Preço do Carro</th>
					<th>Data e Hora</th>
				</thead>
				<tbody>
					<%
						String dataHora = null;
						String time = null;
						int idCompra = 0;
						String cep = null;
						String localizacao = null;
						String marcaCar = null;
						String precoCar = null;
						String nomeCar = null;
						
						try{
							Connection conn = Conectar.getConnection();
							String sql = " SELECT cf.dataHora, cf.time, cf.id, cf.cep, cf.localizacao, c.marcaCar, c.precoCar, c.nomeCar  from comprasfeitas as cf, cars as c WHERE cf.idUser = "+id+" and c.id = cf.idCar ORDER BY cf.dataHora, cf.time DESC";
							PreparedStatement stm = conn.prepareStatement(sql);
							
							ResultSet rs = stm.executeQuery(sql);
							
							while(rs.next()){
								dataHora = rs.getString("dataHora");
								time = rs.getString("time");
								idCompra = rs.getInt("id");
								cep = rs.getString("cep");
								localizacao = rs.getString("localizacao");
								marcaCar = rs.getString("marcaCar");
								precoCar = rs.getFloat("precoCar") + "";
								nomeCar = rs.getString("nomeCar");
								
								
								
								
								
								//Começando a Inserir na tabela
								
								out.print("<tr><td>"+idCompra+"<td>"+cep+"<td>"+localizacao+"<td>"+nomeCar+"<td>"+marcaCar+"<td> R$ "+precoCar+"<td>"+ dataHora+" às " + time +"</tr>");
								
							}
							
						}catch(SQLException e){
							out.print( e);
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<!-- Footer -->

	<div class="container-fluid mt-5">
		<div class="card">



			<div class="card-body">
				<div class="text-center">
					<h1>Encontre-nos em uma de nossas Lojas!</h1>
				</div>
				<div class="text-center mt-5">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15925.330738364744!2d-38.51119671740098!3d-3.7374919443662082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7c7488b96a82613%3A0x4237c6ffccb3a203!2sAldeota%2C+Fortaleza+-+CE!5e0!3m2!1spt-BR!2sbr!4v1558125850384!5m2!1spt-BR!2sbr"
						width="1000" height="400" frameborder="0" style="border: 0"
						allowfullscreen></iframe>
				</div>
			</div>

			<div class="card-footer text-center">

				Todos os diretos reservados à <img src="_img/logo.png" width="20"
					height="20" alt="" srcset="">FairyCars&copy;

			</div>

		</div>

	</div>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script src="jquery.mask.js"></script>
<script>
	$(document).ready(function() {
		$("#cpf").mask('000.000.000-00');
		$("#banco").mask('0000 0000 0000 0000');
	});
</script>
</body>
</html>
