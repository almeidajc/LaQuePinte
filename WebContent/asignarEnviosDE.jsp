<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="negocio.CtrlEmpleado"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="negocio.CtrlPedido"%>
    <%@page import="entidades.Pedido"%>


    <%-- verificar si estos import estan bien --%>
    <%@page import="java.text.DateFormat"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
    <%@page import="java.time.LocalDateTime"%>
    <%@page import="java.util.Calendar"%>
    <%@page import="java.util.Date"%>


<!DOCTYPE html>
<html>
  <head>
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
    <link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />
    <script src="asignarEnvios.js"></script>

  </head>
  <body onload="init()">

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

        <li ><a href="registrarEnvioDE.jsp"><i class="icon icon-truck"></i> <span>Registrar Env&iacute;o</span></a></li>
        <li class="active"><a href="asignarEnviosDE.jsp"><i class="icon icon-group"></i> <span>Asignar Pedidos a Camioneros</span></a></li>
        <li><a href="registrarEntregaDE.jsp"><i class="icon icon-group"></i> <span>Registrar Entrega Pedido</span></a></li>
        <li><a href="consultaPedidoDE.jsp"><i class="icon icon-list-ol"></i> <span>Resumen de Pedidos </span></a></li>
        <li><a href="balance.jsp"><i class="icon icon-credit-card"></i> <span>Balance</span></a></li>
      </ul>
    </div>
    <!--sidebar-menu-->
<div id="content">

  <!--breadcrumbs-->
    <div id="content-header">
      <div id="breadcrumb"> <a href="index.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Asignar Pedidos a Camioneros</a></div>

    </div>
  <!--End-breadcrumbs-->
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span6">
          <div id="map" class="map responsive" style="height: 700px;"></div>
        </div>

        <div class="span6">
          <% CtrlPedido ctrlP = new CtrlPedido();
          Pedido pedido = new Pedido();

          int indice,sum=0;
		  Date today = new Date();
    	  for ( indice = 0; indice < ctrlP.listarPedidosConfirmados().size(); indice++){
    		  pedido = ctrlP.listarPedidosConfirmados().get(indice);
          // if dia=igual hoy
        	if(today.after(pedido.getFecha_entrega()) && pedido.getCoordenadas() != null ){
        		sum++;
        	}
        }
     %>
          <%-- los pedidos solo los de hoy!!!!!!!!!!!!!!!! sino hacer un for y sumar la cantidad que son hoy --%>
          <input type="hidden" id="cantidadPedidos" value="<%= ctrlP.listarPedidosConfirmados().size() %>">

          <table>
            <tbody>
              <%

  
            	  for ( indice = 0; indice < ctrlP.listarPedidosConfirmados().size(); indice++){
            		  pedido = ctrlP.listarPedidosConfirmados().get(indice);
                  // if dia=igual hoy
                if(today.after(pedido.getFecha_entrega()) && pedido.getCoordenadas() != null){
                	//&& pedido.getFecha_efectiva() != null
            	%>

              <tr>
                <td><input type="hidden" id="id<%=indice %>" value="<%=pedido.getId_pedido() %>"></td>
                <td><input type="hidden" id="coord<%=indice %>" value="<%=pedido.getCoordenadas() %>"></td>
                <td><h5 onclick="animarPedido(<%= pedido.getId_pedido() %>)">Pedido numero <%= pedido.getId_pedido() %></h5></td>
                <td>

                  <select id="<%= pedido.getId_pedido() %>">
                    <%
                    CtrlEmpleado ctrl = new CtrlEmpleado();
                    for ( int indiceEmpleados = 0; indiceEmpleados < ctrl.listarEmpleados().size(); indiceEmpleados++){
                      String tipo = ctrl.listarEmpleados().get(indiceEmpleados).getTipo();
                      if(tipo.equalsIgnoreCase("CA")){
                        %>
                        <option value="<%= ctrl.listarEmpleados().get(indiceEmpleados).getId_empleado() %>"><%= ctrl.listarEmpleados().get(indiceEmpleados).getNombre() %> <%= ctrl.listarEmpleados().get(indiceEmpleados).getApellido() %></option>
                        <%
                      }
                    }
                    %>
                  </select>

                </td>
              </tr>
              <%
               }
              }
              %>

            </table>
          </div>
                <%

  
            	  for ( indice = 0; indice < ctrlP.listarPedidosConfirmados().size(); indice++){
            		  pedido = ctrlP.listarPedidosConfirmados().get(indice);
                  // if dia=igual hoy
                if(today.after(pedido.getFecha_entrega()) && pedido.getCoordenadas() != null){
                	//&& pedido.getFecha_efectiva() != null
            	%>
            		<td><input type="hidden" id="retrasando<%=indice %>" value=""></td>
            	 <%
                }
            	  }
            	%>
		<div class="zonaBorrar">
            <input type="hidden" id="zonasElim"name="" value="">
         </div>
      </div>
    </div>
</div>
<!--Footer-part-->

<div class="row-fluid">
<div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA" async defer ></script>

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
