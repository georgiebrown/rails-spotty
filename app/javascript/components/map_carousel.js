const carouselItemWidth = 250;

const MapCarousel = rootElement => {
  rootElement.addEventListener("scroll",() => {
    const selectedItemIndex = Math.round(rootElement.scrollLeft / carouselItemWidth)
    window.selectMapMarker(selectedItemIndex);
  })
};

export default MapCarousel;
