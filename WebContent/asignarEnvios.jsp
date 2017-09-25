<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="entidades.Empleado"%>
     <%@page import="negocio.CtrlEmpleado"%>

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
  </head>
  <body onload="init()">
    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span6">
          <div id="map" class="map responsive" style="height: 700px;"></div>
        </div>

        <div class="span6">
          <table>
            <tbody>

              <tr>
                <td><p onmouseup="animarPedido()">Pedido 1</p></td>
                <td>
                  <select id="camioneroPedido">
                    <%
                    CtrlEmpleado ctrl = new CtrlEmpleado();
                    for (int indice = 0; indice < ctrl.listarEmpleados().size(); indice++){
                      String tipo = ctrl.listarEmpleados().get(indice).getTipo();
                      if(tipo.equalsIgnoreCase("CA")){
                        %>
                        <option value="<%= ctrl.listarEmpleados().get(indice).getId_empleado() %>"><%= ctrl.listarEmpleados().get(indice).getNombre() %> <%= ctrl.listarEmpleados().get(indice).getApellido() %></option>
                        <%
                      }
                    }
                    %>
                  </select>
                </td>
              </tr>
            </table>
          </div>

      </div>
    </div>


    <script src="scripts/asignarEnvios.js" async defer></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA" async defer ></script>



  </body>
</html>
