$(document).ready(function(){
	
	
	$("#formItem").submit(function() {
		var cod=validarCod();
		var desc= validarDesc();
		var imp= validarImporte();
		var fec= validarFecha();
		var st= validarStock()
		if(cod&&desc&&imp&&fec&&st){
			return true;
		} else {
			return false;
		}
	});
	
	$("#txtDescripcion").focusout(function(e) {
		validarDesc();
	});
	$("#txtCod").focusout(function(e) {
		validarCod();
	});
	$("#txtImporte").focusout(function(e) {
		validarImporte();
	});
	$("#txtFecha").focusout(function(e) {
		validarFecha();
	});
	$("#txtStock").focusout(function(e) {
		validarStock();
	});
//	$("#txtFecha").focusout(function(e) {
	//	validaFechaAAAAMMDD();
//	});
	$("input").keydown(function(){
		$(this).attr("style","background:#FFF");
	})
	
});//DOCUMENT READY




function validarDesc(){
	$("#errorDescripcion").html("");
	$("#txtDescripcion").attr("style","background:#FFF");
	var desc = $("#txtDescripcion").val();
	if(desc==""){
		//Si el campo esta vacio muestro el mensaje y pongo el campo en rojo
		$("#txtDescripcion").attr("style","background:#f2dede");
		$("#errorDescripcion").html("la descripcion del producto no puede estar en blanco");
		return false;
	} else return true;
}

function validarImporte(){
	$("#errorImporte").html("");
	$("#txtImporte").attr("style","background:#FFF");	
	var imp = $("#txtImporte").val();
	if(imp==""){
		$("#txtImporte").attr("style","background:#f2dede");
		$("#errorImporte").html("El importe no puede estar en blanco");
		return false;
	} else {
		if(isNaN(imp)){
			$("#txtImporte").attr("style","background:#f2dede");
			$("#errorImporte").html("El importe debe ser un entero");
			return false;
		}else return true;
	}
	
}

function validarCod(){
	$("#errorCod").html("");
	$("#txtCod").attr("style","background:#FFF");
	var cod = $("#txtCod").val();
	if(cod==""){
		//Si el campo esta vacio muestro el mensaje y pongo el campo en rojo
		$("#txtCod").attr("style","background:#f2dede");
		$("#errorCod").html("El codigo de producto no puede estar en blanco");
		return false;
	} else return true;
}
function validarFecha(){
	$("#errorFecha").html("");
	$("#txtFecha").attr("style","background:#FFF");	
	var fech = $("#txtFecha").val();
	if(!isValidDate(fech)){
		$("#txtFecha").attr("style","background:#f2dede");
		$("#errorFecha").html("Formato de fecha incorrecto o la fecha no puede estar en blanco");
		return false;
	} else return true;
}
function isValidDate(str){
	// STRING FORMAT yyyy-mm-dd
	if(str=="" || str==null){return false;}								
	
	// m[1] is year 'YYYY' * m[2] is month 'MM' * m[3] is day 'DD'					
	var m = str.match(/(\d{4})-(\d{2})-(\d{2})/);
	
	// STR IS NOT FIT m IS NOT OBJECT
	if( m === null || typeof m !== 'object'){return false;}				
	
	// CHECK m TYPE
	if (typeof m !== 'object' && m !== null && m.size!==3){return false;}
				
	var ret = true; //RETURN VALUE						
	var maxYear = 2200; //YEAR NOW
	var minYear = 1999; //MIN YEAR
	
	// YEAR CHECK
	if( (m[1].length < 4) || m[1] < minYear || m[1] > maxYear){ret = false;}
	// MONTH CHECK			
	if( (m[2].length < 2) || m[2] < 1 || m[2] > 12){ret = false;}
	// DAY CHECK
	if( (m[3].length < 2) || m[3] < 1 || m[3] > 31){ret = false;}
	
	return ret;			
}
function validarStock(){
	$("#errorStock").html("");
	$("#txtStock").attr("style","background:#FFF");	
	var cant = $("#txtStock").val();
	if(cant==""){
		$("#txtStock").attr("style","background:#f2dede");
		$("#errorStock").html("El stock no puede estar en blanco");
		return false;
	} else {
		if(isNaN(cant)){
			$("#txtStock").attr("style","background:#f2dede");
			$("#errorStock").html("El stock debe ser un entero");
			return false;
		}else return true;
	}
	
}
