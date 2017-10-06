var data = {
  lat: null,
  lng: null
};

let maxId;
let bajaZonas = new Array();


// <%
// int max =0;
// for (int indice = 0; indice < ctrl.listarZona().size(); indice++){
//    if (ctrl.listarZona().get(indice).getId_zona()>= max){
//      max = ctrl.listarZona().get(indice).getId_zona()
//    }
//  }
// %>
// maxId = <% max %>

maxId = 4; //traer el valor de la db


function cargaInicio() {
  var x,newDiv;

      newDiv = document.createElement("div");
      newDiv.setAttribute("id",`<%= ctrl.listarZona().get(indice).getDescripcion() %>`);
      x = document.createElement("INPUT");
      x.setAttribute("id",`zonaPelig<%= ctrl.listarZona().get(indice).getId_zona() %>`);
      x.setAttribute("type", "hidden");
      x.setAttribute("value","zonaPelig<%= ctrl.listarZona().get(indice).getId_zona() %>")
      newDiv.appendChild(x);
      x = document.createElement("INPUT");
      x.setAttribute("id",`checZ<%= ctrl.listarZona().get(indice).getId_zona() %>`);
      x.setAttribute("type", "checkbox");
      x.setAttribute("onchange", "initMap()");
      x.setAttribute("checked");
      newDiv.appendChild(x);
      x = document.createElement("INPUT");
      x.setAttribute("id",`coordZ<%= ctrl.listarZona().get(indice).getId_zona() %>`);
      x.setAttribute("type", "hidden");
      x.setAttribute("value","<%= ctrl.listarZona().get(indice).getCoordenadas() %>");
 
  var newDiv = document.createElement("div");
  newDiv.setAttribute("id",`fechaLugares`);
  var x = document.createElement("INPUT");
  x.setAttribute("id",`fechaInsert`);
  x.setAttribute("type", "hidden");
  newDiv.appendChild(x);

  initMap();

}


function zonasEliminadas() {
  bajaZonas = [];
  for ( i = 1; i <= maxId; i++) {
    if (!document.getElementById(`checZ${i}`).checked) {
      bajaZonas.push(document.getElementById(`zonaPelig${i}`).value);
    }
  }
  console.log(bajaZonas);
  document.getElementById("zonasElim").value =bajaZonas;

}

function initMap() {
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
  for ( i = 1; i <= maxId; i++) {
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
  var heatmap = new google.maps.visualization.HeatmapLayer({
    data: [],
    map: map,
    radius: 16
  });
}
