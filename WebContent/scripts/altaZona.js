var data = {
  lat: null,
  lng: null
};
var extremos,poligono,validaNombre;
var coords = new Array();


function resetearZona(){
  coords =[];
  initMap();
}


function makeInfoBox(controlDiv, map) {
  // Set CSS for the control border.
  var controlUI = document.createElement('div');
  controlUI.style.boxShadow = 'rgba(0, 0, 0, 0.298039) 0px 1px 4px -1px';
  controlUI.style.backgroundColor = '#fff';
  controlUI.style.border = '2px solid #fff';
  controlUI.style.borderRadius = '2px';
  controlUI.style.marginBottom = '22px';
  controlUI.style.marginTop = '10px';
  controlUI.style.textAlign = 'center';
  controlDiv.appendChild(controlUI);

  // Set CSS for the control interior.
  var controlText = document.createElement('div');
  controlText.style.color = 'rgb(25,25,25)';
  controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
  controlText.style.fontSize = '100%';
  controlText.style.padding = '6px';
  controlText.textContent = 'Clickea para marcar los puntos ';
  controlUI.appendChild(controlText);
}


function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -32.970689, lng: -60.686982},
    zoom: 13,
    styles: [{
      featureType: 'poi',
      stylers: [{ visibility: 'off' }]  // Turn off POI.
    },
    {
      featureType: 'transit.station',
      stylers: [{ visibility: 'off' }]  // Turn off bus, train stations etc.
    }],
    disableDoubleClickZoom: true,
    streetViewControl: false,
  });

  // Create the DIV to hold the control and call the makeInfoBox() constructor
  // passing in this DIV.
  var infoBoxDiv = document.createElement('div');
  makeInfoBox(infoBoxDiv, map);
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(infoBoxDiv);

  // Listen for clicks and add the location of the click to firebase.
  let i=0;
  map.addListener('click', function(e) {
    data.lat = e.latLng.lat();
    data.lng = e.latLng.lng();
    let r = confirm("ingresar el punto?");
    if (r){
      let place = new google.maps.LatLng(data.lat,data.lng);
        marker = new google.maps.Marker ({
          position: place,
          map: map
        });
          coords.push({lat: data.lat, lng: data.lng});
          i++;
          document.getElementById('coordZona').value = JSON.stringify(coords);

          if(coords.length>3){
            poligono.setMap(null);
          }
          if(i>2){
            poligono = new google.maps.Polygon({
              paths: coords,
              strokeColor: '#FF0000',
              strokeOpacity: 0.8,
              strokeWeight: 1,
              fillColor: '#000000',
              fillOpacity: 0.5
            });
            poligono.setMap(map);
          }
    }
    else {
      alert("cancelaste")
    }

  });
  var heatmap = new google.maps.visualization.HeatmapLayer({
    data: [],
    map: map,
    radius: 16
  });
}
