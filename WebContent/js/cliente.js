$(document).ready(function(){
	
	
	$("#txtNombreCliente").keyup(function(e) {
		if($("#txtNombreCliente").val()==""){
			$("#cuerpoCliente").html('<tr><td colspan="4"><h5>Comience a escribir para obtener los clientes</h5></td></tr>');
		} else{
	        var nombreCliente = {nombreCliente:$("#txtNombreCliente").val()}
			$.post("ajaxBusquedaNombreCliente",nombreCliente,llenarTablaCliente);
		}
    });
	
	$("#txtApellidoCliente").keyup(function(e) {
		if($("#txtApellidoCliente").val()==""){
			$("#cuerpoCliente").html('<tr><td colspan="4"><h5>Comience a escribir para obtener los clientes</h5></td></tr>');
		} else{
	        var apellidoCliente = {apellidoCliente:$("#txtApellidoCliente").val()}
			$.post("ajaxBusquedaApellidoCliente",apellidoCliente,llenarTablaCliente);
		}
    });
	
	$("#txtDniCliente").keyup(function(e) {
		if($("#txtDniCliente").val()==""){
			$("#cuerpoCliente").html('<tr><td colspan="4"><h5>Comience a escribir para obtener los clientes</h5></td></tr>');
		} else{
	        var dniCliente = {dniCliente:$("#txtDniCliente").val()}
	        $.post("ajaxBusquedaDniCliente",dniCliente,mostrarCliente);
		}
    });
	

	$("input").keydown(function(){
		$(this).attr("style","background:#FFF");
	})
	
	
});//DOCUMENT READY

function llenarTablaCliente(datos){
	var clientes = $.parseJSON(datos);
	$("#cuerpoCliente").html("");
	if(clientes==null||clientes.length==0){
		$("#cuerpoCliente").html('<tr id="x"><td colspan="3"><h5>No se encontraron clientes que coincidan con ese nombre. <a href="altaClienteVE.jsp">Agregar nuevo cliente</a></h5></td></tr>');
	}else {
		for (i=1;i<=clientes.length;i++){
			$("#cuerpoCliente").append(
				"<tr id='"+i+"'>"+	
					"<td id='dni"+i+"'>"+clientes[i-1].dni+"</td>"+
					"<td id='nombre"+i+"'>"+clientes[i-1].nombre+"</td>"+
					"<td id='apellido"+i+"'>"+clientes[i-1].apellido+"</td>"+
					"<td id='direccion"+i+"'>"+clientes[i-1].direccion+"</td>"+
					
				"</tr>"
			);
		}
		$("tr").click(fila_clickCliente);
		
	}
}

/*function mostrarCliente(respuesta){
	var cliente = $.parseJSON(respuesta);
	$("#cuerpoCliente").html("");
	if(cliente==null){
		$("#cuerpoCliente").html('<tr><td colspan="4"><h5>No se encontro cliente con 1el dni ingresado. <a href="altaClienteVE.jsp">Agregar nuevo cliente</a></h5></td></tr>');
	} else{
		$("#cuerpoCliente").append(
			"<tr id='1'>"+
				"<td id='dni1'>"+cliente.dni+"</td>"+
				"<td id='nombre1'>"+cliente.nombre+"</td>"+
				"<td id='apellido1'>"+cliente.apellido+"</td>"+
				"<td id='direccion1'>"+cliente.direccion+"</td>"+
			"</tr>"
		);
		//$("tr").click(fila_clickCliente);
	}
}*/

function mostrarCliente(respuesta){
	var cliente = $.parseJSON(respuesta);
	$("#cuerpoCliente").html("");
	if(cliente==null){
		$("#cuerpoCliente").html('<tr><td colspan="4"><h5>No se encontro cliente con el dni ingresado.</h5></td></tr>');
	} else{
		$("#cuerpoCliente").append(
			"<tr id='1'>"+
				"<td id='dni1'>"+cliente.dni+"</td>"+
				"<td id='nombre1'>"+cliente.nombre+"</td>"+
				"<td id='apellido1'>"+cliente.apellido+"</td>"+
				"<td id='direccion1'>"+cliente.direccion+"</td>"+				
			"</tr>"
		);
		$("tr").click(fila_clickCliente);
	}
}


function fila_clickCliente(){
	var filaCliente = $(this).attr("id");
	var linea = "linea";   
	var dniCliente = $("#dni"+filaCliente).html();
	var nombreCliente = $("#nombre"+filaCliente).html();
	var apellidoCliente = $("#apellido"+filaCliente).html();
	var direccionCliente = $("#direccion"+filaCliente).html();		
	$("#guardarDni").val(dniCliente);
	$("#guardarNombre").val(nombreCliente);
	$("#guardarApellido").val(apellidoCliente);
	$("#guardarDireccion").val(direccionCliente);
}

/*
function fila_clickCliente(){
	var filaCliente = $(this).attr("id");
	var linea = "linea";   
	var dniCliente = $("#dni"+filaCliente).html();
	var nombreCliente = $("#nombre"+filaCliente).html();
	var apellidoCliente = $("#apellido"+filaCliente).html();
	var direccionCliente = $("#direccion"+filaCliente).html();		
	$("#lineaClienteActual tr").remove(); 
	$("#lineaClienteActual").append(	
		"<tr id='"+linea+"'>"+	
			"<td>"+dniCliente+"</td>"+
			"<td>"+nombreCliente+"</td>"+
			"<td>"+apellidoCliente+"</td>"+
			"<td>"+direccionCliente+"</td>"+
		"</tr>"
	);	
}*/