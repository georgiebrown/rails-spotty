// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import "../controllers"

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { autocomplete } from '../components/autocomplete';
import FollowButton from "../components/follow_button";
import FavButton from "../components/favourite_button";
import { initOwlCarousel } from "../components/init_owl_carousel";
import WizardForm from "../components/WizardForm";
import Collapsible from "../components/Collapsible";
import MapCarousel from "../components/map_carousel"
import { initWaveEffect } from "../components/click_effect";


autocomplete();
// Internal imports, e.g:
// import { initSelect2 } from '../components/inist_select2';

document.addEventListener('turbolinks:load', () => {
  // Marty Magic
  const initPlugin = (querySelector, Component) => {
    const els = document.querySelectorAll(querySelector);
    if (els) {
      els.forEach(el => {
        Component(el);
      });
    }
  };
initPlugin(".js-follow-btn", FollowButton);
initPlugin(".js-favourite-btn", FavButton);
initOwlCarousel();
initPlugin(".js-account-wizard", WizardForm);
initPlugin(".js-collapsible", Collapsible);
initPlugin(".js-map-carousel", MapCarousel);
});

