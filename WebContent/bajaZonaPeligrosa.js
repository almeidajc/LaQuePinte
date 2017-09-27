var data = {
  lat: null,
  lng: null
};

let maxId;
let bajaZonas = new Array();


function zonasEliminadas() {
  bajaZonas = [];
  for (var ind = 0; ind < maxId; ind++) {
    if (!document.getElementById(`checZ${ind}`).checked) {
      bajaZonas.push(document.getElementById(`zonaPelig${ind}`).value);

    }
  }
}

function initMap() {
  maxId = document.getElementById("cantidadMaxima").value;
  zonasEliminadas();
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -32.9548243, lng: -60.6585068},
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

  let i,coordZona,zonaPel;
  for (i = 0; i < maxId; i++) {
      if (document.getElementById(`checZ${i}`).checked) {
        coordZona = JSON.parse(document.getElementById(`coordZ${i}`).value);
        zonaPel = new google.maps.Polygon({
          paths: coordZona,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 1,
          fillColor: '#000000',
          fillOpacity: 0.5
        });
        zonaPel.setMap(map);
      }
      else{
        coordZona = JSON.parse(document.getElementById(`coordZ${i}`).value);
        zonaPel = new google.maps.Polygon({
          paths: coordZona,
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 1,
          fillColor: '#000000',
          fillOpacity: 0.5
        });
        zonaPel.setMap(null);
      }
  }
}
