const carouselItemWidth = 250;

const MapCarousel = rootElement => {
  rootElement.addEventListener("scroll",() => {
    const selectedItemIndex = Math.round(rootElement.scrollLeft / carouselItemWidth)
    window.selectMapMarker(selectedItemIndex);
  })
  window.setCarouselPos = (index) => {
    rootElement.scrollTo({
      top: 0,
      left: index * carouselItemWidth,
      behavior: 'smooth'
    });
  };
};

export default MapCarousel;
