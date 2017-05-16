function validarUsuario() {
	$('#msjUsuario').empty();
    var usuario = $('#usuario').val();
	if(usuario==""){
		$('#usuario').attr('style', 'background:#FF4A4A; color:white');
		$('#msjUsuario').append('Este campo es obligatorio');
		return false;
	} else {
		if (!usuario.match(/^[a-z0-9][a-z0-9_]{3,9}$/)){
			$('#usuario').attr('style', 'background:#FF4A4A; color:white');
			$('#msjUsuario').append('El nombre de usuario debe contener entre 4 y 10 caracteres y solo puede contener letras minúsculas, números y guiones bajos(excepto el primer caracter)');
			return false;
		}
	}
	return true;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function validarPass_1(){
	$('#msjPass_1').empty();
	var pass_2 = $('#pass_2').val();
    var pass_1 = $('#pass_1').val();
	if(pass_1==""){
		$('#pass_1').attr('style', 'background:#FF4A4A; color:white');
		$('#msjPass_1').append('Este campo es obligatorio');
		return false;
	} else{
		if(pass_1==pass_2){
			$('#pass_2').attr('style', 'background:white');
			$('#msjPass_2').empty();
		}
		if(!pass_1.match(/^[a-zA-Z0-9]{4,10}$/)){
			$('#pass_1').attr('style', 'background:#FF4A4A; color:white');
			$('#msjPass_1').append('La contraseña debe estar formada por entre 4 y 10 caracteres alfanuméricos');
			return false;
		}
	}
	return true;	
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarPass_2(){
	$('#msjPass_2').empty();
	var pass_1 = $('#pass_1').val();
	var pass_2 = $('#pass_2').val();
	if(pass_2==""){
		$('#pass_2').attr('style', 'background:#FF4A4A; color:white');
		$('#msjPass_2').append('Este campo es obligatorio');
		return false;
	} else{
		if(pass_1!=pass_2){
			$('#pass_2').attr('style', 'background:#FF4A4A; color:white');
			$('#msjPass_2').append('Las contraseñas no coinciden');
			return false;
		}
	}
	return true;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarNombre(){
	$('#msjNombre').empty();
	var nombre = $('#nombre').val();
	if(nombre==""){
		$('#nombre').attr('style', 'background:#FF4A4A; color:white');
		$('#msjNombre').append('Este campo es obligatorio');
		return false;
	} else {
		if(!nombre.match(/^([a-zA-Z ñáéíóúÁÉÍÓÚÑ]{2,60})$/)){
			$('#nombre').attr('style', 'background:#FF4A4A; color:white');
			$('#msjNombre').append('El nombre puede contener letras y espacios con un mínimo de 2 caracteres y un máximo de 60');
			return false;
		}
	}
	return true;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarApellido(){
	$('#msjApellido').empty();
	var apellido = $('#apellido').val();
	if(apellido==""){
		$('#apellido').attr('style', 'background:#FF4A4A; color:white');
		$('#msjApellido').append('Este campo es obligatorio');
		return false;
	} else {
		if(!apellido.match(/^([a-zA-Z ñáéíóúÁÉÍÓÚÑ]{2,60})$/)){
			$('#apellido').attr('style', 'background:#FF4A4A; color:white');
			$('#msjApellido').append('El apellido puede contener letras y espacios con un mínimo de 2 caracteres y un máximo de 60');
			return false;
		}
	}
	return true;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarDni() {
	$('#msjDni').empty();
	var dni = $('#dni').val();
	if(dni==""){
		$('#dni').attr('style', 'background:#FF4A4A; color:white');
		$('#msjDni').append('Este campo es obligatorio');
		return false;
	} else {
		if(!dni.match(/^[0-9]{8}$/)){
			$('#dni').attr('style', 'background:#FF4A4A; color:white');
			$('#msjDni').append('El dni debe estar formado 8 números');
			return false;
		}
	}
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarCantidad() {
	$('#msjHabitacion').empty();
	var numero = $('#doblesingle').val();
	if(!numero.match(/^[1-9]{1}$/)){
			$('#doblesingle').attr('style', 'background:#FF4A4A; color:white');
			$('#msjHabitacion').append('Debe ingresar un número de 1 dígito, distinto de cero');
			return false;
		}
	
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarCantidad2() {
	$('#msjHabitacion2').empty();
	var numero = $('#deluxe').val();
	if(!numero.match(/^[1-9]{1}$/)){
			$('#deluxe').attr('style', 'background:#FF4A4A; color:white');
			$('#msjHabitacion2').append('Debe ingresar un número de 1 dígito, distinto de cero');
			return false;
		}
	
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function validarCantidad3() {
	$('#msjHabitacion3').empty();
	var numero = $('#dobledeluxe').val();
	if(!numero.match(/^[1-9]{1}$/)){
			$('#dobledeluxe').attr('style', 'background:#FF4A4A; color:white');
			$('#msjHabitacion3').append('Debe ingresar un número de 1 dígito, distinto de cero');
			return false;
		}
	
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function validarNum() {
	$('#msjNum').empty();
	var numero = $('#numero').val();
	if(numero==""){
		$('#numero').attr('style', 'background:#FF4A4A; color:white');
		$('#msjNum').append('Este campo es obligatorio');
		return false;
	} else {
		if(!numero.match(/^[0-9]{1,4}$/)){
			$('#numero').attr('style', 'background:#FF4A4A; color:white');
			$('#msjNum').append('El número de habitación debe estar formado por 1 a 4 dígitos');
			return false;
		}
	}
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function validarPiso() {
	$('#msjPiso').empty();
	var piso = $('#piso').val();
	if(piso==""){
		$('#piso').attr('style', 'background:#FF4A4A; color:white');
		$('#msjPiso').append('Este campo es obligatorioo');
		return false;
	} else {
		if(!piso.match(/^[0-9]{1}$/)){
			$('#piso').attr('style', 'background:#FF4A4A; color:white');
			$('#msjPiso').append('El número de piso debe estar formado por 1 dígito');
			return false;
		}
	}
	return true;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function validarEmaill() {
	$('#msjEmail').empty();
	var email = $('#email').val();
	if(email==""){
		$('#email').attr('style', 'background:#FF4A4A; color:white');
		$('#msjEmail').append('Este campo es obligatorio');
		return false;
	} else {
		if(!email.match(/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/)){
			$('#email').attr('style', 'background:#FF4A4A; color:white');
			$('#msjEmail').append('El mail ingresado no es válido');
			return false;
		}
	}
	return true;
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//HACE LAS VALIDACIONES CUANDO SE PRESIONA EL BOTON
function enviar() {
	var continua=true;
	
	if(!validarUsuario()){ continua = false;}
	if(!validarNombre()){ continua = false; }
	if(!validarApellido()){ continua = false; }
	if(!validarDni()){ continua = false; }
	if(!validarNum()){ continua = false; }
	if(!validarPiso()){ continua = false; }
	if(!validarPass_1()){ continua = false; }
	if(!validarPass_2()){ continua = false; }
	if(!validarEmaill()){ continua = false; }
	if(!validarCantidad()){ continua = false; }
	if(!validarCantidad2()){ continua = false; }
	if(!validarCantidad3()){ continua = false; }
	
	if(continua){ document.formRegistro.submit(); }
}
//////////////////////////////////////////////////////////////////////////////////////

$(function(){
//CUANDO SE PRESIONA ENTER SE ENVIA EL FORMULARIO
	$(document).keypress(function(e) {
		if(e.keyCode=='13'){
			enviar();
		}
	});
	
	
//PONE EN BLANCO UN CAMPO CUANDO SE EMPIEZA A ESCRIBIR EN ÉL
	$('#pass_1').keyup(function(){ $('#pass_1').attr('style', 'background:white'); });
	$('#pass_2').keyup(function(){ $('#pass_2').attr('style', 'background:white'); });
	$('#apellido').keyup(function(){ $('#apellido').attr('style', 'background:white'); });
	$('#nombre').keyup(function(){ $('#nombre').attr('style', 'background:white'); });
	$('#usuario').keyup(function(){ $('#usuario').attr('style', 'background:white'); });
	$('#dni').keyup(function(){ $('#dni').attr('style', 'background:white'); });
	$('#email').keyup(function(){ $('#email').attr('style', 'background:white'); });
	$('#numero').keyup(function(){ $('#numero').attr('style', 'background:white'); });
	$('#piso').keyup(function(){ $('#piso').attr('style', 'background:white'); });
	$('#doblesingle').keyup(function(){ $('#doblesingle').attr('style', 'background:white'); });
	$('#deluxe').keyup(function(){ $('#deluxe').attr('style', 'background:white'); });
	$('#dobledeluxe').keyup(function(){ $('#dobledeluxe').attr('style', 'background:white'); });

//HACE LAS VALIDACIONES CUANDO SE CAMBIA EL FOCO DE LOS CONTROLES
	$('#usuario').focusout(function() { validarUsuario(); });
	$('#pass_1').focusout(function() { validarPass_1(); });
	$('#pass_2').focusout(function() { validarPass_2(); });
	$('#nombre').focusout(function() { validarNombre(); });
	$('#apellido').focusout(function() { validarApellido(); });
	$('#dni').focusout(function() { validarDni(); });
	$('#email').focusout(function() { validarEmaill(); });
	$('#numero').focusout(function() { validarNum(); });
	$('#piso').focusout(function() { validarPiso(); });
	$('#doblesingle').focusout(function() { validarCantidad(); });
	$('#deluxe').focusout(function() { validarCantidad2(); });
	$('#dobledeluxe').focusout(function() { validarCantidad3(); });
});