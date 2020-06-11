// app/javascript/components/autocomplete.js
function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var spotLocationEl = document.querySelector('.js-auto-complete');

    if (spotLocationEl) {
      var autocomplete = new google.maps.places.Autocomplete(spotLocationEl, {  });
      google.maps.event.addDomListener(spotLocationEl, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
      autocomplete.addListener("place_changed", function(){
        var selectedPlace = autocomplete.getPlace();
        console.log(selectedPlace)
        document.querySelector(".js-place-id").value = selectedPlace.place_id
        document.querySelector(".js-place-name").value = selectedPlace.name
        document.querySelector(".js-place-address").value = selectedPlace.formatted_address

      })
    }
  });

}

export { autocomplete };
