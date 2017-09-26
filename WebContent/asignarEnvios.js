var ubi = {"response":{"pedidos":[
                                  { "id":"id1","dir": "Callao 512, Rosario, Santa Fe, Argentina", "pos":{ "lat":"-32.970689","lng":"-60.686982"}},
                                  { "id":"id2","dir": "Alvear 551, Rosario, Santa Fe, Argentina", "pos":{ "lat":"-32.940294","lng":"-60.665213"}},
                                  { "id":"id3","dir": "Zeballos 1341, Rosario, Santa Fe, Argentina","pos":{ "lat":"-32.941757","lng":"-60.661292"}},
                                  { "id":"id4","dir": "Córdoba 721, Rosario, Santa Fe, Argentina", "pos":{ "lat":"-32.966070","lng":"-60.678936"}}
                                ]
                              }
                            }


var map,marker,centro2;
var arregloPedidos = new Array();

function animarPedido() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
 }
 else {
   marker.setAnimation(google.maps.Animation.BOUNCE);
 }
}
/*
function animarPedido(idPed) {
    arregloPedidos.map(function (ped){
      if (ped.title == idPed) {
          if (ped.getAnimation() !== null) {
            ped.setAnimation(null);
          }
          else {
            ped.setAnimation(google.maps.Animation.BOUNCE);
          }
      }
   }
}*/

function init(){
document.getElementById("map").style.visibility = "visible";
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
      coordeandasPedido = document.getElementById(`coord${indicePedidos}`).value;
      comaSeparacion = coordeandas.indexOf(",")
      lat = coordeandasPedido.substring(0 , comaSeparacion-1);;
      lng = coordeandasPedido.substring(comaSeparacion+1,coordeandasPedido.length-1);
      id = document.getElementById(`id${indicePedidos}`).value;;
      var place = new google.maps.LatLng(lat, lng);
      // el icono y el titulo es lo que muestra cuando esta el mouse arriba
      marker = new google.maps.Marker({
        position: place,
        title: `${id}`,
        map: map,
        icon: ima
      });

      // aca van las etiquetas cuando clickeas
      google.maps.event.addListener(marker, 'onclick', function () {
        infowindow.setContent("Pedido "+marker.title);
        infowindow.open(map, this);
      });
      arregloPedidos.push(marker);
    }


    // usa latitud y longitud
    ubi.response.pedidos.map(function (ped){
      infowindow = new google.maps.InfoWindow({ content: "maps" });
      lat = ped.pos.lat;
      lng = ped.pos.lng;
      id = ped.id;
      var place = new google.maps.LatLng(lat, lng);
      // el icono y el titulo es lo que muestra cuando esta el mouse arriba
      marker = new google.maps.Marker({
        position: place,
        title: `${id}`,
        map: map,
        icon: ima
      });

      // aca van las etiquetas cuando clickeas
      google.maps.event.addListener(marker, 'onclick', function () {
        infowindow.setContent("Pedido "+this.title);
        infowindow.open(map, this);
      });
    })

}
