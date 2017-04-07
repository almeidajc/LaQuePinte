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
