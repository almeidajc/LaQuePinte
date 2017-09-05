<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>
     <%@page import="entidades.Proveedor"%>
    <%@page import="negocio.CtrlProveedor"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Materiales::de::Construcción</title>
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
</head>
<body>

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
			String nombre="";
           if(userSession == null || !(userSession.getTipo().equals("EA"))){
          	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();}
           String tipo_em = userSession.getTipo();%>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Materiales de Construcción</a></h1>
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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=nombre %></span></a></li>
    <li class=""><a title="" href="micuenta.jsp"><i class="icon icon-th-list"></i> <span class="text">Mi cuenta</span></a></li>
    <li class=""><a title="" href="ajustes.jsp"><i class="icon icon-cog"></i> <span class="text">Ajustes</span></a></li>
     <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <li class=""><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
      <ul>
        <li><a href="crearpedido.jsp">Crear Pedido</a></li>
        <li><a href="#">Modificar Pedido</a></li>
        <li><a href="#">Pagar Deuda</a></li>
      </ul>
    </li>
    
    <li class="submenu "> <a href="#"><i class="icon icon-barcode"></i> <span>Producto</span> </a>
      <ul>
        <li><a href="altaProductoEA.jsp">Nuevo Producto</a></li>
        <li><a href="modificarProductoEA.jsp">Modificar Producto</a></li>
        <li><a href="bajaProductoEA.jsp">Eliminar Producto</a></li>
        <li><a href="consultaProductoEA.jsp">Consultar Producto</a></li>
      </ul>
    </li>
    
    <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
      <ul>
        <li><a href="altaUsuarioEA.jsp">Nuevo Empleado</a></li>
        <li><a href="modificarUsuarioEA.jsp">Modificar Empleado</a></li>
        <li><a href="bajaUsuarioEA.jsp">Eliminar Empleado</a></li>
        <li><a href="consultaUsuarioEA.jsp">Consultar Empleado</a></li>
      </ul>
    </li>
    
    
    <li class="submenu active"> <a href="#"><i class="icon icon-user"></i> <span>Proveedores</span> </a>
      <ul>
        <li><a href="altaProveedorEA.jsp">Nuevo Proveedor</a></li>
        <li ><a href="modificarProveedorEA.jsp">Modificar Proveedor</a></li>
        <li><a href="bajaProveedorEA.jsp">Eliminar Proveedor</a></li>
        <li  class="submenu active"><a href="consultaProveedorEA.jsp">Consultar Proveedor</a></li>
      </ul>
    </li>
    
    
    <li class="submenu "> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
      <ul>
        <li><a href="altaClienteEA.jsp">Nuevo Cliente</a></li>
        <li><a href="modificarClienteEA.jsp">Modificar Cliente</a></li>
        <li><a href="bajaClienteEA.jsp">Eliminar Cliente</a></li>
        <li><a href="consultaClienteEA.jsp">Consultar Cliente</a></li>
      </ul>
    </li>
    
    
    <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Ubicación</span> </a>
      <ul>
        <li><a href="agregarubicacion.jsp">Agregar Ubicación</a></li>
        <li><a href="#">Modificar Ubicación</a></li>
        <li><a href="#">Eliminar Ubicación</a></li>
        <li><a href="#">Consultar Ubicación</a></li>
      </ul>
    </li>
    
    
    <li><a href="informestock.jsp"><i class="icon icon-bar-chart"></i> <span>Informe Stock</span></a></li>
    
    
    
    <li class="submenu"> <a href="#"><i class="icon icon-briefcase"></i> <span>Pedido a Proveedores</span> </a>
      <ul>
        <li><a href="#">Crear Pedido</a></li>
        <li><a href="#">Modificar Pedido</a></li>
        <li><a href="#">Cambiar Estado Pedido</a></li>
        <li><a href="#">Consultar Pedido</a></li>
      </ul>
    </li>
    
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Consulta Proveedor</a></div>
   
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->

  <div id="titulo">
 <h1>Consultar Proveedor</h1><hr>
 </div>

  <div class="container-fluid">
     <div class="row-fluid">
      <div class="span12"> <!-- TAMAï¿½O FORMULARIOS -->
      
      
  
     <input placeholder="Ingresar..." type="text" name="search" class="light-table-filter" data-table="order-table" class="form-control" style="margin-top: 2px; " />

        <div class="widget-box">
        
          
          <div class="widget-content nopadding" id="tb_content">
            <table class="order-table table" class="table table-hover">
    <thead>
      <tr >
      
      	
        <th><h5 style="text-align:center; ">CUIT</h5></th>
        <th><h5 style="text-align:center; ">RAZON SOCIAL</h5></th>
        <th><h5 style="text-align:center; ">DIRECCION</h5></th>
        <th><h5 style="text-align:center; ">EMAIL</h5></th> 
        <th><h5 style="text-align:center; ">TELEFONO</h5></th>
        
             
      </tr>
    </thead>
    
    <tbody>
      <tr>
<%
    		CtrlProveedor ctrl = new CtrlProveedor();
    		
    		
	for (int indice = 0; indice < ctrl.listarProveedores().size(); indice++){
	%>  
	   <td><h5 style="text-align:center; "><%= ctrl.listarProveedores().get(indice).getCuit() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarProveedores().get(indice).getRazon_social() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarProveedores().get(indice).getDireccion() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarProveedores().get(indice).getEmail() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarProveedores().get(indice).getTel() %></h5></td>
	  
	  
	</tr>
	<%
	
}


      %>
      
     
    </tbody>
  </table>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>
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
