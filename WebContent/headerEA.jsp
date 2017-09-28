<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>


    <%  Empleado userSession = (Empleado)session.getAttribute("userSession");
    			String nombre="";
               if(userSession == null || !(userSession.getTipo().equals("EA"))){
              	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();} %>

    <!--Header-part-->
    <div id="header">
      <h1><a href="dashboard.html">Materiales de Construcci&oacute;n</a></h1>
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


         <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
      </ul>
    </div>
    <!--close-top-Header-menu-->


    <!--sidebar-menu-->
    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
      <ul>
        <li class="active"><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>

        <li class="submenu"> <a href="#"><i class="icon icon-barcode"></i> <span>Producto</span> </a>
          <ul>
            <li><a href="altaproducto.jsp">Nuevo Producto</a></li>
            <li><a href="modifproducto.jsp">Modificar Producto</a></li>
            <li><a href="bajaproducto.jsp">Eliminar Producto</a></li>
            <li><a href="consulproducto.jsp">Consultar Producto</a></li>
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


        <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
          <ul>
            <li><a href="altacliente.jsp">Nuevo Cliente</a></li>
            <li><a href="modificarCliente.jsp">Modificar Cliente</a></li>
            <li><a href="bajaCliente.jsp">Eliminar Cliente</a></li>
            <li><a href="consultaCliente.jsp">Consultar Cliente</a></li>
          </ul>
        </li>


        <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Zona Peligrosa</span> </a>
          <ul>
            <li><a href="altaZonaPeligrosaEA.jsp">Agregar Zona Peligrosa</a></li>
            <li><a href="#">Modificar Zona Peligrosa</a></li>
            <li><a href="bajaZonaPeligrosaEA.jsp">Eliminar Zona Peligrosa</a></li>
            <li><a href="consultaUbicacionEA.jsp">Consultar Zona Peligrosa</a></li>
          </ul>
        </li>

        <li><a href="#"><i class="icon icon-money"></i> <span>Informe Deudas</span></a></li>

        <li><a href="#"><i class="icon icon-bar-chart"></i> <span>Informe Stock</span></a></li>



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
