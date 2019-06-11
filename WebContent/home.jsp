<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String logado = (String) session.getAttribute("logadoNome");

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





	
	<%
				String compraRealizada = (String) session.getAttribute("CompraFeita");
				
				
				if (compraRealizada != null){
					
					out.print(" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Compra realizada com Sucesso!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
					session.setAttribute("CompraFeita", null);
				}
		%>

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

	<!-- Slide -->
	<div id="carouselExampleIndicators"
		style="height: 90vh; overflow: hidden;" id="carros"
		class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100 responsive-img" src="_img/carro1.jpg"
					style="margin-top: -30vh" alt="Primeiro Slide">

			</div>
			<div class="carousel-item">
				<img class="d-block w-100 responsive-img" src="_img/carro2.jpg"
					alt="Segundo Slide">

			</div>
			<div class="carousel-item">
				<img class="d-block w-100 responsive-img" src="_img/carro3.jpg"
					style="margin-top: -30vh" alt="Terceiro Slide">

			</div>
			<div class="carousel-item">
				<img class="d-block w-100 responsive-img" src="_img/carro4.jpg"
					style="margin-top: -30vh" alt="Terceiro Slide">

			</div>
			<div class="carousel-item">
				<img class="d-block w-100 responsive-img" src="_img/carro5.jpg"
					style="margin-top: -30vh" alt="Terceiro Slide">

			</div>
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
	<!-- Arquivos - Square -->
	<div class="container-fluid pt-5"
		style="cursor: default; -webkit-user-select: none;">

		<div class="row" id="fotos">
			<div class="col-md-4">
				<figure id="fgr"
					style="overflow: hidden; background-image: url(_img/carro1Sqr.jpg); background-size: cover; width: 30vw; height: 30vh; position: relative">
					<div class="legenda text-center"
						style="padding-top: 20vh; position: absolute; background-color: rgba(0, 0, 0, .7); height: 100%; width: 100%">
						<h5 style="color: white;">Os melhores Modelos</h5>
					</div>
				</figure>
			</div>
			<div class="col-md-4">
				<figure id="fgr"
					style="overflow: hidden; background-image: url(_img/carroSqr.jpg); background-size: cover; width: 30vw; height: 30vh; position: relative">
					<div class="legenda text-center"
						style="padding-top: 20vh; position: absolute; background-color: rgba(0, 0, 0, .7); height: 100%; width: 100%">
						<h5 style="color: white;">Os melhores Preços</h5>
					</div>
				</figure>
			</div>
			<div class="col-md-4">
				<figure id="fgr"
					style="overflow: hidden; background-image: url(_img/carroSqr1.jpg); background-size: cover; width: 30vw; height: 30vh; position: relative">
					<div class="legenda text-center"
						style="padding-top: 20vh; position: absolute; background-color: rgba(0, 0, 0, .7); height: 100%; width: 100%">
						<h5 style="color: white;">As melhores Marcas</h5>
					</div>
				</figure>
			</div>
		</div>
		<hr>
	</div>
	<!-- Conteúdo -->

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
