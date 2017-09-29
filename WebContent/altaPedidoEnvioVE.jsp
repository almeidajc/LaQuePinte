<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="entidades.EncargadoAdministracion"%>
    <%@page import="entidades.Empleado"%>
    <%@page import="entidades.Zona"%>
    <%@page import="negocio.CtrlZona"%>
    <%@page import="negocio.CtrlPedido"%>
    <%@page import="entidades.Pedido"%>
    
    <%@page import="java.text.DateFormat"%>
    <%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.time.format.DateTimeFormatter"%>
    <%@page import="java.time.LocalDateTime"%>
    <%@page import="java.util.Calendar"%>
    <%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>

	<title>Materiales::de::Construcci&oacute;n</title>
  <meta charset="UTF-8" />
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
	<link rel="stylesheet" type="text/css" href="css/jquery.gritter.css" />


	<script src='jquery/jquery-1.10.2.js'></script>
	<script src='jquery/jquery-ui.custom.min.js'></script>
	<script src='jquery/jquery-1.10.2.js'></script>

	<script src='fullcalendar.js'></script>


	<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">google.load('jquery', '1.7.1');</script>
	<script type="text/javascript" src="js/jquery.gritter.js"></script>

<script>
let diaStart,diaEnd,diaAll,calendario2,dia,mes,ano,ini,fin,fech,mesLet;
let agregar=0;
function creardia(){

	//ver lo de validar el dia con el count de sql para cada pedidos

		if (true) {
			document.getElementById("fechaInsert").value = ano+"-"+mes+"-"+dia;
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
		$.gritter.removeAll();
		agregar =1;
		}
	else{
		$.gritter.add({
			title: 'Fecha invalida',
			text: 'La fecha seleccionada para entregar el pedido ya tiene asignada la maxima cantidad de envios posibles, por favor seleccione una fecha nuevamente',
			image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
			sticky: false,
			time: '2500'
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
				if(agregar == 0){
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
							time: '2500'
						});


					}

				}
				else{
					$.gritter.add({
						title: 'Fecha Asignada',
						text: 'Ya se ha asignado una fecha para este pedido',
						image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
						sticky: false,
						time: '2500'
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
					title: 'CumpleaÃ±os',
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
<body onload="localStorage.clear();">

<%  Empleado userSession = (Empleado)session.getAttribute("userSession");
            if(userSession == null || !(userSession.getTipo().equals("VE"))){
            	response.sendRedirect("error405.jsp"); }
            	 String tipo_em = userSession.getTipo();%>

  <!--Header-part-->
  <div id="header">
    <h1><a href="dashboard.html">Materiales de Construcci&oacute;n</a></h1>
  </div>
  <!--close-Header-part-->


  <!--top-Header-menu-->
  <div id="user-nav" class="navbar navbar-inverse">
    <ul class="nav">

       <li class=""><a title="" href="CerrarSesion"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
    </ul>
  </div>
  <!--close-top-Header-menu-->

  <!--sidebar-menu-->
  <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
    <ul>
      <li><a href="indexVE.jsp"><i class="icon icon-th-list"></i> <span>Menu Vendedor</span></a> </li>
      <li class="submenu active"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>
        <ul>
          <li class="active"><a href="altaPedidoEnvioVE.jsp">Crear Pedido a enviar</a></li>
          <li><a href="crearPedidoRetiroEA.jsp">Crear Pedido para retirar</a></li>
          <li><a href="#">Modificar Pedido</a></li>

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

    </ul>
  </div>
  <!-- sidebar-menu-->
  <!--main-container-part-->
  <div id="content">
  <!--breadcrumbs-->
    <div id="content-header">
      <div id="breadcrumb"> <a href="indexVE.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Nuevo Producto</a></div>
      <a href="#abajo">Click aqu� ir abajo</a>
    </div>
  <!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
  <%
         	CtrlZona ctrlZ = new CtrlZona();
        	Zona zona = new Zona();
        	CtrlPedido ctrlP = new CtrlPedido();
            Pedido pedido = new Pedido();            
            Date dia = new Date();
            
            
            
            int indicex,a=0;
            for ( indicex = 0; indicex < ctrlP.listarPedidosOrdenados().size(); indicex++){
      		  pedido = ctrlP.listarPedidosOrdenados().get(indicex);
      		  if (pedido.getFecha_entrega() != dia){
      			  a++;
      			  dia =pedido.getFecha_entrega();
      		  }
            }
            
            String [][] arregloFechas = new String [a][2];
            for ( indicex = 0; indicex < ctrlP.listarPedidosOrdenados().size(); indicex++){
      		  pedido = ctrlP.listarPedidosOrdenados().get(indicex);
            
            
   %>
   	<input type="hidden" id="Pedidos" value="<%=pedido.getFecha_entrega() %>">
   	<input type="hidden" id="Pedidos" value="<%=pedido.getId_pedido() %>">
	
	<%	
            }
     
            %>
            <input type="hidden" id="cantidadMaxima" value="<%=ctrlZ.listarZona().size() %>">
            <%
	    pedido = ctrlP.listarPedidosOrdenados().get(0);
		dia = pedido.getFecha_entrega();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		int b=1;
		a=0;
		arregloFechas[a][0] = df.format(dia);
	    /*for ( indicex = 0; indicex < ctrlP.listarPedidosOrdenados().size(); indicex++){
			  pedido = ctrlP.listarPedidosOrdenados().get(indicex);
			  if (pedido.getFecha_entrega() != dia){
				  a++;
				  dia =pedido.getFecha_entrega();
				  arregloFechas[a][0] = df.format(dia);
				  b=1;
				  arregloFechas[a][1] = String.valueOf(b);
			  }
			  else{
				 b++;
				 arregloFechas[a][1] = String.valueOf(b);
			  }
	    }
	    */
		int indice;
		
  		for ( indice = 0; indice < ctrlZ.listarZona().size(); indice++){
  		zona = ctrlZ.listarZona().get(indice);
     %> 
     
     <input type="hidden" id="coordZ<%=indice %>" name="" value='<%=zona.getCoordenadas() %>'>
       <%
  		}
  		
  		for(indicex = 0; indicex<=a;indicex++){  		
  			
  		
       %>
       <input type="hidden" id="dia<%=indicex %>" name="" value='<%=arregloFechas[indicex][0] %>'>
       <input type="hidden" id="cantidad<%=indicex %>" name="" value='<%=arregloFechas[indicex][1] %>'>
       
       <%
  		}
  		
  		
       %>
       

    <div class="row-fluid">
      <div class="span12">
      <div class="span3">
      </div>
      <div class="span7">
        <div id="Gmapas" style="align-items: center;">
          <div id="locationField">
            <input id="inputlg" size="80" class="direction span9" placeholder="Ingrese la direccion del envio" onFocus="geolocate()" type="text"></input>
            <input id="submit" type="button" value="Localizar">
          </div>
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

	<br>


    <div class="row-fluid">
    	<div class="span5">
    	</div>
      <div class="span6">
	      	<div id="lugares">
				<input type="hidden"  name="" value="" id="direc" required>
				<input type="hidden" name="" value="" id="fechaInsert">
				<input type="hidden" name="" value="" id="coordsInsert">
				<input type="hidden" name="" value="" id="distanciaInsert">
				<input type="hidden" name="" value="" id="zonaPeligrosa">
			</div>
          <input type="button" class="btn btn-success" value="Confirmar" onclick="asignarLocal()">
          <input type="button" class="btn btn-danger" value="Cancelar" onclick="location.reload()">
      </div>
    </div>
</div>


		<div style='clear:both'></div>
    <!--end-main-container-part-->


    <!--Footer-part-->

    <div class="row-fluid">

      <a name="abajo" id="abajo"></a>
      <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Marimon Almeida SYStem. <a href="https://www.google.com.ar/">Visit us</a> </div>
    </div>

    <!--end-Footer-part-->

		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA&libraries=places,geometry&callback=initAutocomplete" async defer></script>
		<script src="scripts/direccion.js"></script>


	<script src='fullcalendar.js'></script>


    <script src="bootstrap/js/jquery.gritter.min.js"></script>
    <script src="bootstrap/js/jquery.wizard.js"></script>
    <script src="bootstrap/js/jquery.uniform.js"></script>
    <script src="bootstrap/js/jquery.dataTables.min.js"></script>
    <script src="bootstrap/js/matrix.js"></script>
    <script src="bootstrap/js/matrix.dashboard.js"></script>
    <script src="bootstrap/js/matrix.interface.js"></script>
    <script src="bootstrap/js/matrix.chat.js"></script>
    <script src="bootstrap/js/matrix.form_validation.js"></script>
    <script src="bootstrap/js/matrix.popover.js"></script>
    <script src="bootstrap/js/matrix.tables.js"></script>

</body>
</html>
