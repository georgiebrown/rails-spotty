import JQuery from 'jquery';
window.$ = window.JQuery = JQuery;
import 'owl.carousel';
const initOwlCarousel = () => {
  $(document).ready(function () {
    $('.owl-carousel').owlCarousel({ items: 1, loop: true, dots: false});
  });
}
export { initOwlCarousel };
