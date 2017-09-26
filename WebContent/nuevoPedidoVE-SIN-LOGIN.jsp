<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Vendedor"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="entidades.Pedido"%>
    <%@page import="entidades.Producto"%>
    <%@page import="negocio.CtrlPedido"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="entidades.LineaDetallePedido"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Materiales::de::Construcci�n</title>

<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="bootstrap/img/logo-fav.png" />
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="bootstrap/css/fullcalendar.css" />
<link rel="stylesheet" href="bootstrap/css/matrix-style.css" />
<link rel="stylesheet" href="bootstrap/css/matrix-media.css" />
<link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="bootstrap/css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>

<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/pedido.js"></script>
<script src="js/cliente.js"></script>

</head>
<body>
<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
            if(userSession == null || !(userSession.getTipo().equals("VE"))){
            	response.sendRedirect("error405.jsp"); }%> 

<!--Header-part-->
<div id="header">

  <h1><a href="dashboard.html">Materiales de Construcci�n</a></h1>

</div>
<!--close-Header-part--> 



<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <!-- <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.jsp"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li> -->
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido hijo de puta</span></a></li>
    <li class=""><a title="" href="micuenta.jsp"><i class="icon icon-th-list"></i> <span class="text">Mi cuenta</span></a></li>
    <li class=""><a title="" href="ajustes.jsp"><i class="icon icon-cog"></i> <span class="text">Ajustes</span></a></li>
     <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
  <li class="active"><a href="indexVE.jsp"><i class="icon icon-th-list"></i> <span>Menu Vendedor</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
      <ul>
        <li><a href="crearPedidoVE.jsp">Crear Pedido</a></li>
        <li><a href="modificarPedidoVE.jsp">Modificar Pedido</a></li>
      </ul>
    </li>
    
    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
      <ul>
        <li><a href="altaClienteVE.jsp">Nuevo Cliente</a></li>
        <li><a href="modificarClienteVE.jsp">Modificar Cliente</a></li>
        <li><a href="bajaClienteVE.jsp">Eliminar Cliente</a></li>
        <li><a href="consultaClienteVE.jsp">Consultar Cliente</a></li>
      </ul>
    </li>
    

    <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Zona Peligrosa</span> </a>
      <ul>
        <li><a href="agregarubicacion.jsp">Agregar Zona Peligrosa</a></li>
        <li><a href="#">Modificar Zona Peligrosa</a></li>
        <li><a href="#">Eliminar Zona Peligrosa</a></li>
        <li><a href="#">Consultar Zona Peligrosa</a></li>

      </ul>
    </li>
    
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
   
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
 <div id="titulo">
 <h1>Nuevo Pedido</h1>
 </div>
 
 <!--Action boxes-->

 
 <div class="row-fluid">
      <div class="span3">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-search"></i> </span>
            <h5>BÚSQUEDA CLIENTE</h5>
          </div>
          
         <div class="widget-content nopadding"> 
            <form action="#" method="post" id="formCliente" class="form-horizontal">
            <div class="control-group">
              <label for="txtDniCliente" class="control-label">DNI :</label>
              <div class="controls">
                <input type="text" id="txtDniCliente" name="txtDniCliente" class="span11" placeholder="DNI" />
              </div>
            </div>
            <div class="control-group">
              <label for="txtNombreCliente" class="control-label">Nombre :</label>
              <div class="controls">
                <input type="text" id="txtNombreCliente" name="txtNombreCliente" class="span11" placeholder="Nombre" />
              </div>
            </div>
            <div class="control-group">
              <label class="control-label">Apellido :</label>
              <div class="controls">
                <input type="text"  class="span11" placeholder="Nombre"  />
              </div>
               </div>
           
          </form>
          </div>
        </div>
      </div>
      <div class="span6">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-list"></i> </span>
            <h5>CLIENTES</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Dni</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Direccion</th>
                </tr>
              </thead>
             <tbody id="cuerpoCliente" name="cuerpoCliente">
               <tr>
						<td colspan="4"><h4>Comience a escribir para obtener los clientes</h4></td>
			   </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      
      <div class="span3">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-user"></i> </span>
            <h5>CLIENTE</h5>
          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th>Dni</th>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Direccion</th>
                </tr>
              </thead>
              <tbody id="lineaClienteActual" name="lineaClienteActual">
                <tr id="linea">
                  <td colspan="3"><h4></h4></td>
                </tr>
              </tbody>
            </table>
             
          </div>
         
        </div>
        
      </div>
      
      
      
      </div>
      
      

  <%Pedido pedido= (Pedido)session.getAttribute("pedido"); 
	if(pedido!=null){	
	%>

  
    <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>NUEVO PEDIDO</h5>

            <span class="label label-info">Featured</span> </div>

          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
              <thead>
                <tr>
                  <th>#</th>
                  <th>ID PRODUCTO</th>
                  <th>DESCRIPCION</th>                  
                  <th>PRECIO UNITARIO</th>
                  <th>CANTIDAD</th>
                  <th>SUBTOTAL</th>
                  <th>BORRAR</th>
                </tr>
              </thead>

             <tbody>
            
            <%int i=1;
            float total=0;
            for(LineaDetallePedido item:pedido.getLineasDetallePedido()){
            	float subtotal=item.getCantidad()*item.getProducto().getPrecio();
            %>            
              <tr>
                <td><%=i %></td>
                <td><%=item.getProducto().getId_producto() %></td>
                <td><%=item.getProducto().getNombre_producto() %></td>
                <td><%=item.getProducto().getPrecio() %></td>
                <td><%=item.getCantidad() %></td>
                <td><%=subtotal %></td>
                <td><a class="btn btn-danger" href="pedido/borrarLinea?nro=<%=i %>">X</a></td>
              </tr>
            <%	i++;
            	total+=subtotal;
            }%>
            <tr>
                <td style="text-align: right;" colspan="5"><h4>IMPORTE TOTAL DEL PEDIDO</h4></td>
                <td><h4><%=total %></h4></td>
              </tr>
            </tbody>
          </table>
          </div>
          <div class="row" style="float: right;">
		<a class="btn btn-danger" href="pedido/borrarPedido">BORRAR PEDIDO</a>
		<a class="btn btn-primary btn-lg" href="pedido/confirmarPedido">CONFIRMAR PEDIDO</a>
	</div>
	<%} %>

        </div>
        
  
<!--End-Action boxes-->    	
 
 

      
      <div class="row-fluid">
      <div class="span3">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-search"></i> </span>
            <h5>BÚSQUEDA PRODUCTOS</h5>
          </div>
          <div class="widget-content nopadding">
            <form action="PedidoActual" method="post" id="formItem" class="form-horizontal">
                <label for="txtDescripcion" class="sr-only">Producto</label>
                <input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control" placeholder="Descripción" autofocus="autofocus">
                <label for="txtDescripcion" id="errorDescripcion" style="color:#FF0004"></label>
                
                <label for="txtCod" class="sr-only">Código</label>
                <input type="text" id="txtCod" name="txtCod" class="form-control" placeholder="Código">
                <label for="txtCod" id="errorCod" style="color:#FF0004"></label>
                                
                <label for="txtCantidad" class="sr-only">Producto</label>
                <input type="text" id="txtCantidad" name="txtCantidad" class="form-control" placeholder="Cantidad">
                <label for="txtCantidad" id="errorCantidad" style="color:#FF0004"></label>
                
                <button class="btn btn-lg btn-primary " type="submit">Agregar</button>
   </form>

   <% 
      			String mensaje=(String)request.getAttribute("mensaje");
        		if(mensaje!=null){
      		%>
      			<div class="alert alert-danger" role="alert">
        			<strong>Error!</strong> <%=mensaje %>
      			</div>
      		<%
        		}

      		%>      		
    
    
    <div class="col-lg-6 col-xl-6">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>C�digo</th>
						<th>Descripcion</th>
						<th>Precio</th>
					</tr>
				</thead>
				<tbody id="cuerpo">
					<tr>
						<td colspan="3"><h2>Comience a escribir para obtener los productos</h2></td>
					</tr>
				</tbody>
			</table>      
	</div>
	</div>
	<%Pedido pedido= (Pedido)session.getAttribute("pedido"); 
	if(pedido!=null){	
	%>
	<div class="row" style="text-align: center;">
		<h1>SU PEDIDO</h1>
		<table class="table table-bordered">
            <thead>
              <tr>
                <th>#</th>
                <th>C�digo</th>
                <th>Descripci�n</th>
                <th>Precio Unitario</th>
                <th>Cantidad</th>
                <th>Subtotal</th>
                <th>Borrar</th>
              </tr>
            </thead>
            <tbody>
            
            <%int i=1;
            float total=0;
            for(LineaDetallePedido item:pedido.getLineasDetallePedido()){
            	float subtotal=item.getCantidad()*item.getProducto().getPrecio();
            %>            
              <tr>
                <td><%=i %></td>
                <td><%=item.getProducto().getId_producto() %></td>
                <td><%=item.getProducto().getNombre_producto() %></td>
                <td><%=item.getProducto().getPrecio() %></td>
                <td><%=item.getCantidad() %></td>
                <td><%=subtotal %></td>
                <td><a class="btn btn-danger" href="pedido/borrarLinea?nro=<%=i %>">X</a></td>
              </tr>
            <%	i++;
            	total+=subtotal;
            }%>
            <tr>
                <td style="text-align: right;" colspan="5"><h4>IMPORTE TOTAL DEL PEDIDO</h4></td>
                <td><h4><%=total %></h4></td>
              </tr>
            </tbody>
          </table>
	</div>
	<div class="row" style="float: right;">
		<a class="btn btn-danger" href="pedido/borrarPedido">BORRAR PEDIDO</a>
		<a class="btn btn-primary btn-lg" href="pedido/confirmarPedido">CONFIRMAR PEDIDO</a>
	</div>
	<%} %>
	
 
		       
<!--End-Action boxes-->    

   
  </div>
</div>

<!--end-main-container-part-->


<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>

<!--end-Footer-part-->

<script src="bootstrap/js/excanvas.min.js"></script> 
<script src="bootstrap/js/jquery.min.js"></script> 
<script src="bootstrap/js/jquery.ui.custom.js"></script> 
<script src="bootstrap/js/bootstrap.min.js"></script> 
<script src="bootstrap/js/jquery.flot.min.js"></script> 
<script src="bootstrap/js/jquery.flot.resize.min.js"></script> 
<script src="bootstrap/js/jquery.peity.min.js"></script> 
<script src="bootstrap/js/fullcalendar.min.js"></script> 
<script src="bootstrap/js/matrix.js"></script> 
<script src="bootstrap/js/matrix.dashboard.js"></script> 
<script src="bootstrap/js/jquery.gritter.min.js"></script> 
<script src="bootstrap/js/matrix.interface.js"></script> 
<script src="bootstrap/js/matrix.chat.js"></script> 
<script src="bootstrap/js/jquery.validate.js"></script> 
<script src="bootstrap/js/matrix.form_validation.js"></script> 
<script src="bootstrap/js/jquery.wizard.js"></script> 
<script src="bootstrap/js/jquery.uniform.js"></script> 
<script src="bootstrap/js/select2.min.js"></script> 
<script src="bootstrap/js/matrix.popover.js"></script> 
<script src="bootstrap/js/jquery.dataTables.min.js"></script> 
<script src="bootstrap/js/matrix.tables.js"></script> 
<script src="js/pedido.js"></script>
 
<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>

</html>

