  var placeSearch, autocomplete;
  var destinoLat,destinoLng, peligrosa,distanciaLugar,esZonaPeligrosa;
  var dir,coordenadas,fecha;
  var componentForm = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    country: 'long_name',
    postal_code: 'short_name'
  };

  
  function asignarLocal(){
	  fecha = document.getElementById("fechaInsert").value;
	  esZonaPeligrosa = document.getElementById("zonaPeligrosa").value;
	  if (fecha != "" && dir != "" && coordenadas != "" && distanciaLugar != "" && esZonaPeligrosa != ""){
			  localStorage.setItem("direccion", dir);
			  localStorage.setItem("coordenadas", coordenadas);
			  localStorage.setItem("fecha", fecha);
			  localStorage.setItem("distanciaInsert", distanciaLugar);
			  localStorage.setItem("zonaPeligrosa", esZonaPeligrosa);
			  location.href ="nuevoPedidoVE.jsp";

			  }
	  else{
		  if(dir != "" && coordenadas != "" && distanciaLugar != "" && esZonaPeligrosa != ""){
			  if(fecha == ""){				  
				  $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'Complete todos los campos',
						// (string | mandatory) the text inside the notification
						text: 'Por favor asigne una fecha valida para poder continuar',
						// (string | optional) the image to display on the left
						image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2500'
					});
			  }
			  else{
				  $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'Complete todos los campos',
						// (string | mandatory) the text inside the notification
						text: 'Por favor asigne una fecha valida y una direccion para poder continuar',
						// (string | optional) the image to display on the left
						image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2500'
					});
			  }
		  }
		  else{
			  if(fecha != ""){
				  $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'Direccion no valida',
						// (string | mandatory) the text inside the notification
						text: 'La direccion sobrepasa los limites de envio',
						// (string | optional) the image to display on the left
						image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2500'
					});
			  }
			  else{
				  $.gritter.add({
						// (string | mandatory) the heading of the notification
						title: 'Complete todos los campos',
						// (string | mandatory) the text inside the notification
						text: 'Por favor asigne una fecha valida y una direccion para poder continuar',
						// (string | optional) the image to display on the left
						image: 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Icon_Simple_Error.png',
						// (bool | optional) if you want it to fade out on its own or just sit there
						sticky: false,
						// (int | optional) the time you want it to be alive for before fading out
						time: '2500'
					});
			  }
		  }
		  
		  
	  }
  }
  
  function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete(
        /** @type {!HTMLInputElement} */(document.getElementById('inputlg')),
        {types: ['geocode']});
    autocomplete.addListener('place_changed', fillInAddress);

  }

  let lugar;
  let lugarmap;

  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();


    if (place.address_components[6]){
      lugar = `${place.address_components[1].long_name} ${place.address_components[0].long_name}, ${place.address_components[3].long_name}, ${place.address_components[5].long_name}, ${place.address_components[6].long_name}`;
      lugarmap =`${place.address_components[0].long_name}+${place.address_components[1].long_name}+${place.address_components[3].long_name}+${place.address_components[5].long_name}+${place.address_components[6].long_name}`
    }
    else if (place.address_components[5]){
      lugar = `${place.address_components[1].long_name} ${place.address_components[0].long_name}, ${place.address_components[2].long_name}, ${place.address_components[3].long_name}, ${place.address_components[4].long_name}, ${place.address_components[5].long_name}`
      lugarmap =`${place.address_components[0].long_name}+${place.address_components[1].long_name}+${place.address_components[2].long_name}+${place.address_components[3].long_name}+${place.address_components[4].long_name}+${place.address_components[5].long_name}`
    }
    else{
      lugar = `${place.address_components[0].long_name} ${place.address_components[2].long_name} ${place.address_components[3].long_name}`
      lugarmap = `${place.address_components[0].long_name}+${place.address_components[2].long_name}+${place.address_components[3].long_name}`
    }

    lugarmap = replaceLugar(lugarmap);
    dir = lugar;
    document.getElementById('direc').value = lugar;
    obtenCoords(lugarmap);

    mostrarMapa();
  }


  function replaceLugar(string){
    return string.replace(/ /g,"+");
  }

  function obtenCoords(lugarmap) {
    let lat,lng, direccion;
    let xhttp = new XMLHttpRequest();
    xhttp.open("GET", `https://maps.googleapis.com/maps/api/geocode/json?address=${lugarmap}&key=AIzaSyBD_1mkSBgMDYfy00Z6JGLq9zsTlmmlLuA`, true);
    xhttp.onreadystatechange = function(event) {
          if (xhttp.readyState === XMLHttpRequest.DONE) {
            let response = JSON.parse(event.target.response);
             lat = response.results[0].geometry.location.lat;
             lng = response.results[0].geometry.location.lng;
             document.getElementById('coordsInsert').value = `${lat},${lng}`;
             coordenadas = `${lat},${lng}`;
             destinoLat = lat;
             destinoLng = lng;
          }
     }
     xhttp.send();
  }




  // Bias the autocomplete object to the user's geographical location,
  // as supplied by the browser's 'navigator.geolocation' object.
  function geolocate() {
        var geolocation = {
          lat: -32.970689,
          lng: -60.686982
        };
        var circle = new google.maps.Circle({
          center: geolocation,
          radius: 27
        });
        autocomplete.setBounds(circle.getBounds());
  }


function mostrarMapa(){
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {lat: -32.970689, lng: -60.686982}
  });

  var geocoder = new google.maps.Geocoder();
  // geocodeAddress(geocoder , map)
  document.getElementById('submit').addEventListener('click', function() {
    geocodeAddress(geocoder, map);
    zonaPeligrosa(map);
  });
}

  function zonaPeligrosa(map) {
	  let maxId = document.getElementById("cantidadMaxima").value;
	  let i,coordZona,zonaPel,destino;
	  
	  for (i = 0; i < maxId; i++) {
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
	          destino = new google.maps.LatLng(destinoLat,destinoLng);
	          peligrosa = google.maps.geometry.poly.containsLocation(destino, zonaPel);

	        	  if(peligrosa){
	    	          document.getElementById('zonaPeligrosa').value = peligrosa;
	        	  }


	  }
	  if (document.getElementById('zonaPeligrosa').value == ""){
		  document.getElementById('zonaPeligrosa').value = false;
	  }

    //para esto traigo el el json y armo el array y voy comparando cada zona con el punto. si es true que corte el while

  }

  function coord() {
    var geocoder = new google.maps.Geocoder();
    document.getElementById('submit').addEventListener('click', function() {
      geocodeAddress(geocoder, map);
      
      document.getElementById('direc').value = "";
	  document.getElementById('coordsInsert').value = "";
	  document.getElementById('distanciaInsert').value = "";
	  document.getElementById('zonaPeligrosa').value = "";
	  
    });
  }
  //
  function geocodeAddress(geocoder, resultsMap) {
    var address = document.getElementById('inputlg').value;
    document.getElementById('map').style.visibility= 'visible';
    geocoder.geocode({'address': address}, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        resultsMap.setCenter(results[0].geometry.location);
        // console.log(results);
        var marker = new google.maps.Marker({
          map: resultsMap,
          position: results[0].geometry.location
        });
        obtenerDistancia();
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  function obtenerDistancia() {

    var bounds = new google.maps.LatLngBounds;
    var markersArray = [];

    var origin1 = {lat: -32.966070, lng: -60.678936};
    var destinationA = {lat: destinoLat, lng: destinoLng};
    var destinationIcon = 'https://chart.googleapis.com/chart?' +
        'chst=d_map_pin_letter&chld=D|FF0000|000000';
    var originIcon = 'https://chart.googleapis.com/chart?' +
        'chst=d_map_pin_letter&chld=O|FFFF00|000000';
    var geocoder = new google.maps.Geocoder;

    var service = new google.maps.DistanceMatrixService;
    service.getDistanceMatrix({
      origins: [origin1],
      destinations: [destinationA],
      travelMode: 'DRIVING',
      unitSystem: google.maps.UnitSystem.METRIC,
      avoidHighways: false,
      avoidTolls: false
    }, function(response, status) {
      if (status !== 'OK') {
        alert('Error was: ' + status);
      } else {
        var originList = response.originAddresses;
        var destinationList = response.destinationAddresses;

        var showGeocodedAddressOnMap = function(asDestination) {
          var icon = asDestination ? destinationIcon : originIcon;
          return function(results, status) {
            if (status != 'OK') {
              alert('Ocurrio un problema con la conexion a google maps, por favor vuelva a intentarlo');
            }
          };
        };
  // arreglar como lo muestra
        for (var i = 0; i < originList.length; i++) {
          var results = response.rows[i].elements;
          geocoder.geocode({'address': originList[i]},
              showGeocodedAddressOnMap(false));
          for (var j = 0; j < results.length; j++) {
            geocoder.geocode({'address': destinationList[j]},
                showGeocodedAddressOnMap(true));
            document.getElementById('distanciaInsert').value = results[j].distance.value;
            distanciaLugar = results[j].distance.value;

          }
        }
      }
    });
  }
