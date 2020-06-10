// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var spotLocation = document.getElementById('spot_location');

    if (spotLocation) {
      var autocomplete = new google.maps.places.Autocomplete(spotLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(spotLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
