<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Despachante"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="negocio.CtrlPedido"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Materiales::de::Construcci&oacute;n</title>
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
           if(userSession == null || !(userSession.getTipo().equals("DE"))){
          	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();}
           String tipo_em = userSession.getTipo();%>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Materiales de Construcci&oacute;n</a></h1>
</div>
<!--close-Header-part-->


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">

    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=nombre %></span></a></li>


     <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu DESPACHANTE</a>
  <ul>
    <li><a href="indexDE.jsp"><i class="icon icon-home"></i> <span>Menu Despachante</span></a> </li>

    <li class="active"><a href="registrarEnvioDE.jsp"><i class="icon icon-truck"></i> <span>Registrar Env&iacute;o</span></a></li>
<li><a href="asignarEnviosDE.jsp"><i class="icon icon-group"></i> <span>Asignar Pedidos a Camioneros</span></a></li>
    <li><a href="registrarEntregaDE.jsp"><i class="icon icon-group"></i> <span>Registrar Entrega Pedido</span></a></li>
    <li><a href="consultaPedidoDE.jsp"><i class="icon icon-list-ol"></i> <span>Resumen de Pedidos </span></a></li>
    <li><a href="balance.jsp"><i class="icon icon-credit-card"></i> <span>Balance</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"><a href="indexCA.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Registrar Env&iacute;o</a></div>
    <!--End-breadcrumbs-->
<div id="titulo">
 <h1>Consulta Pedidos</h1>
 </div>
  <div class="container-fluid"><hr>

  <div class="container-fluid">
     <div class="row-fluid">
      <div class="span12"> <!-- TAMA�O FORMULARIOS -->



     <input placeholder="Ingresar..." type="text" name="search" class="light-table-filter" data-table="order-table" class="form-control" style="margin-top: 2px; " />

        <div class="widget-box">


          <div class="widget-content nopadding" id="tb_content">
            <table class="order-table table" class="table table-hover">
    <thead>
      <tr >

        <th><h5 style="text-align:center; ">ID</h5></th>
        <th><h5 style="text-align:center; ">FECHA ENTREGA</h5></th>
        <th><h5 style="text-align:center; ">DIRECCION ENVIO</h5></th>
        <th><h5 style="text-align:center; ">DESCRIPCION</h5></th>
        <th><h5 style="text-align:center; ">APELLIDO CLIENTE</h5></th>
        <th><h5 style="text-align:center; ">NOMBRE</h5></th>

        <th><h5 style="text-align:center; ">REGISTRAR</h5></th>

      </tr>
    </thead>

    <tbody>
      <tr>
      <div></div>
<%
    		CtrlPedido ctrl = new CtrlPedido();

    		//PUEDO HACER TMB
			// ArrayList<Habitacion> habitaciones = new ArrayList<Habitacion>();
			// habitacios = ctrl.Listar();

	for (int indice = 0; indice < ctrl.listarPedidosConfirmados().size(); indice++){
		if(ctrl.listarPedidosConfirmados().get(indice).getDireccion_envio() != null ){

	%>
	   <td><h5 style="text-align:center; "><%= ctrl.listarPedidosConfirmados().get(indice).getId_pedido() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarPedidosConfirmados().get(indice).getFecha_entrega() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarPedidosConfirmados().get(indice).getDireccion_envio() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarPedidosConfirmados().get(indice).getEstado() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarPedidosConfirmados().get(indice).getApellido() %></h5></td>
	   <td><h5 style="text-align:center; "><%= ctrl.listarPedidosConfirmados().get(indice).getNombre() %></h5></td>

	  <td><form method="post" action="RegistrarEnvioPedido">
        <input type="hidden" id="id_pedido" name="id_pedido" value="<%= ctrl.listarPedidosConfirmados().get(indice).getId_pedido()%>" >

         <input type="hidden" id="entrega" name="entrega" value="1" >
        
	   <button style="margin:auto;display:block;" type="submit" type="submit" class="btn2" name="registrarenvio" id="registrarenvio" onClick="return confirm('�Est� Seguro que deseas dar registrar el env�o de este pedido?')">

           <span class="icon-pencil" style="color: blue; font-size:100%; align-items:center"></span></a></form></td>


	</tr>
	<%
		}
		}


      %></div>
          </tbody>
  </table>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>





      <!-- ac3 fin-->


</div>





      </div>
      </div>
<!--End-Action boxes-->

  </div>
</div>

<!--end-main-container-part-->
</div>
</div>
<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12" style="font-weight:bold;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>
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
