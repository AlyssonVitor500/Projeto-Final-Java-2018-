<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page language="java" import="conexao.Conectar"%>
<%
	String logado = (String) session.getAttribute("logadoNome");
	int idCar = Integer.parseInt(request.getParameter("id"));
	if (logado == null || logado == "Admin") {
		response.sendRedirect("index.jsp");
	}

%>
<%
				
				String nome = null;
				String origem = null;
				String preco = null;
				String marca = null;
				String desc = null;
				String img = null;
				try{
						Connection conn = Conectar.getConnection();
						String sql = "SELECT * FROM Cars WHERE id = "+idCar;
						PreparedStatement psm = conn.prepareStatement(sql);
						//psm.setInt(1, id);
						ResultSet rs = psm.executeQuery(sql);
						
						while(rs.next()){
							nome = rs.getString("nomeCar");
							origem = rs.getString("origemCar");
							preco = rs.getString("precoCar");
							marca = rs.getString("marcaCar");
							desc = rs.getString("descricao");
							
						}
								
				}catch(SQLException e){
					System.out.print("ERROR" + e);
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
							<%= session.getAttribute("logadoNome") %>
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

	<!-- CONTEUDO -->

	<div class="container mt-5 mb-5 pt-5">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<div class="carousel-inner" style="height: 70vh; overflow: hidden">
				<%
            				
							try{
								Connection conn = Conectar.getConnection();
								String sql = "SELECT * FROM dirCars where carFk = " + idCar;
								PreparedStatement psm = conn.prepareStatement(sql);
								ResultSet rs = psm.executeQuery(sql);
								int count = 0;
								while(rs.next()){
									if (count==0){
										out.print("<div class='carousel-item active'> <img  class='d-block w-100 responsive-img' src='_carrosFoto/"+rs.getString("dir")+"'></div>");
									}else {
										out.print("<div class='carousel-item'> <img class='d-block w-100 responsive-img' src='_carrosFoto/"+rs.getString("dir")+"'></div>");
									}
									
									count++;
								}
								
							}catch(Exception e){
								
							}
							
							
						%>



			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Anterior</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Próximo</span>
			</a>
		</div>
		<style>
input[type='text'].dados {
	text-align: center;
	border: none;
	border-bottom: 1px solid rgb(92, 7, 7);
	transition: .5s;
	background-color: white;
}

input[type='text'].dados:hover {
	border-bottom: 1px solid rgb(161, 12, 12);
}
</style>
		<div class='container text-center mb-4'>
			<div class="row mt-2">
				<div class="col-lg-12 md-6 sm-6 text-center">
					<label class='h5' for="">Nome do Carro</label> <input type="text"
						style="text-align: center" value='<%= nome %>' disabled name=""
						class='form-control dados' id="">
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-lg-6 md-6 sm-6 text-center">
					<label class='h5' for="">Marca</label> <input type="text"
						style="text-align: center" value='<%= marca %>' disabled name=""
						class='form-control dados' id="">
				</div>
				<div class="col-lg-6 md-6 sm-6 text-center">
					<label class='h5' for="">Origem do Carro</label> <input type="text"
						style="text-align: center" value='<%= origem %>' disabled name=""
						class='form-control dados' id="">
				</div>
			</div>
			<div class="row mt-2">
				<div class="col-lg-6 md-6 sm-6 text-center">
					<label class='h5' for="">Descrição do Carro</label> <input
						type="text" style="text-align: center" disabled
						value='<%= desc %>' name="" class='form-control dados' id="">
				</div>
				<div class="col-lg-6 md-6 sm-6 text-center">
					<label class='h5' for="">Preço do Carro</label> <input type="text"
						style="text-align: center" value='R$ <%= preco %>' disabled
						name="" class='form-control dados' id="">
				</div>
			</div>
			<div class='row mt-2'>
				<div class="col-lg-6 md-6 sm-6">
					<a href="allCars.jsp" class='btn btn-info btn-lg w-100'>Voltar
						<i class="fas fa-undo"></i>
					</a>
				</div>
				<div class="col-lg-6 md-6 sm-6">
					<a href="comprarCar.jsp?id=<%= idCar %>"
						class='btn btn-danger btn-lg w-100'>Comprar <i
						class="fas fa-shopping-cart"></i></a>
				</div>

			</div>
		</div>
	</div>
	<!-- FIM CONTEUDO -->

	<!-- Footer -->

	<div class="container-fluid">
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
