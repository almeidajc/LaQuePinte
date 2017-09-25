$(document).ready(function(){
	
	
	$("#txtNombreCliente").keyup(function(e) {
		if($("#txtNombreCliente").val()==""){
			$("#cuerpoCliente").html('<tr id="x"><td colspan="3"><h4>Comience a escribir para obtener los clientes</h4></td></tr>');
		} else{
	        var nombreCliente = {nombreCliente:$("#txtNombreCliente").val()}
			$.post("ajaxBusquedaNombreCliente",nombreCliente,llenarTablaCliente);
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
		$("#cuerpoCliente").html('<tr id="x"><td colspan="3"><h4>No se encontraron clientes que coincidan con ese nombre.</h4></td></tr>');
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

function fila_clickCliente(){
	var filaCliente = $(this).attr("id");
	var linea = "linea";   
	var dniCliente = $("#dni"+filaCliente).html();
	var nombreCliente = $("#nombre"+filaCliente).html();
	var apellidoCliente = $("#apellido"+filaCliente).html();
	var direccionCliente = $("#direccion"+filaCliente).html();		
	$("#lineaClienteActual tr").remove(); 
	// AGREGAR AÑADIDO CLIENTE A VAR SESSION
	$("#lineaClienteActual").append(	
		"<tr id='"+linea+"'>"+	
			"<td>"+dniCliente+"</td>"+
			"<td>"+nombreCliente+"</td>"+
			"<td>"+apellidoCliente+"</td>"+
			"<td>"+direccionCliente+"</td>"+
		"</tr>"
	);	
}