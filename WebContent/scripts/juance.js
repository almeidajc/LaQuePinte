function cambiarHREF() {
  if (localStorage.getItem("fecha")) {
    document.getElementById("altaPedidoIdHREF").href = "nuevoPedidoVE.jsp"
  }
}

function altaPedido(){
	var clienteLog;
	clienteLog = document.getElementById("clienteLoggeado").value;
	
	if(clienteLog == "null"){
	}
	else{
		location.href = "#clienteFijo";
	}
	
  let direccion,coord,fech,distancia,zona;
  direccion = localStorage.getItem("direccion");
  coord = localStorage.getItem("coordenadas");
  distancia = localStorage.getItem("distanciaInsert");
  fech = localStorage.getItem("fecha");
  zona = localStorage.getItem("zonaPeligrosa");
  document.getElementById("direccion").value = direccion;
  document.getElementById("coordenadas").value = coord;
  document.getElementById("distancia").value = distancia;
  document.getElementById("fecha").value = fech;
  document.getElementById("zonaPeligrosa").value = zona;

}

function empleado_rol(){
  let emp_rol = document.getElementById("rol");
  let strUser = emp_rol.options[emp_rol.selectedIndex].value;
  if(strUser === "CA"){
    document.getElementById("patente_di").style.visibility = "visible";
  }
  else{
    document.getElementById("patente_di").style.visibility = "hidden";
    document.getElementById("patente_di").value = null;
  }
}


function validaPass(x){
	if (x.length < 6){
		document.getElementById('msjPass_1').style.visibility = "visible"
		document.getElementById('msjPass_1').innerHTML = 'La contraseña tiene que tener mas de 6 caracteres';
    document.getElementById('msjPass_1').style.color = "red";
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
    document.getElementById('msjPass_2').style.color = "red";
	}
	else{
		document.getElementById('msjPass_2').style.visibility = "hidden";
	}
}
function validaPass22(x){
	y = document.getElementById('pass_1').value;

	if (x != y){
		document.getElementById('msjPass_2').style.visibility = "visible";
		document.getElementById('msjPass_2').innerHTML = 'Las contraseñas tiene que ser iguales';
    document.getElementById('msjPass_2').style.color = "red";
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
    document.getElementById('telef').style.color = "red";
	}

}

function validaDNI(x){

	if(x>999999 && x<999999999){
		document.getElementById('dniErro').style.visibility = "hidden";
	}
	else{
		document.getElementById('dniErro').style.visibility = "visible";
		document.getElementById('dniErro').innerHTML = 'El DNI no es valido';
    document.getElementById('dniErro').style.color = "red";
	}

}

function validaDescripcion(valor){
  let patronNombre = /^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$/;
    if (patronNombre.test(valor)){
      document.getElementById('descripError').style.visibility = "hidden";
    } else {
      document.getElementById('descripError').style.visibility = "visible";
      document.getElementById('descripError').innerHTML = 'Descripcion no valida';
      document.getElementById('descripError').style.color = "red";
    }
}

function validaNombre(valor){
	let patronNombre = /^([A-ZÁÉÍÓÚ]{1}[a-zñáéíóú]+[\s]*)+$/;
	  if (patronNombre.test(valor)){
		  document.getElementById('nombreError').style.visibility = "hidden";
	  } else {
		  document.getElementById('nombreError').style.visibility = "visible";
		  document.getElementById('nombreError').innerHTML = 'Nombre no valido';
      document.getElementById('nombreError').style.color = "red";
	  }
}

function validaApellido(valor){
	let patronNombre = /^([A-ZÁÉÍÓÚa-z]{1}[a-zñáéíóú]+[\s]*)+$/;
	  if (patronNombre.test(valor)){
		  document.getElementById('apError').style.visibility = "hidden";
	  } else {
		  document.getElementById('apError').style.visibility = "visible";
		  document.getElementById('apError').innerHTML = 'Apellido no valido';
      document.getElementById('apError').style.color = "red";
	  }
}

function validaRazon(valor){
	let patronNombre = /.{4,}/;
	  if (patronNombre.test(valor)){
		  document.getElementById('razon').style.visibility = "hidden";
	  } else {
		  document.getElementById('razon').style.visibility = "visible";
		  document.getElementById('razon').innerHTML = 'La razon social no es valida';
		  document.getElementById('razon').style.color = "red";
	  }
}

function validaDirec(valor){
	let patronNombre = /.{4,}[0-9]{1,}/;
	  if (patronNombre.test(valor)){
		  document.getElementById('direc').style.visibility = "hidden";
	  } else {
		  document.getElementById('direc').style.visibility = "visible";
		  document.getElementById('direc').innerHTML = 'La direccion no es valida';
		  document.getElementById('direc').style.color = "red";
	  }
}

function validaCUIT(x){

	if(x>209999990 && x<279999999990){
		document.getElementById('cuitErro').style.visibility = "hidden";
	}
	else{
		document.getElementById('cuitErro').style.visibility = "visible";
		document.getElementById('cuitErro').innerHTML = 'El CUIT no es valido';
		document.getElementById('cuitErro').style.color = "red";
	}

}


function validaStock(x){

	if(x>0){
		document.getElementById('stockError').style.visibility = "hidden";
	}
	else{
		document.getElementById('stockError').style.visibility = "visible";
		document.getElementById('stockError').innerHTML = 'Valor de stock no es valido';
		document.getElementById('stockError').style.color = "red";
	}

}

function validaStockMin(x){

	if(x>0){
		document.getElementById('stockMinError').style.visibility = "hidden";
	}
	else{
		document.getElementById('stockMinError').style.visibility = "visible";
		document.getElementById('stockMinError').innerHTML = 'Valor de stock no es valido';
		document.getElementById('stockMinError').style.color = "red";
	}

}

function validaStockMax(x){
	let stMin = document.getElementById('stock_min_producto').value
	if(x> stMin){
		document.getElementById('stockMaxError').style.visibility = "hidden";
	}
	else{
		if(x>0){
			document.getElementById('stockMaxError').style.visibility = "visible";
			document.getElementById('stockMaxError').innerHTML = 'El stock maximo debe ser mayor al minimo';
			document.getElementById('stockMaxError').style.color = "red";
		}
		else{
			document.getElementById('stockMaxError').style.visibility = "visible";
			document.getElementById('stockMaxError').innerHTML = 'Valor de stock no es valido';
			document.getElementById('stockMaxError').style.color = "red";
		}
	}

}

function validarEmail(valor) {
	  if (/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i.test(valor)){
		  document.getElementById('emailText').style.visibility = "hidden";
	  } else {
		  document.getElementById('emailText').style.visibility = "visible";
		  document.getElementById('emailText').innerHTML = 'La direccion de mail es incorrecto';
      document.getElementById('emailText').style.color = "red";
	  }
	}

function validarNombrePr(valor){
	console.log(valor)
	let patronNombre = /.{4,}/;
	
	  if (patronNombre.test(valor)){
		  document.getElementById('producError').style.visibility = "hidden";
		  console.log("queondaaa")
	  } else {
		  document.getElementById('producError').style.visibility = "visible";
		  document.getElementById('producError').innerHTML = 'Nombre del producto no valido';
		  document.getElementById('producError').style.color = "red";
		  console.log("else")
	  }
}

function validaPrecio(valor){
	let patronNombre = /([?1234567890][.][1234567890][1234567890])+$/;
	valor = replacePunto(valor);
	if (patronNombre.test(valor)){
		document.getElementById('precioError').style.visibility = "hidden";
		document.getElementById('precio_producto').value = valor;
	}
	else{
		document.getElementById('precioError').style.visibility = "visible";
		document.getElementById('precioError').innerHTML = 'El precio no es valido';
		document.getElementById('precioError').style.color = "red";
		document.getElementById('precio_producto').value = "";
		document.getElementById('precio_producto').placeholder = valor;
		
	}
}

function numeroLinea(){
	valorLinea =0;
}

function replacePunto(string){
	  return string.replace(",",".");
	}
