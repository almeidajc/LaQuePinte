var today = new Date();
var dia = today.getDate();
var mes = today.getMonth()+1; //January is 0!
var ano = today.getFullYear();


if (ano <= fecha.getFullYear()){
  if (mes <= fecha.getMonth()+1){
    if (dia <= fecha.getDate()){
      mostrar();
    }
  }
}
