import GMaps from 'gmaps/gmaps.js';


const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0, disableDefaultUI: true });
  const markers = JSON.parse(mapElement.dataset.markers);


  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(15);
  } else {
    map.fitLatLngBounds(markers);
  }

  // Add Event listeners to markers
  markers.forEach((marker, index) => {
    map.addMarker({
      ...marker,
      click: function(e) {
        window.setCarouselPos(index);
      }
    });
  });

  window.selectMapMarker = (markerIndex) => {
    map.setZoom(10 + Math.random() * 2);
    const { lat,lng } = markers[markerIndex];
    // console.log("selectMarker" + markerIndex);
    map.panTo({lat, lng});

    // const degreesPadding = 0.05;
    // const southWest = new google.maps.LatLng({ lat:lat-degreesPadding, lng:lng-degreesPadding })
    // const northEast = new google.maps.LatLng({ lat:lat+degreesPadding, lng:lng+degreesPadding })
    // var markerBounds = new google.maps.LatLngBounds(southWest, northEast);
    // map.panToBounds(markerBounds);
  }



  if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
        map.addMarker({
        lat: position.coords.latitude,
        lng: position.coords.longitude,
        icon: "https://res.cloudinary.com/daqhmzr2j/image/upload/v1592481738/cl_iohshj.png"
      })

            map.setCenter(pos);

          }, function() {
            // handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          // handleLocationError(false, infoWindow, map.getCenter());
        }

  const styles = [
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#444444"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": "64"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "lightness": "100"
            },
            {
                "saturation": "-81"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "lightness": "100"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#c4ccd6"
            },
            {
                "visibility": "on"
            }
        ]
    }
]
  map.addStyle({
  styles: styles,
  mapTypeId: 'map_style'
  });
  map.setStyle('map_style');



}







