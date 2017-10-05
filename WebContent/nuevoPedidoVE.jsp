<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.Vendedor"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="entidades.Pedido"%>
    <%@page import="entidades.Producto"%>
    <%@page import="entidades.Cliente"%>
    <%@page import="negocio.CtrlPedido"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="entidades.LineaDetallePedido"%>
<!DOCTYPE html>
<html lang="en">
<head>

<title>Materiales::de::Construccion</title>



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
<body onload="altaPedido()">
<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
            if(userSession == null || !(userSession.getTipo().equals("VE"))){
            	response.sendRedirect("error405.jsp"); }%>

<!--Header-part-->
<div id="header">

  <h1><a href="dashboard.html">Materiales de Construccion</a></h1>

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
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido</span></a></li>
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
        <li><a id="altaPedidoIdHREF" href="altaPedidoEnvioVE.jsp">Crear Pedido a enviar</a></li>
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


    <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Ubicacion</span> </a>
      <ul>
        <li><a href="agregarubicacion.jsp">Agregar Ubicacion</a></li>
        <li><a href="#">Modificar Ubicacion</a></li>
        <li><a href="#">Eliminar Ubicacion</a></li>
        <li><a href="#">Consultar Ubicacion</a></li>

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

 <!--
<div class="accordion" id="collapse-group">


         <div class="accordion-group widget-box">

            <div class="accordion-heading">
              <div class="widget-title"> <a data-parent="#collapse-group" href="#1" data-toggle="collapse"> <span class="icon"><i class="icon-question-sign"></i></span>
                <h4>AYUDA</h4>
            </div>
            <div class="collapse accordion-body" id="1">

<img src="bootstrap/img/ayuda.gif">
<!--<img src="${pageContext.request.contextPath}/bootstrap/img/ayuda.gif"/>
<img src="${pageContext.request.contextPath}/ayuda.gif"/>
<img src="ayuda.gif"/> -->
 <!--
            </div>
          </div>
        </div>
</div>-->
<div class="container-fluid">

 <div class="accordion" id="collapse-group">
          <div class="accordion-group widget-box">
            <div class="accordion-heading">
              <div class="widget-title"> <a data-parent="#collapse-group" href="#collapseGThree" data-toggle="collapse"> <span class="icon"><i class="icon-question-sign"></i></span>
                <h5>AYUDA</h5>
                </a> </div>
            </div>
            <div class="collapse accordion-body" id="collapseGThree">
              <div class="widget-content"> <img src="bootstrap/img/ayuda.gif"> </div>
            </div>
          </div>

        </div>

 <!--Action boxes-->



 <div class="row-fluid">
      <div class="span3">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-search"></i> </span>
            <h5>BUSQUEDA CLIENTE</h5>
          </div>

         <div class="widget-content nopadding">
            <form action="#" method="post" id="formCliente" class="form-horizontal">

              <div class="control-group">
              <div style="margin:10px;">
              	<label for="txtDniCliente" class="sr-only">Dni </label>
              	<input type="text" id="txtDniCliente" name="txtDniCliente" class="form-control" placeholder="Dni" />
              </div>

            </div>
            <div class="control-group">
            	<div style="margin:10px;">
              		<label for="txtNombreCliente" class="sr-only">Nombre </label>
                	<input type="text" id="txtNombreCliente" name="txtNombreCliente" class="form-control" placeholder="Nombre" />
              	</div>
              </div>

            <div class="control-group">
            	<div style="margin:10px;">
              	<label for="txtApellidoCliente" class="sr-only">Apellido </label>
                <input type="text" id="txtApellidoCliente" name="txtApellidoCliente" class="form-control" placeholder="Apellido" />
              </div>
            </div>

		</div>
          </form>
          </div>
        </div>

       <%Cliente cliente= (Cliente)session.getAttribute("clientePedidoActual"); %>
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
						<td colspan="4"><h5>Comience a escribir para obtener los clientes</h5></td>
			   </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

  <!--    ___-->


       <div class="span3">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-search"></i> </span>
            <h5>CLIENTE ACTUAL</h5>
          </div>

         <div class="widget-content nopadding">
            <form action="GuardarClientePedido" method="post" id="formguardarClientePedido" class="form-horizontal">
            <div class="control-group">
              <div style="margin:10px;">
              <label for="guardarDni" class="sr-only">DNI :</label>
                <input type="text" id="guardarDni" name="guardarDni"  <%if(cliente!=null){%>value="<%=cliente.getDni()%>"<%}%> class="form-control" placeholder="DNI" />
              </div>
            </div>


            <div class="control-group">
              <div style="margin:10px;">
              <label for="guardarNombre" class="sr-only">Nombre :</label>
                <input type="text" id="guardarNombre" name="guardarNombre"  <%if(cliente!=null){%>value="<%=cliente.getNombre() %>"<%}%> class="form-control" placeholder="Nombre" />
              </div>
            </div>
           <div class="control-group">
             <div style="margin:10px;">
              <label for="guardarApellido" class="sr-only">Apellido :</label>
                <input type="text" id="guardarApellido" name="guardarApellido" <%if(cliente!=null){%>value="<%=cliente.getApellido()%>"<%}%> class="form-control" placeholder="Nombre" />
              </div>
            </div>

            <input type="hidden" name="coordenadas" value="">
            <input type="hidden" name="direccion" id="direccion" value="">
            <input type="hidden" name="distancia" id="distancia" value="">
            <input type="hidden" name="fecha" id="fecha" value="">
            <input type="hidden" name="zonaPeligrosa" id="zonaPeligrosa" value="">

	 <button class="btn btn-lg btn-primary " type="submit">Guardar</button>

             <a class="btn btn-danger" href="BorrarClientePedido">Borrar</a>

          </form>
          </div>
        </div>
      </div>
            <%
	if(cliente!=null){
	%><h5>se gaurdo</h5>
      <%} %>


  <%Pedido pedido= (Pedido)session.getAttribute("pedido");
	if(pedido!=null){
	%>


    <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
            <h5>NUEVO PEDIDO</h5>

             </div>

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
                <td style="text-align: right;" colspan="5"><h5>IMPORTE TOTAL DEL PEDIDO</h5></td>
                <td><h5><%=total %></h5></td>
              </tr>
            </tbody>
          </table>
          </div>
          <div class="row" style="float: right;">
		<a class="btn btn-danger" href="pedido/borrarPedido" onclick="localStorage.clear();">BORRAR PEDIDO</a>
		<a class="btn btn-primary btn-lg" href="pedido/confirmarPedido" onclick="localStorage.clear();">CONFIRMAR PEDIDO</a>
	</div>
	<%} %>

        </div>


<!--End-Action boxes-->




      <div class="row-fluid">
      <div class="span3">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-search"></i> </span>
            <h5>BUSQUEDA PRODUCTOS</h5>
          </div>
          <div class="widget-content nopadding">
            <form action="PedidoActual" method="post" id="formItem" class="form-horizontal">
              <div style="margin:10px;">
                <label for="txtDescripcion" class="sr-only">Producto</label>
                <input type="text" id="txtDescripcion" name="txtDescripcion" class="form-control" placeholder="Descripcion" autofocus="autofocus">
                <label for="txtDescripcion" id="errorDescripcion" style="color:#FF0004"></label>
              </div>
                <div style="margin:10px;">
                  <label for="txtCod" class="sr-only">Codigo</label>
                  <input type="text" id="txtCod" name="txtCod" class="form-control" placeholder="Codigo">
                    <label for="txtCod" id="errorCod" style="color:#FF0004"></label>
                </div>


                <div style="margin:10px;">
                  <label for="txtCantidad" class="sr-only">Producto</label>
                  <input type="text" id="txtCantidad" name="txtCantidad" class="form-control" placeholder="Cantidad">
                    <label for="txtCantidad" id="errorCantidad" style="color:#FF0004"></label>
                </div>

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
          </div>
        </div>
      </div>
      <div class="span7">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-shopping-cart"></i> </span>
            <h5>PRODUCTOS</h5>
          </div>
        <div class="widget-content nopadding">
            <table class="table table-bordered">
              <thead>
                <tr>
                 		<th>Codigo</th>

						<th>Descripcion</th>
						<th>Precio</th>
					</tr>
				</thead>
				<tbody id="cuerpo">
					<tr>
						<td colspan="3"><h5>Comience a escribir para obtener los productos</h5></td>
					</tr>
				</tbody>
			</table>
	</div>
	</div>



<!--End-Action boxes-->

   </div>
   </div>

  </div>
  </div>
</div>
</div>
</div>
</div>



<!--end-main-container-part-->


<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>

<!--end-Footer-part-->

<script src="scripts/juance.js"></script>

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
