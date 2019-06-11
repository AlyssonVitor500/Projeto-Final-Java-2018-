<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='conexao.Conectar' %>    
<%@ page language="java" import="java.sql.*" %>
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
 <link rel="icon" href="_img/logo.png" >
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
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
        div#fotos figure#fgr a {
        	text-decoration: none;
        	
        }
         div#fotos figure#fgr a h5 {
         	transition: .5s;
         	color: white;
         }
        div#fotos figure#fgr a h5:hover {
        	margin-top: -1px;
        	color:#b50e0e;
        }
    </style>
  
    	
    	
    	
    		
    	
  
    <!-- Barra de Navegação -->
    <nav style="border-bottom: 2px solid rgb(143, 8, 8);" class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
        <a class="navbar-brand" href="home.jsp">
            <img src="_img/logo.png" width="40" height="40" alt="" srcset="">
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Alterna navegação">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            
            <li class="nav-item">
              <a href='allCars.jsp' class="btn btn-default" style="background-color: white;color: black">Ver todos os Carros</a>
              	
		              <div class="dropdown float-right" style="margin-left:950px">
                    <button style="background-color: white" class="btn btn-default dropdown-toggle text-center" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <%= session.getAttribute("logadoNome") %> &nbsp;&nbsp;&nbsp; <i class="fas fa-cog fa-spin text-dark"></i>
                    </button>
                    <div class="dropdown-menu" style="width: 100%;" aria-labelledby="dropdownMenuButton">
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
                      <a class="dropdown-item" href="desloga.jsp"><i class='fas fa-sign-out-alt text-dark'></i> Sair </a>
                    </div>
					      </div>
				  
            </li>
            
            
          </ul>
        </div>
      </nav>

      
       <!-- Arquivos - Square -->
       <div class="container-fluid mt-5 pt-5" style="cursor: default; -webkit-user-select: none;">
			<div class='container h2 text-center mt-2 mb-5'>Carros Disponíveis para Compra <i class="fas fa-feather"></i></div>
			
			<%
					
					int count = 1;
			
					try{
						Connection conn = Conectar.getConnection();
						String sql = "SELECT * from Cars";
						PreparedStatement stm = conn.prepareStatement(sql);
						ResultSet rs = stm.executeQuery(sql);
						out.print("<div class='row' id='fotos'>");
						String nome = null;
						String modelo = null;
						String img = null;
						int id = 0;
						
						
						while(rs.next()) {
							id = rs.getInt("id");
							img = rs.getString("defaultImg");
							nome = rs.getString("nomeCar");
							modelo = rs.getString("marcaCar");
							if(!((count%3) == 0)){
								out.print("<div class='col-md-4'>");
				                    out.print("<figure id='fgr' style='overflow: hidden; background-image: url(_carrosFoto/"+img+"); background-size: cover; width: 30vw; height: 30vh; position: relative'>");
				                       out.print("<div class='legenda text-center' style='padding-top: 20vh;position: absolute; background-color: rgba(0,0,0,.7); height: 100%; width: 100%'>");
				                              out.print("<a href='verCarro.jsp?id="+id+"'><h5 >"+nome +" - "+modelo+"</h5></a>");
				                        out.print("</div>");
				                    out.print("</figure>");
			                	out.print("</div>");
			                
							}
						}
						
					}catch(SQLException e){
						
					}
			
			%>
            
       
       <!-- Footer -->
       
       <div class="container-fluid">
          <div class="card">

            

            <div class="card-body">
              <div class="text-center">
                  <h1>Encontre-nos em uma de nossas Lojas!</h1>
              </div>
              <div class="text-center mt-5">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15925.330738364744!2d-38.51119671740098!3d-3.7374919443662082!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x7c7488b96a82613%3A0x4237c6ffccb3a203!2sAldeota%2C+Fortaleza+-+CE!5e0!3m2!1spt-BR!2sbr!4v1558125850384!5m2!1spt-BR!2sbr" width="1000" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
              </div>
            </div>

            <div class="card-footer text-center">

                Todos os diretos reservados à <img src="_img/logo.png" width="20" height="20" alt="" srcset="">FairyCars&copy;

            </div>

          </div>

       </div>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="jquery.mask.js"></script>
<script>
	$(document).ready(function() {
		$("#cpf").mask('000.000.000-00');
		$("#banco").mask('0000 0000 0000 0000');
	});
</script>
</body>
</html>
