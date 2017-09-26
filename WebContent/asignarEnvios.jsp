<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="negocio.CtrlEmpleado"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="negocio.CtrlPedido"%>


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
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span6">
          <div id="map" class="map responsive" style="height: 700px;"></div>
        </div>

        <div class="span6">
          <% CtrlPedido ctrlP = new CtrlPedido(); %>
          <%-- los pedidos solo los de hoy!!!!!!!!!!!!!!!! sino hacer un for y sumar la cantidad que son hoy --%>
          <input type="hidden" id="cantidadPedidos" value="<% ctrlP.listarPedidos().size() ;%>">
          <table>
            <tbody>
              <%
                int indice,idCoord;
            	  for ( indice = 0; indice < ctrlP.listarPedidos().size(); indice++){
                  // if dia=igual hoy
            	%>

              <tr>
                <td><input type="text" id="coord<%=indice %>" value="<%= ctrlP.listarPedidos().get(indice).getZona().getCoordenadas() %>"></td>
                <%-- <input type="hidden" id="id<% indice %>" value="<%= ctrlP.listarPedidos().get(indice).getId_pedido() %>"> --%>
                <td><h5 onmouseup="animarPedido(<%= ctrlP.listarPedidos().get(indice).getId_pedido() %>)">Pedido numero<%= ctrlP.listarPedidos().get(indice).getId_pedido() %></h5></td>
                <%-- <td><p onmouseup="animarPedido(<%= ctrlP.listarPedidos().get(indice).getId_pedido() %>)"><%= ctrlP.listarPedidos().get(indice).getId_pedido() %></p></td> --%>
                <td>
                  <select id="<%= ctrlP.listarPedidos().get(indice).getId_pedido() %>">
                    <%
                    CtrlEmpleado ctrl = new CtrlEmpleado();
                    for (int indiceEmpleados = 0; indiceEmpleados < ctrl.listarEmpleados().size(); indiceEmpleados++){
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
              %>

            </table>
          </div>

      </div>
    </div>



    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA" async defer ></script>



  </body>
</html>
