<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="entidades.Empleado"%>


<!DOCTYPE html>
<html lang="en">
    
<head>
        <title>::Materiales:de:Contruccion::</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" href="bootstrap/img/logo-fav.png" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="bootstrap/css/matrix-login.css" />
        <link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <div id="loginbox">     <h1 style="text-align: center; color: #E8E8E8">Bienvenidos</h1>    
        
        <%  Empleado userSession = (Empleado)session.getAttribute("userSession");
        
           if(userSession != null ){
        	   String tipo = userSession.getTipo();
        	   int tipo_int=0;
        	   if(tipo.equals("EA")){tipo_int=1;}
        	   if(tipo.equals("CA")){tipo_int=2;}
        	   if(tipo.equals("VE")){tipo_int=3;}
        	   if(tipo.equals("DE")){tipo_int=4;}
   			switch (tipo_int) {
   			case 2:			
   				response.sendRedirect("indexCA.jsp");
   				break;				
   			case 3:			
   				response.sendRedirect("indexVE.jsp");
   				break;			
   			case 1:			
   				response.sendRedirect("indexEA.jsp");
   				break;				
   			case 4:			
   				response.sendRedirect("indexDE.jsp");		
   				break;				
   			default:
   				response.sendRedirect("login.jsp");
   				break;
   			}        	  
          	} else { response.sendRedirect("login.jsp");}%>
           
        
         <% 
      			String mensaje=(String)request.getAttribute("mensaje");
        		if(mensaje!=null){
      		%>
      		<div class="alert alert-danger">
   			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    		<strong>El usuario <%=mensaje %> no existe o la contraseÃ±a ingresada es incorrecta</strong> .
  			</div>
      		
      			
      		<%
        		}
      			
      		%> 
            <form id="loginform" class="form-vertical" action="IniciarSesion" method="post">
           
				 <div class="control-group normal_text"> <h3><img src="bootstrap/img/logogin.png" alt="Logo" /></h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span><input type="text" required autofocus id="usuario" name="usuario" class="form-control" placeholder="Usuario" placeholder="Usuario" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" required placeholder="Password" id="contrasena" name="contrasena" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <a href="#" class="flip-link btn btn-info btn-block" id="to-recover">Â¿ Olvidaste tu contraseÃ±a ?</a>
                    
                    <button class="btn btn-success btn-block" type="submit" >Iniciar SesiÃ³n</button>
                </div>
            </form>
            <form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Ingrese su direcciÃ³n de e-mail y te enviaremos las instrucciones para recuperar su password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder=" direcciÃ³n E-mail" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <a href="#" class="flip-link btn btn-success btn-block" id="to-login">&laquo; Volver al login</a><br>
                    <a class="btn btn-info btn-block"/>Recuperar</a>
                </div>
            </form>
        </div>
        
        <script src="bootstrap/js/jquery.min.js"></script>  
        <script src="bootstrap/js/matrix.login.js"></script> 
          <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
     	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    	<!-- Include all compiled plugins (below), or include individual files as needed -->
    	<script src="bootstrap/js/bootstrap.min.js"></script>
    	</body>

</html>
