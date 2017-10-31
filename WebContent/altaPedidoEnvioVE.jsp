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
let diaStart,diaEnd,diaAll,calendario2,dia,mes,ano,ini,fin,fech,mesLet,fechaDate;
let agregar=0;
function creardia(){
		document.getElementById("fechaInsert").value = mes+"/"+dia+"/"+ano;
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
function cancelarFecha(){
	$.gritter.removeAll();
}

	let hoy = new Date();

	$(document).ready(function() {

    // for (let  cantidades= 0; cantidades < document.getElementById('CantidadDiasDistintos').value; cantidades++) {
    //   cantPedid = document.getElementById('arregloDias'+cantidades).value;
    //   dia =  document.getElementById('diaPedido'+cantidades).value;
    //   dia++;
    //   pedidoNuevo ={
    //  title: cantPedid+'pedidos',
    //  start: dia,
    //  end: dia,
    //  allDay: true,
    //  className: 'important'
    //    };
    //     events.push(pedidoNuevo);
    // }

     let listaPedidos = new Array();
     let title,cantidadMaximaDiasDistintos,cantPedid,diaPed,tipoDia;

     cantidadMaximaDiasDistintos =document.getElementById('CantidadDiasDistintos').value;
     console.log(cantidadMaximaDiasDistintos);
        for (let  indiceee = 1; indiceee <= 2 ; indiceee++) {
          diaPed= document.getElementById('fecha'+indiceee).value;
          cantPedid= document.getElementById('arregloDias'+indiceee).value;
          if (cantPedid< 20){
            tipoDia= 'info'
          }
          else{
            tipoDia = 'important'
          }
   				ano = diaPed.substring(0 , 4);
          mes = diaPed.substring(5 , 7);
          dia = diaPed.substring(8 ,10 );
          diaPed = new Date(ano, mes-1, dia);
          cantPedid = "Cantidad de pedidos: "+cantPedid;

         pedidoNuevo=	{
  					id: 999,
  					title: cantPedid,
  					start: diaPed,
  					allDay: true,
  					className: tipoDia
  				}
          listaPedidos.push(pedidoNuevo);
        }
        console.log(listaPedidos)


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
				fechaDate = start;
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
        let cantMaximaAlcanzada;
        let cantidadPedidosDia;
        listaPedidos.map(function (ped){
          cantidadPedidosDia = ped.title.substring(17 ,ped.title.length);
          if (start.getFullYear() === ped.start.getFullYear()){
            if (start.getMonth() === ped.start.getMonth()) {
              if (start.getDate() === ped.start.getDate() && cantidadPedidosDia == 20) {
                console.log("entro");
                cantMaximaAlcanzada = true;

              }
            }
          }
        })
				if(agregar == 0){
					if(start>hoy){
            if(cantMaximaAlcanzada){
              $.gritter.add({
  							// (string | mandatory) the heading of the notification
  							title: 'Cantidad maxima de pedidos alcanzada',
  							// (string | mandatory) the text inside the notification
  							text: 'La fecha seleccionada para entregar es invalida ya que posee la maxima cantidad de pedidos asignados para un mismo dia',
  							// (string | optional) the image to display on the left
  							image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
  							// (bool | optional) if you want it to fade out on its own or just sit there
  							sticky: false,
  							// (int | optional) the time you want it to be alive for before fading out
  							time: '2500'
  						});
            }
            else{
						var unique_id = $.gritter.add({
							title: 'Asignar Fecha',
							text: 'Confirmar el envio para el dia '+dia+' de '+mesLet+' del '+ano+'<br><br><input type="button" onclick="creardia()" class="btn btn-success" value="Agregar fecha">    <input type="button" class="btn btn-danger" onclick="cancelarFecha()" value="Cancelar">',
							// image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
							// (bool | optional) if you want it to fade out on its own or just sit there
							sticky: true,
							// (int | optional) the time you want it to be alive for before fading out
							time: '',
							// (string | optional) the class name you want to apply to that specific message
							class_name: 'my-sticky-class'
						});
            }
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
			events: listaPedidos,
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
String nombre="";
            if(userSession == null || !(userSession.getTipo().equals("VE"))){
            	response.sendRedirect("error405.jsp"); }
              else{nombre=userSession.getNombre();}
            	 String tipo_em = userSession.getTipo();
               %>

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
  <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Menu</a>
    <ul>
      <li><a href="indexVE.jsp"><i class="icon icon-th-list"></i> <span>Menu Vendedor</span></a> </li>
      <li class="submenu active"> <a href="#"><i class="icon icon-shopping-cart"></i> <span>Pedido</span> </a>

      <ul>
        <li class="active"><a id="altaPedidoIdHREF" href="altaPedidoEnvioVE.jsp">Crear Pedido a enviar</a></li>
        <li><a href="crearPedidoVE.jsp">Crear Pedido para retirar</a></li>
        
      </ul>

      </li>
      <li><a href="consultaProductoVE.jsp"><i class="icon icon-barcode"></i> <span>Consultar Productos</span></a></li>
         <li class="submenu"> <a href="#"><i class="icon icon-user"></i> <span>Cliente</span> </a>
           <ul>
             <li><a href="altaClienteVE.jsp">Crear Cliente</a></li>
             <li><a href="modificarClienteVE.jsp">Modificar Cliente</a></li>

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
      <div id="breadcrumb"> <a href="indexVE.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a><a href="#" class="current">Crear Pedido con Envio</a></div>
    </div>
  <!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
   <div class="accordion" id="collapse-group">
    <div class="accordion-group widget-box">
      <div class="accordion-heading">
        <div class="widget-title"> <a data-parent="#collapse-group" href="#collapseGThree" data-toggle="collapse"> <span class="icon"><i class="icon-question-sign"></i></span>
          <h5>AYUDA</h5>
          </a> </div>
      </div>
      <div class="collapse accordion-body" id="collapseGThree">
      	<div class="row-fluid">

      	
        	<div class="widget-content"><img src="bootstrap/img/enviodomicilio1.gif"> </div> </div>

        </div>
      </div>
    </div>
    </div>
  <%
         	CtrlZona ctrlZ = new CtrlZona();
        	Zona zona = new Zona();
        	CtrlPedido ctrlP = new CtrlPedido();
            Pedido pedido = new Pedido();
            Date dia = new Date();



            int indicex,a=1,b=0,cantMaximaa;

            pedido = ctrlP.listarPedidosOrdenados().get(0);
            dia = pedido.getFecha_entrega();
            for ( indicex = 1; indicex < ctrlP.listarPedidosOrdenados().size(); indicex++){
        		  pedido = ctrlP.listarPedidosOrdenados().get(indicex);
        		  if (!pedido.getFecha_entrega().equals(dia)){
        			  a++;
        			  dia =pedido.getFecha_entrega();
        		    }
            }
            cantMaximaa = a;
             %>
              <input type="hidden" id="CantidadDiasDistintos" value="<%=a %>">

             <%
            String [][] arregloFechas = new String [365][2];

            pedido = ctrlP.listarPedidosOrdenados().get(0);
            dia = pedido.getFecha_entrega();


            String DATE_FORMAT_NOW = "yyyy-MM-dd";
            SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
            String str;

            a=0;
            str = Integer.toString(1);
            dia = new Date();

            for ( indicex = 0; indicex < ctrlP.listarPedidosOrdenados().size(); indicex++){
        		  pedido = ctrlP.listarPedidosOrdenados().get(indicex);
         		  if (!pedido.getFecha_entrega().equals(dia)){
           			 a++;
      				  dia =pedido.getFecha_entrega();
      				  b=1;
      				  arregloFechas[a][0] = sdf.format(dia);
                str = Integer.toString(b);
                arregloFechas[a][1] = str;
      			  }
           		  else{
           			 b++;
           			 str = Integer.toString(b);
      				  arregloFechas[a][1] = str;
      			  }
            }
            for (indicex = 1; indicex <= cantMaximaa; indicex++) {

   %>
      <input type="hidden" id="fecha<%=indicex %>" value="<%=arregloFechas[indicex][0] %>">
   		<input type="hidden" id="arregloDias<%=indicex %>" value="<%=arregloFechas[indicex][1] %>">
	<%

            }

            %>
            <input type="hidden" id="cantidadMaximaPedidos" value="<%=ctrlP.listarPedidosOrdenados().size() %>">
            <input type="hidden" id="cantidadMaxima" value="<%=ctrlZ.listarZona().size() %>">
            <%
		int indice;

  		for ( indice = 0; indice < ctrlZ.listarZona().size(); indice++){
  		zona = ctrlZ.listarZona().get(indice);
     %>

     <input type="hidden" id="coordZ<%=indice %>" name="" value='<%=zona.getCoordenadas() %>'>
       <%
  		}

  		for(indicex = 0; indicex<=a;indicex++){


       %>


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
</div>



		<div style='clear:both'></div>
    <!--end-main-container-part-->


    <!--Footer-part-->

    <div class="row-fluid">
      <div id="footer" class="span12" style="font-size: 15px;"> 2016 &copy; Aguirre Almeida Marimon System. </div>
    </div>

    <!--end-Footer-part-->

		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA&libraries=places,geometry&callback=initAutocomplete" async defer></script>
		<script src="scripts/direccion.js"></script>


	<script src='fullcalendar.js'></script>


	<script src="bootstrap/js/jquery.ui.custom.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="bootstrap/js/jquery.flot.min.js"></script>
	<script src="bootstrap/js/jquery.flot.resize.min.js"></script>
	<script src="bootstrap/js/jquery.peity.min.js"></script>
	<script src="bootstrap/js/matrix.js"></script>
	<script src="bootstrap/js/matrix.dashboard.js"></script>
	<script src="bootstrap/js/jquery.gritter.min.js"></script>
	<script src="bootstrap/js/matrix.interface.js"></script>

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
