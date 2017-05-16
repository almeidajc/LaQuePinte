function empleado_rol(){
  let emp_rol = document.getElementById("rol");
  let strUser = emp_rol.options[emp_rol.selectedIndex].value;
  if(strUser === "1"){
    document.getElementById("patente_di").style.visibility = "visible";
  }
  else{
    document.getElementById("patente_di").style.visibility = "hidden";
  }
}


function valida(x){
	if (x.length < 6){
		alert("gato");
		document.getElementById('msjPass_1').value = 'La contraseña tiene que tener mas de 6 caracteres';
	}
}

function valida2(x){
	y = document.getElementById('pwd').value;
	
	if (x != y){
		alert("gato");
		document.getElementById('msjPass_2').value = 'Las contraseñas tiene que ser iguales';
	}
}