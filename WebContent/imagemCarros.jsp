<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="conexao.Conectar" %>    
<%@ page language="java" import="java.sql.*" %>
<%
	String logado = (String) session.getAttribute("logadoNome");
	int idCar = Integer.parseInt(request.getParameter("id"));
	
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
		String catchError = (String) session.getAttribute("ImgAddD");
		String cadastrarS = (String) session.getAttribute("ImgAddS");
		if (catchError != null){
			
			out.print(" <div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Erro ao Mandar Imagem</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("ImgAddD", null);
		}
		
		if (cadastrarS != null){
			
			out.print(" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Imagem Adicionada!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("ImgAddS", null);
		}
		
		String removeS = (String) session.getAttribute("ImgRmD");
		String removeD = (String) session.getAttribute("ImgRmS");
		if (removeD != null){
			
			out.print(" <div class='alert alert-success alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Imagem Apagada!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("ImgRmS", null);
		}
		
		if (removeS != null){
			out.print("<div class='alert alert-danger alert-dismissible fade show fixed-top text-center' role='alert' style='position: absolute; z-index:999999'> <strong>Erro ao apagar Imagem!</strong>  <button type='button' class='close' data-dismiss='alert' aria-label='Close'> <span aria-hidden='true'>&times;</span>  </button> </div>");
			session.setAttribute("ImgRmD", null);
			
		}
		
	%>
      <div class="container-fluid h1" style="padding: 2% 0% 2% 0%; background-color: #071f4c; color: white; padding-left: 35%;">
        <div class=" mx-auto" style="font-family: 'AdminFont';"><a href='adminPage.jsp' style="text-decoratin: none; color: white">Página do Administrador <i class='fab fa-battle-net'></i></a> <a href='home.jsp' class='btn btn-primary ml-5'>Home <i class="fab fa-phoenix-squadron"></i></a> <a href='desloga.jsp' class='btn btn-primary ml-1'>Sair <i class="fas fa-sign-out-alt"></i></a> 
        </div>
      </div>
      <div class="container">
          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
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
										out.print("<div class='carousel-item active'> <img style='margin-top: -20%' class='d-block w-100' src='_carrosFoto/"+rs.getString("dir")+"'></div>");
									}else {
										out.print("<div class='carousel-item'> <img class='d-block w-100' src='_carrosFoto/"+rs.getString("dir")+"'></div>");
									}
									
									count++;
								}
								
							}catch(Exception e){
								
							}
							
							
						%>
            	
                
                
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	            <span class="sr-only">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	            <span class="carousel-control-next-icon" aria-hidden="true"></span>
	            <span class="sr-only">Próximo</span>
            </a>
       </div>
       
       <div class="row mt-2">
          <div class="col-lg-6">
              <button class='btn btn-info btn-lg w-100' data-target="#modalRemoveFoto" data-toggle="modal">Apagar Imagem <i class="far fa-times-circle"></i></button>
          </div>
          <div class="col-lg-6 ">
              <button class='btn btn-danger btn-lg w-100' data-target="#modalAddFoto" data-toggle="modal">Adicionar Imagem <i class="fas fa-plus-circle"></i></button>
          </div>
       </div>
	
	</div>
	
</body>
</html>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


<form action="addPictureCar.jsp?id=<% out.print(idCar); %>"  method="post">
  <div class="modal fade" id="modalAddFoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Adicionar Foto <i class="far fa-images"></i></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <div class="row mt-2">
                  <div class="col-lg-12 text-center">
                      <label for="">Escreva o nome do arquivo na pasta <em>_carrosFoto</em></label>
                      <input type="text" name="dir" class="form-control" id="">
                  </div>
              </div>
          </div>
          <div class="modal-footer">
          
            <button type="submit" class="btn btn-danger">Salvar mudanças <i class="far fa-save"></i></button>
          </div>
        </div>
      </div>
    </div>
</form>   





  <div class="modal fade" id="modalRemoveFoto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Remover Foto <i class="far fa-images"></i></h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
              <table class="table table-hover">
                  <thead class='bg-danger text-center text-light'>
                      <th>Nome</th>
                      <th></th>
                  </thead>
                  <tbody class='text-center'>
                      <%
              		
                        try{
                            Connection conn = Conectar.getConnection();
                            String sql = "SELECT * FROM dirCars WHERE carFk = "+ idCar;
                            
                            PreparedStatement sts = conn.prepareStatement(sql);
                            
                            ResultSet rs = sts.executeQuery(sql);
                            int idDir = 0;
                            while(rs.next()){
                            	idDir = rs.getInt("id");
                              out.print("<tr><td>"+rs.getString("dir")+"<td class='text-info'><a href='delDir.jsp?idDir="+idDir+"&idCar="+idCar+"'><i class='far fa-times-circle'></i></a></tr>");
                            }
                            
                        }catch(SQLException e){
                          
                        }
                  
                    %>
                  </tbody>

              </table>
          	
             
          </div>
          <div class="modal-footer">
          
        
          </div>
        </div>
      </div>
    </div>
</form>  
