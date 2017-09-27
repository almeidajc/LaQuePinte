<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>

<!DOCTYPE html>
<html>
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
	<%-- <meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="icon" href="bootstrap/img/logo-fav.png" />
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="bootstrap/css/matrix-style.css" />
	<link rel="stylesheet" href="bootstrap/css/matrix-media.css" />
	<link href="bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="bootstrap/css/jquery.gritter.css" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
	<link href='css/fullcalendar.css' rel='stylesheet' />
  <link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
	<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" /> --%>

<script src='jquery/jquery-1.10.2.js'></script>
<script src='jquery/jquery-ui.custom.min.js'></script>
<script src='fullcalendar.js'></script>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">google.load('jquery', '1.7.1');</script>
<script type="text/javascript" src="js/jquery.gritter.js"></script>
<script>
let diaStart,diaEnd,diaAll,calendario2,dia,mes,ano,ini,fin,fech,mesLet;

function creardia(){
	//ver lo de validar el dia con el count de sql para cada pedidos
	if (true) {
		var title = "Pedido Actual";
		calendario2.fullCalendar('renderEvent',
			{
				title: title,
				start: diaStart,
				end: diaEnd,
				allDay: diaAll,
				className: 'success',
			},
			true // make the event "stick"
		);
	document.getElementById("fechaInsert").value = `${ano}-${mes}-${dia}`;
	$.gritter.removeAll();
	}
	else{
		$.gritter.add({
			title: 'Fecha invalida',
			text: 'La fecha seleccionada para entregar el pedido ya tiene asignada la maxima cantidad de envios posibles, por favor seleccione una fecha nuevamente',
			image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
			sticky: false,
			time: ''
		});
	}
}
function cancelarFecha(){
	$.gritter.removeAll();
}

	let hoy = new Date();
	$(document).ready(function() {
	  var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		$('#external-events div.external-event').each(function() {
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});
		/* initialize the calendar
		-----------------------------------------------------------------*/
		var calendar =  $('#calendar').fullCalendar({
			header: {
				left: 'title',
				center: 'month',
				right: 'prev,next month'
			},
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',

			axisFormat: 'h:mm',
			columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
            titleFormat: {
                month: 'MMMM yyyy', // September 2009
                week: "MMMM yyyy", // September 2009
                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
            },
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				calendario2= calendar;
				diaStart = start;
				diaEnd = end;
				diaAll =allDay;
				ini = 1;
				fin = 5;
				fech = JSON.stringify(start);
				ano = fech.substring(ini , fin);
				ini = 6;
				fin = 8;
				mes = fech.substring(ini , fin);
				switch(mes) {
					case '01':
			        mesLet="Enero";
			        break;
			    case '02':
			        mesLet="Febrero";
			        break;
			    case '03':
			        mesLet="Marzo";
			        break;
					case '04':
			        mesLet="Abril";
			        break;
			    case '05':
			        mesLet="Mayo";
			        break;
					case '06':
			        mesLet="Junio";
			        break;
			    case '07':
			        mesLet="Julio";
			        break;
					case '08':
			        mesLet="Agosto";
			        break;
			    case '09':
			        mesLet="Septiembre";
			        break;
					case '10':
			        mesLet="Octubre";
			        break;
			    case '11':
			        mesLet="Noviembre";
			        break;
					case '12':
			        mesLet="Diciembre";
			        break;
				}
				ini = 9;
				fin = 11;
				dia = fech.substring(ini , fin);
				console.log(ano);
				console.log(mes);
				console.log(dia);
				if(start>hoy){
					var unique_id = $.gritter.add({
						title: 'This is a sticky notice!',
						text: 'Confirmar el envio para el dia '+dia+' de '+mesLet+' del '+ano+'<br><br><input type="button" onclick="creardia()" class="btn btn-success" value="Agregar fecha">    <input type="button" class="btn btn-danger" onclick="cancelarFecha()" value="Cancelar">',
						image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: true,
						// (int | optional) the time you want it to be alive for before fading out
						time: '',
						// (string | optional) the class name you want to apply to that specific message
						class_name: 'my-sticky-class'
					});
				}
				else{
						$.gritter.add({
							// (string | mandatory) the heading of the notification
							title: 'Fecha incorrecta',
							// (string | mandatory) the text inside the notification
							text: 'La fecha seleccionada para entregar el pedido debe ser posterior al dia de hoy, por favor seleccione una fecha nuevamente',
							// (string | optional) the image to display on the left
							image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
							// (bool | optional) if you want it to fade out on its own or just sit there
							sticky: false,
							// (int | optional) the time you want it to be alive for before fading out
							time: ''
						});
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped
				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');
				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);
				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;
				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}
			},
			events:[
				{
					id: 999,
					title: 'Cumpleaños',
					start: new Date(2017, 8-1, 9),
					allDay: true,
					className: 'important'
				},
				{
					id: 999,
					title: 'Repeating Event2',
					start: new Date(y, m, d-3, 16, 0),
					allDay: true,
					className: 'important'
				},
				{
					id: 999,
					title: 'Repeating Event3',
					start: new Date(y, m, d-3, 16, 0),
					allDay: true,
					className: 'important'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: true,
					className: 'important'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: true,
					className: 'important'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: true,
					className: 'important'
				},
				{
					title: 'aaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
					start: new Date(y, m, d),
					allDay: true,
					className: 'important'
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: true,
					className: 'important'
				},
				// {
				// 	title: 'Click for Google',
				// 	start: new Date(y, m, 28),
				// 	end: new Date(y, m, 28),
				// 	className: 'success'
				// }
			],
		});

		//fin de calendar =  $('#calendar').fullCalendar({
	});
//fin de $(document).ready(function() {

</script>
<style>
	#wrap {
		width: 1100px;
		margin: 0 auto;
		}
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}
	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 800px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}
</style>
</head>
<body>

  <%-- <%  Empleado userSession = (Empleado)session.getAttribute("userSession");
  			String nombre="";
             if(userSession == null || !(userSession.getTipo().equals("EA"))){
            	response.sendRedirect("error405.jsp"); }else{nombre=userSession.getNombre();} %> --%>

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
      <%-- <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=nombre %></span></a></li> --%>


       <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
  </div>
  <!--close-top-Header-menu-->

  <!--sidebar-menu-->
  <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
      <li ><a href="indexEA.jsp"><i class="icon icon-th-list"></i> <span>Menu Encargado Adm</span></a> </li>
      <li class="submenu"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
        <ul>
          <li><a href="crearPedidoEnvioEA.jsp">Crear Pedido a enviar</a></li>
  <li><a href="crearPedidoRetiroEA.jsp">Crear Pedido para retirar</a></li>
          <li><a href="#">Modificar Pedido</a></li>
          
        </ul>
      </li>

      <li class="submenu active" > <a href="#"><i class="icon icon-barcode"></i> <span>Producto</span> </a>
        <ul>
          <li><a href="altaproducto.jsp">Nuevo Producto</a></li>
          <li><a href="modifproducto.jsp">Modificar Producto</a></li>
          <li><a href="bajaproducto.jsp">Eliminar Producto</a></li>
          <li><a href="consultarproducto.jsp">Consultar Producto</a></li>
        </ul>
      </li>

      <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Empleado</span> </a>
        <ul>
          <li><a href="#">Nuevo Empleado</a></li>
          <li><a href="#">Modificar Empleado</a></li>
          <li><a href="#">Eliminar Empleado</a></li>
          <li><a href="#">Consultar Empleado</a></li>
        </ul>
      </li>


      <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
        <ul>
          <li><a href="altacliente.jsp">Nuevo Cliente</a></li>
          <li><a href="#">Modificar Cliente</a></li>
          <li><a href="#">Eliminar Cliente</a></li>
          <li><a href="#">Consultar Cliente</a></li>
        </ul>
      </li>

         <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Proveedores</span> </a>
        <ul>
          <li><a href="altaProveedorEA.jsp">Nuevo Proveedor</a></li>
          <li><a href="modificarProveedorEA.jsp">Modificar Proveedor</a></li>
          <li><a href="bajaProveedorEA.jsp">Eliminar Proveedor</a></li>
          <li><a href="consultaProveedorEA.jsp">Consultar Proveedor</a></li>
        </ul>
      </li>


      <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Zona Peligrosa</span> </a>
        <ul>
          <li><a href="agregarubicacion.jsp">Agregar Zona Peligrosa</a></li>
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
  <!-- sidebar-menu-->
  <!--main-container-part-->
  <div id="content">
  <!--breadcrumbs-->
    <div id="content-header">
      <div id="breadcrumb"> <a href="indexVE.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Nuevo Producto</a></div>

    </div>
  <!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="row-fluid">
      <div class="span12">
        <div id="Gmapas" style="align-items: center;">
          <div id="locationField">
            <input id="autocomplete" size="80" class="direction" placeholder="Ingrese la direccion del envio" onFocus="geolocate()" type="text"></input>
            <input id="submit" type="button" value="Localizar">
          </div>
        </div>
      </div>
      <div class="span2">
      </div>
      <div class="span6">
        <div id="map" class="map" style="height: 300px;left:100px;"></div>
      </div>
    </div>
	<div class="row-fluid">
		<div class="span12">
		  <div id="juance" >
		    <div id='calendar'></div>
		  </div>
	  	</div>
	</div>


    <div class="row-fluid">
      <div class="span12">
          <input type="button" class="btn btn-success" value="Confirmar">
          <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.reload()">
      </div>
    </div>
</div>

		<div id="lugares">
			<input type="hidden"  name="" value="" id="direc" required>
			<input type="hidden" name="" value="" id="fechaInsert">
			<input type="hidden" name="" value="" id="coordsInsert">
			<input type="hidden" name="" value="" id="distanciaInsert">
			<input type="hidden" name="" value="" id="zonaPeligrosa">
		</div>
		<div style='clear:both'></div>
    <!--end-main-container-part-->


    <!--Footer-part-->

    <div class="row-fluid">
      <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
    </div>

    <!--end-Footer-part-->

		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA&libraries=places,geometry&callback=initAutocomplete" async defer></script>
		<script src="scripts/direccion.js"></script>

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
