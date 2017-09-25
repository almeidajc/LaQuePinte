<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>

    <%@page import="negocio.CtrlPedido"%>


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

  <script>
  let a = 0;
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
  				let dia,mes,ano,ini,fin,fech,mesLet;
  				var title = "Pedido Actual"
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
  				let pedidoAct
  				if (a === 0){
  					var c = confirm("Confirmar el envio para el dia "+dia+" de "+mesLet+" del "+ano);
  					if (c) {
  						pedidoAct = {
  													id: 0,
  													title: title,
  													start: start,
  													end: end,
  													allDay: allDay,
  													className: 'success',
  												};
  						calendar.fullCalendar('renderEvent',pedidoAct, true /* make the event "stick" */);
  						document.getElementById("fechaInsert").value = `${ano}-${mes}-${dia}`;
  						a = 1;
  					}
  				}
  				else {
  					var c = confirm("Usted ya ha seleccionado una fecha, desea cambiarla?");
  					if (c){
  							// $(pedidoAct).remove();
  						pedidoAct ={
  													id: 0,
  													title: title,
  													start: start,
  													end: end,
  													allDay: allDay,
  													className: 'success',
  												}
  						calendar.fullCalendar('renderEvent',pedidoAct,true /* make the event "stick" */);
  						document.getElementById("fechaInsert").value = `${ano}-${mes}-${dia}`;
  						a = 1;
  					}
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
  					id: 1,
  					title: 'Cumpleaños',
  					start: new Date(2017, 8-1, 9),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 2,
  					title: 'Repeating Event2',
  					start: new Date(y, m, d-3, 16, 0),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 3,
  					title: 'Repeating Event3',
  					start: new Date(y, m, d-3, 16, 0),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 4,
  					title: 'Repeating Event',
  					start: new Date(y, m, d-3, 16, 0),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 5,
  					title: 'Repeating Event',
  					start: new Date(y, m, d-3, 16, 0),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 6,
  					title: 'Repeating Event',
  					start: new Date(y, m, d+4, 16, 0),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 7,
  					title: 'aaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb',
  					start: new Date(y, m, d),
  					allDay: true,
  					className: 'important'
  				},
  				{
  					id: 8,
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
  	});
  </script>
  <style>
  	body {
  		margin-top: 40px;
  		text-align: center;
  		font-size: 14px;
  		font-family: "Helvetica Nueue",Arial,Verdana,sans-serif;
  		background-color: #DDDDDD;
  		}
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
  		width: 900px;
  		background-color: #FFFFFF;
  		  border-radius: 6px;
          box-shadow: 0 1px 2px #C3C3C3;
  		}
  </style>
</head>
<body>

  <%   Empleado userSession = (Empleado)session.getAttribute("userSession");
  if(userSession == null || !(userSession.getTipo().equals("VE"))){
  	response.sendRedirect("error405.jsp"); }
  	 String tipo_em = userSession.getTipo();%>

<!--Header-part-->
<div id="header">

  <h1><a href="dashboard.html">Materiales de Construcción</a></h1>

</div>
<!--close-Header-part-->


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li class=""><a title=""><i class="icon icon-user"></i> <span class="text">Bienvenido <%=userSession.getNombre() %></span></a></li>
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

    <li class="submenu"> <a href="#"><i class="icon icon-map-marker"></i> <span>Ubicaci&oacute;n</span> </a>
      <ul>
        <li><a href="agregarubicacion.jsp">Agregar Ubicaci&oacute;n</a></li>
        <li><a href="#">Modificar Ubicaci&oacute;n</a></li>
        <li><a href="#">Eliminar Ubicaci&oacute;n</a></li>
        <li><a href="#">Consultar Ubicaci&oacute;n</a></li>
      </ul>
    </li>

  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->


<div id='wrap'>
  <div id="Gmapas" style="align-items: center;">
    <div id="locationField">
      <input id="autocomplete" size="80" class="direction" placeholder="Ingrese la direccion del envio" onFocus="geolocate()" type="text"></input>
      <input id="submit" type="button" value="Localizar">
    </div>
    <div id="map" class="map" style="width: 800px; height: 300px;"></div>
    <input type="hidden"  id="direc" name="" value="" required>
    <div id="fechaLugares">
      <input type="hidden" id="fechaInsert">
      <input type="hidden" id="lugarInsert">
      <input type="hidden" id="coordsInsert">
      <input type="hidden" id="coordsInsert">
    </div>
  </div>

  <div id="juance" style="height:200px;width:200px">
    <div id='calendar'></div>
  </div>


  <div id="lugares"></div>
  <div style='clear:both'></div>

<!--End-Action boxes-->

<!--end-main-container-part-->


<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
</div>

<!--end-Footer-part-->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA&libraries=places,geometry&callback=initAutocomplete" async defer></script>
<script src="direccion.js"></script>


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
