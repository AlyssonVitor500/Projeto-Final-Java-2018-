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
		<%
				String catchError = (String) session.getAttribute("Ncadastrar");
				String cadastrarS = (String) session.getAttribute("cadastrarS");
				if (catchError != null){
					
					out.print(" <div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Erro ao Cadastrar Carro!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
					session.setAttribute("errorEntrar", null);
				}
				
				if (cadastrarS != null){
					
					out.print(" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Cadastrado com Sucesso!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
					session.setAttribute("cadastrarS", null);
				}
		%>
	<form action="addCar.jsp" method="POST">
		<div class="container-fluid h1" style="padding: 2% 0% 2% 0%; background-color: #071f4c; color: white; padding-left: 35%;">
			<div class=" mx-auto" style="font-family: 'AdminFont';"><a href='adminPage.jsp' style="text-decoratin: none; color: white">Página do Administrador <i class='fab fa-battle-net'></i></a> <a href='home.jsp' class='btn btn-primary ml-5'>Home <i class="fab fa-phoenix-squadron"></i></a> <a href='desloga.jsp' class='btn btn-primary ml-1'>Sair <i class="fas fa-sign-out-alt"></i></a> 
			</div>
		</div>
		<div class="container">
			<div class="card">
				<div class="card-header text-center">
						<div class='h2' style="position: relative;"><span class='' style="position:absolute; left:0"><a href='adminPage.jsp'><i class="fas fa-arrow-circle-left"></i></a></span> <span class=''>Cadastro de Carro </span><i class="fas fa-car-alt"></i></div>
				</div>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6 md-6 sm-6 text-center">
							<label for=""><strong>Nome do Carro</strong></label>
							<input type="text" class="form-control" name="nomeCarro">
						</div>
						<div class="col-lg-6 md-6 sm-6 text-center">
								<label for=""><strong>Marca do Carro</strong></label>
								<input type="text" class="form-control" name="marcaCarro">
						</div>
					</div>
					<div class="row mt-2">
							<div class="col-lg-6 md-6 sm-6 text-center">
								<label for=""><strong>Preço do Carro</strong></label>
								<input type="text" class="form-control" name="precoCarro">
							</div>
							<div class="col-lg-6 md-6 sm-6 text-center">
									<label for=""><strong>País de Origem do Carro</strong></label>
									<input type="text" class="form-control" name="origemCarro">
							</div>
					</div>
					<div class="row mt-2">
							<div class="col-lg-12 md-12 sm-12 text-center">
								<label for=""><strong>Descrição do Carro</strong></label>
								<textarea class="form-control" style="resize: none; width: 100%; height: 15vh" name="descCarro"></textarea>
							</div>
							
					</div>
					<div class="row mt-2">
							<div class="col-lg-12 md-12 sm-12 text-center">
								<label for=""><strong>Imagem Padrão</strong></label>
								<input class="form-control" style="resize: none; width: 100%;" name="defaultImg">
							</div>
							
					</div>
						
				</div>
				</div>
			
				<div class="card-footer text-right">
					<a href='listCars.jsp' class='btn btn-warning'>Carros Cadastrados <i class="fas fa-cash-register"></i></a>
					<button type="reset" class='btn btn-danger'>Apagar Valores <i class="fas fa-broom"></i></button>
					<button type="submit" class='btn btn-info'>Cadastrar Veículo <i class="far fa-paper-plane"></i></button>
				</div>
			</div>
		</div>
	</form>	
</body>
</html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>