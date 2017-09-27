var map,marker,centro2;
var arregloPedidos = new Array();

function animarPedido(idPed) {
	for(let ind = 0; ind < arregloPedidos.length; ind++){
      if (arregloPedidos[ind].title == idPed) {
          if (arregloPedidos[ind].getAnimation() !== null) {
        	  arregloPedidos[ind].setAnimation(null);
          }
          else {
        	  arregloPedidos[ind].setAnimation(google.maps.Animation.BOUNCE);
          }
      }
	}
}


function init(){
let cantidadPedidos = document.getElementById('cantidadPedidos').value;
var ima = new google.maps.MarkerImage(
  'http://subirimagen.me/uploads/20161107181116.png',
  new google.maps.Size(26,26));

map = new google.maps.Map(document.getElementById('map'), {
  zoom: 13,
  center: {lat: -32.970689, lng: -60.686982},
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  });
  centro2 = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(-32.970689, -60.686982),
    title: "centroo"
  });


    var infowindow = null;

		let coordeandasPedido,comaSeparacion;
		for (var indicePedidos = 0; indicePedidos < cantidadPedidos; indicePedidos++) {
		  infowindow = new google.maps.InfoWindow({ content: "maps" });
		  
		  console.log();
		  if (document.getElementById(`coord${indicePedidos}`)){
		  coordeandasPedido = document.getElementById(`coord${indicePedidos}`).value;
		  comaSeparacion = coordeandasPedido.indexOf(",")
		  lat = coordeandasPedido.substring(0 , comaSeparacion-1);;
		  lng = coordeandasPedido.substring(comaSeparacion+1,coordeandasPedido.length-1);
		  id = document.getElementById(`id${indicePedidos}`).value;
		  
		  var place = new google.maps.LatLng(lat, lng);
		  // el icono y el titulo es lo que muestra cuando esta el mouse arriba
		  marker = new google.maps.Marker({
		    position: place,
		    title: id,
		    map: map,
		    icon: ima
		  });
		  marker.setAnimation(null);
		  arregloPedidos.push(marker);
		  }
		}
}
