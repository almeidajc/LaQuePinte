function empleado_rol(){
  let emp_rol = document.getElementById("rol");
  let strUser = emp_rol.options[emp_rol.selectedIndex].value;
  if(strUser === "CA"){
    document.getElementById("patente_di").style.visibility = "visible";
  }
  else{
    document.getElementById("patente_di").style.visibility = "hidden";
  }
}


function validaPass(x){
	if (x.length < 6){
		document.getElementById('msjPass_1').style.visibility = "visible"
		document.getElementById('msjPass_1').innerHTML = 'La contraseña tiene que tener mas de 6 caracteres';
	}
	else{
		document.getElementById('msjPass_1').style.visibility = "hidden";
	}
}

function validaPass2(x){
	y = document.getElementById('pwd').value;
	
	if (x != y){
		document.getElementById('msjPass_2').style.visibility = "visible";
		document.getElementById('msjPass_2').innerHTML = 'Las contraseñas tiene que ser iguales';
	}
	else{
		document.getElementById('msjPass_2').style.visibility = "hidden";
	}
}


function validaTel(x){
	
	if(x>999999 && x<999999999){
		document.getElementById('telef').style.visibility = "hidden";
	}
	else{
		document.getElementById('telef').style.visibility = "visible";
		document.getElementById('telef').innerHTML = 'El telefono debe ser numerico y con al menos 7 numeros';
	}
	
}

function validaDNI(x){
	
	if(x>999999 && x<999999999){
		document.getElementById('dniErro').style.visibility = "hidden";
	}
	else{
		document.getElementById('dniErro').style.visibility = "visible";
		document.getElementById('dniErro').innerHTML = 'El no DNI es valido';
	}
	
}

function validaNombre(valor){
	let patronNombre = /^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$/;
	  if (patronNombre.test(valor)){
		  document.getElementById('nombreError').style.visibility = "hidden";
	  } else {
		  document.getElementById('nombreError').style.visibility = "visible";
		  document.getElementById('nombreError').innerHTML = 'Nombre no valido';
	  }	
}

function validaApellido(valor){
	let patronNombre = /^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$/;
	  if (patronNombre.test(valor)){
		  document.getElementById('apError').style.visibility = "hidden";
	  } else {
		  document.getElementById('apError').style.visibility = "visible";
		  document.getElementById('apError').innerHTML = 'Apellido no valido';
	  }	
}

function validarEmail(valor) {
	  if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)){
		  document.getElementById('emailText').style.visibility = "hidden";
	  } else {
		  document.getElementById('emailText').style.visibility = "visible";
		  document.getElementById('emailText').innerHTML = 'La direccion de mail es incorrecto';
	  }
	}




function validaPrecio(valor){
	let patronNombre = /([?1234567890][.][1234567890][1234567890])+$/;
	valor = replacePunto(valor);
	if (patronNombre.test(valor)){
		document.getElementById('precioError').style.visibility = "hidden"
	}
	else{
		document.getElementById('precioError').style.visibility = "visible";
		document.getElementById('precioError').innerHTML = 'El precio no es valido';
	}
}



function replacePunto(string){
	  return string.replace(",",".");
	}