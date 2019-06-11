<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<%@ page language="java" import="conexao.Conectar"%>

<%
	String logado = (String) session.getAttribute("logadoNome");

	if (logado == null) {
		response.sendRedirect("index.jsp");
	}
	String cpf = null;
	String primeiroNome = null;
	String ultimoNome = null;
	String nCartao = null;

	try {

		Connection conn = Conectar.getConnection();
		String sql = "SELECT * FROM user WHERE nome = ?";

		PreparedStatement sts = conn.prepareStatement(sql);

		sts.setString(1, logado);

		ResultSet rs = sts.executeQuery();

		while (rs.next()) {
			cpf = (String) rs.getString("cpf");
			primeiroNome = (String) rs.getString("primeiroNome");
			ultimoNome = (String) rs.getString("ultimoNome");
			nCartao = (String) rs.getString("cartao");

		}
	} catch (SQLException e) {
		throw e;
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
	<%
		String successAlter = (String) session.getAttribute("success");
		String NsuccessAlter = (String) session.getAttribute("Nsuccess");

		String senhaError = (String) session.getAttribute("senhaError");

		if (successAlter != null) {

			out.print(
					" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Dados alterados com Sucesso!!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("success", null);
		}
		if (NsuccessAlter != null) {

			out.print(
					" <div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Dados não alterados! Tente novamente</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("Nsuccess", null);
		}
		if (senhaError != null) {

			out.print(
					" <div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Senha atual errada! Tente novamente</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("senhaError", null);
		}
	%>
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
									out.print(
											"<a class='dropdown-item' href='account.jsp'> <i class='far fa-user-circle text-danger'></i> Conta </a>");
									out.print(
											"<a class='dropdown-item' href='comprasFeitas.jsp'><i class='fas fa-shopping-basket text-danger'></i> Compras Feitas </a>");
								}
							%>


							<%
								if (logado == "Admin") {
									out.print(
											"<a class='dropdown-item' href='adminPage.jsp'><i class='fab fa-battle-net text-danger'></i> AdminPage </a>");
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

	<style>
div.imagemProfile {
	padding: 1px;
	width: 400px;
	height: 400px;
	border-radius: 100%;
	background-image: url('_usersImgs/default.png');
	background-size: cover;
	background-position: 50% 50%;
	border: 1px solid rgb(68, 9, 9);
}

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
	<!-- Conteúdo -->

	<div class="container" style="margin-top: 10%;">
		<div class="imagemProfile mx-auto"></div>

		<div class="container text-center mt-5">
			<div class="h1">
				Dados Pessoais <i class="far fa-address-card"></i>
			</div>
		</div>

		<div class="row mt-2">
			<div class="col-lg-12 md-12 sm-12 text-center">
				<label for="" class='h5'>Email do Usuário</label> <input type="text"
					disabled name="" value='<%out.print(logado);%>' id=""
					class="form-control dados">
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-lg-6 md-5 sm-6 text-center">
				<label for="" class='h5'>Primeiro Nome</label> <input type="text"
					disabled name="" value='<%out.print(primeiroNome);%>' id=""
					class="form-control dados">
			</div>
			<div class="col-lg-6 md-5 sm-6 text-center">
				<label for="" class='h5'>Último Nome</label> <input type="text"
					disabled name="" value='<%out.print(ultimoNome);%>' id=""
					class="form-control dados">
			</div>
		</div>
		<div class="row mt-2">
			<div class="col-lg-6 md-5 sm-6 text-center">
				<label for="" class='h5'>Número do Cartão</label> <input type="text"
					disabled name="" id="" value='<%out.print(nCartao);%>'
					class="form-control dados">
			</div>
			<div class="col-lg-6 md-5 sm-6 text-center">
				<label for="" class='h5'>Cpf</label> <input type="text" disabled
					name="" id="" value='<%out.print(cpf);%>'
					class="form-control dados">
			</div>
		</div>
		<div class="row mt-4 text-center">
			<div class="col-lg-6 md-6 sm-6 ">
				<button class='btn btn-danger btn-lg' style='width: 80%;'
					data-toggle='modal' data-target="#modalEdit">
					Alterar Informações <i class="fas fa-user-edit"></i>
				</button>
			</div>
			<div class="col-lg-6 md-6 sm-6 ">
				<button class='btn btn-primary btn-lg' style='width: 80%;'
					data-toggle='modal' data-target="#modalEditSenha">
					Alterar Senha <i class="fas fa-key"></i>
				</button>
			</div>
		</div>
	</div>
	<!-- Fim do Conteúdo -->
	<footer class='mt-5'>
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
	</footer>
	<!--Modal Edit User unless Senha-->
	<form action="uploadUser.jsp" method="post">
		<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog"
			aria-labelledby="ModalEdit" aria-hidden="true">
			<div class="modal-dialog " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalEdit">
							Editar Usuário <i class="far fa-edit"></i>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Fechar">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row mt-2">
							<div class="col-lg-12 md-12 sm-12 text-center">
								<label for="" class='h5'>Email</label> <input type="email"
									style='text-align: center' required name="emailUser"
									value='<%out.print(logado);%>' id="" class="form-control">
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-lg-6 md-5 sm-6 text-center">
								<label for="" class='h5'>Primeiro Nome</label> <input
									type="text" style='text-align: center' required
									name="firstName" value='<%out.print(primeiroNome);%>' id=""
									class="form-control">
							</div>
							<div class="col-lg-6 md-5 sm-6 text-center">
								<label for="" class='h5'>Último Nome</label> <input type="text"
									style='text-align: center' required name="lastName"
									value='<%out.print(ultimoNome);%>' id="" class="form-control">
							</div>
						</div>
						<div class="row mt-2">
							<div class="col-lg-6 md-5 sm-6 text-center">
								<label for="" class='h5'>Número do Cartão</label> <input
									type="text" style='text-align: center' required name="nCartao"
									id="banco" value='<%out.print(nCartao);%>' class="form-control">
							</div>
							<div class="col-lg-6 md-5 sm-6 text-center">
								<label for="" class='h5'>Cpf</label> <input type="text"
									style='text-align: center' required name="cpf" id="cpf"
									value='<%out.print(cpf);%>' class="form-control">
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<style>
button#fechar {
	background-color: rgb(24, 43, 58);
	color: white;
	transition: .5s;
}

button#fechar:hover {
	background-color: rgb(19, 28, 34);
}

button#alterar {
	background-color: rgb(70, 9, 9);
	color: white;
	transition: .5s;
}

button#alterar:hover {
	background-color: rgb(36, 13, 13);
}
</style>

						<button type="reset" id="fechar" class="btn">
							Restaurar Valores <i class="fas fa-broom"></i>
						</button>
						<button type="submit" id="alterar" class="btn">
							Enviar <i class="far fa-paper-plane"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!--Modal Edit Senha-->

	<style>
input#senhaNova, input#senhaNovaAgain {
	transition: .9s;
}
</style>
	<form action="updateUserSenha.jsp" method="post">
		<div class="modal fade" id="modalEditSenha" tabindex="-1"
			role="dialog" aria-labelledby="ModalEdit" aria-hidden="true">
			<div class="modal-dialog " role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalEdit">
							Editar Senha <i class="fab fa-keycdn"></i>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Fechar">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body text-center">

						<div class="row mt-1">
							<div class="col-lg-12 md-12 sm-12 text-center">

								<label for="">Senha Antiga</label> <input type="password"
									name="senhaAntiga" required id="senhaAntiga"
									class="form-control">

							</div>
						</div>
						<div class="row mt-3">
							<div class="col-lg-12 md-12 sm-12 text-center">

								<label for="">Nova Senha</label> <input type="password"
									name="senhaNova" required id="senhaNova" class="form-control">

							</div>
						</div>
						<div class="row mt-1">
							<div class="col-lg-12 md-12 sm-12 text-center">

								<label for="">Digite Novamente</label> <input type="password"
									name="" required id="senhaNovaAgain" class="form-control">

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<style>
button#fechar {
	background-color: rgb(24, 43, 58);
	color: white;
	transition: .5s;
}

button#fechar:hover {
	background-color: rgb(19, 28, 34);
}

button#enviar {
	background-color: rgb(70, 9, 9);
	color: white;
	transition: .5s;
}

button#enviar:hover {
	background-color: rgb(36, 13, 13);
}
</style>

						<button type="reset" id="fechar" class="btn">
							Restaurar Valores <i class="fas fa-broom"></i>
						</button>
						<button type="submit" id="enviar" class="btn">
							Enviar <i class="far fa-paper-plane"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
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
<script>
	setInterval(verificaSenha, 200);
	var senha1 = document.getElementById("senhaNova");
	var senha2 = document.getElementById("senhaNovaAgain");

	function verificaSenha() {
		var senha1Valor = document.getElementById("senhaNova").value;
		var senha2Valor = document.getElementById("senhaNovaAgain").value;
		if (senha1Valor == "" && senha2Valor == "") {
			senha1.style.border = "1px solid rgba(119, 115, 115,.4)";
			senha2.style.border = "1px solid rgba(119, 115, 115,.4)";
		} else {
			if (senha1Valor != senha2Valor) {
				document.getElementById("enviar").disabled = true;
				senha1.style.border = "1px solid #910d0d";
				senha2.style.border = "1px solid #910d0d";
			} else {
				document.getElementById("enviar").disabled = false;
				senha1.style.border = "1px solid #119111";
				senha2.style.border = "1px solid #119111";
			}
		}

	}
</script>

</body>
</html>

