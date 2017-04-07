<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="bootstrap/js_original/jquery-3.2.0.min.js"></script>
<link rel="stylesheet" href="bootstrap/css_original/bootstrap.css" />
<title>Insert title here</title>

<script>
$(document).ready(function(){
	obtenerdatos();
	var contenido_fila;
	var coincidencias;
	var exp;
	$('#txt_buscar').keyup(function(){
		if($(this).val().length>=3)
			filtrar($(this).val());
			});
function filtrar(cadena){
	$('#tabla tbody tr').each(function(){
		contenido_fila=$(this).find('td.eq(1)').html();
		exp= new RegExp(cadena,'gi');
		coincidencias= contenido_fila.match(exp);
		if(coincidencias!=null){
			$(this).addClass('resaltar');
		}
		else{
			$(this).addClass('oculta');
		}
	});
	}

</script>

<style>
#tb_content{
position:relative;
left: 5%;
right: 5%;
width: 90%;
margin-right: 45%;
}
.oculta{
display: none;
}
.resaltar{
background-color: yellow;
}
</style>
</head>
<body>

 <input type="text" placeholder="Ingresar..." id="txt_buscar" class="form-control" style="margin-top: 2px; " />
 <div id="tb_content">
     <table class="table table-hover" id="tabla">
    <thead>
      <tr >
      	
        <th><h5 style="text-align:left; ">ID PRODUCTO</h5></th>
        <th><h5 style="text-align:left; ">NOMBRE</h5></th>
        <th><h5 style="text-align:left; ">PRECIO</h5></th>
        <th><h5 style="text-align:left; ">STOCK DISPONIBLE</h5></th>
        <th><h5 style="text-align:left; ">STOCK MIN</h5></th>
        <th><h5 style="text-align:left; ">STOCK MAX</h5></th>
        
        
             
      </tr>
    </thead>
    
    <tbody>
      <tr>

	   <td><h5>100</h5></td>
	   <td><h5>cemento</h5></td>
	   <td><h5>500</h5></td>
	   <td><h5>50</h5></td>
	   <td><h5>10</h5></td>
	   <td><h5>100</h5></td>
	   </tr>
	   <tr>
	   <td><h5>101</h5></td>
	   <td><h5>caño plastico</h5></td>
	   <td><h5>500</h5></td>
	   <td><h5>50</h5></td>
	   <td><h5>10</h5></td>
	   <td><h5>100</h5></td>
	   </tr>
	   <tr>
	   <td><h5>103</h5></td>
	   <td><h5>caño hierro</h5></td>
	   <td><h5>500</h5></td>
	   <td><h5>50</h5></td>
	   <td><h5>10</h5></td>
	   <td><h5>100</h5></td>
	   
	   
	  
	</tr>
	
      
     
    </tbody>
  </table>
  </div>

</body>
</html>