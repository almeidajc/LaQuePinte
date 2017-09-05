var ubi = {"response":{"pedidos":[
                                  { "id":"id1","dir": "Callao 512, Rosario, Santa Fe, Argentina", "pos":{ "lat":"-32.970689","lng":"-60.686982"}},
                                  { "id":"id2","dir": "Alvear 551, Rosario, Santa Fe, Argentina", "pos":{ "lat":"-32.940294","lng":"-60.665213"}},
                                  { "id":"id3","dir": "Zeballos 1341, Rosario, Santa Fe, Argentina","pos":{ "lat":"-32.941757","lng":"-60.661292"}},
                                  { "id":"id4","dir": "Córdoba 721, Rosario, Santa Fe, Argentina", "pos":{ "lat":"-32.966070","lng":"-60.678936"}}
                                ]
                              }
                            }


function init(){
document.getElementById("map").style.visibility = "visible";
var ima = new google.maps.MarkerImage(
  'http://subirimagen.me/uploads/20161107181116.png',
  new google.maps.Size(26,26));

var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 16,
  center: {lat: -32.970689, lng: -60.686982},
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  });
  var marker = new google.maps.Marker({
    map: map,
    position: new google.maps.LatLng(-32.970689, -60.686982),
    title: "centroo"
  });


  map.addListener('click', function(e) {
    data.lat = e.latLng.lat();
    data.lng = e.latLng.lng();
    console.log(data);
  });
    var infowindow = null;
    // usa latitud y longitud

    // ubi.response.pedidos.map(function (ped){
    //   infowindow = new google.maps.InfoWindow({ content: "maps" });
    //   lat = ped.pos.lat;
    //   lng = ped.pos.lng;
    //   id = ped.id;
    //   var place = new google.maps.LatLng(lat, lng);
    //   // el icono y el titulo es lo que muestra cuando esta el mouse arriba
    //   marker = new google.maps.Marker({
    //     position: place,
    //     title: `${id}`,
    //     map: map,
    //     icon: ima
    //   });
    //   // aca van las etiquetas cuando clickeas
    //   google.maps.event.addListener(marker, 'click', function () {
    //     infowindow.setContent("Pedido "+this.title);
    //     infowindow.open(map, this);
    //   });
    //
    // })





    // usando direcciones

    var geocoder = new google.maps.Geocoder();
    ubi.response.pedidos.map(function (ped){

      infowindow = new google.maps.InfoWindow({ content: "maps" });
      id = ped.id;
        geocodeAddress(geocoder, map , ped);

        function geocodeAddress(geocoder, resultsMap , pedid) {
          var address = pedid.dir;
          geocoder.geocode({'address': address}, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
              resultsMap.setCenter(results[0].geometry.location);
              var marker = new google.maps.Marker({
                position: results[0].geometry.location,
                title: `${ped.id}`, //aca va lo que aparece cuando le pasas por arriba
                map: map,
                icon: ima,
              });
              google.maps.event.addListener(marker, 'click', function () {
                infowindow.setContent("Pedido "+ped.id);
                infowindow.open(map, this);
              });
            } else {
              alert('Geocode was not successful for the following reason: ' + status);
            }
          });
        }

    })




var coords = [
  {lat: -32.971515, lng: -60.700575},
  {lat: -32.980985, lng: -60.700431},
  {lat: -32.981896, lng: -60.683640},
  {lat: -32.971987, lng: -60.687835},
];
  var poligono = new google.maps.Polygon({
  paths: coords,
  strokeColor: '#FF0000',
  strokeOpacity: 0.8,
  strokeWeight: 2,
  fillColor: '#000000',
  fillOpacity: 0.5
});

  poligono.setMap(map);
  var coords2 = [
  {lat: -32.967153, lng: -60.686129},
  {lat: -32.961482, lng: -60.684638},
  {lat: -32.963993, lng: -60.672686},
  {lat: -32.969304, lng: -60.674011},
];

  var poligono2 = new google.maps.Polygon({
  paths: coords2,
  strokeColor: '#FF0000',
  strokeOpacity: 0.8,
  strokeWeight: 2,
  fillColor: '#000000',
  fillOpacity: 0.5
});
  poligono2.setMap(map);

  var circle = new google.maps.Circle({
    map: map,
    radius: 5500,
    fillColor: '#2E64FE'
  });
  circle.bindTo('center', marker, 'position');
}

// function showInfo(){
//   // map.setZoom(16);
//   map.setCenter(marker.getPosition());
//   var info = new google.maps.InfoWindow({
//     content: "Materiales Avellaneda"
//   });
//
//   info.open(map,marker);
// }


function ver(){
  var geocoder = new google.maps.Geocoder();
  // geocodeAddress(geocoder , map)
  document.getElementById('submit').addEventListener('click', function() {
    geocodeAddress(geocoder, map);
    // alert("entro")
  });
}

function geocodeAddress(geocoder, resultsMap) {
  var address = ubi.response.pedido[i].direccion;
  geocoder.geocode({'address': address}, function(results, status) {
    if (status === google.maps.GeocoderStatus.OK) {
      resultsMap.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
        map: resultsMap,
        position: results[0].geometry.location
      });
    } else {
      alert('Geocode was not successful for the following reason: ' + status);
    }
  });
}
