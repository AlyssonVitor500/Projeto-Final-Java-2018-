<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>    

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
	<div class="container-fluid h1" style="padding: 2% 0% 2% 0%; background-color: #071f4c; color: white; padding-left: 35%;">
		<div class=" mx-auto" style="font-family: 'AdminFont';"><a href='adminPage.jsp' style="text-decoratin: none; color: white">Página do Administrador <i class='fab fa-battle-net'></i></a> <a href='home.jsp' class='btn btn-primary ml-5'>Home <i class="fab fa-phoenix-squadron"></i></a> <a href='desloga.jsp' class='btn btn-primary ml-1'>Sair <i class="fas fa-sign-out-alt"></i></a> 
		</div>
	</div>
	<div class="container" style='font-size: 2em'>
		<div class="row mt-5">
			<div class="text-center col-lg-6 md-6 sm-6 mt-5"><a href='cadastroCarro.jsp' class='h1 btn btn-primary btn-lg' style='color: white; width: 90%; font-size: 0.8em'>Cadastrar Carro <i class="fas fa-car"></i></a></div>
			<div class="text-center col-lg-6 md-6 sm-6 mt-5"><a href='listCars.jsp' class='h1 btn btn-primary btn-lg' style='color: white; width: 90%; font-size: 0.8em'>Visualizar Carros  <i class="fas fa-car"></i></a></div>
		</div>	
		
	</div>
	
</body>
</html>