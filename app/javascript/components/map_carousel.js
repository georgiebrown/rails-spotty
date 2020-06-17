const carouselItemWidth = 200;

const MapCarousel = rootElement => {
  rootElement.addEventListener("scroll",() => {
    const selectedItemIndex = Math.round(rootElement.scrollLeft / carouselItemWidth)
    window.selectMapMarker(selectedItemIndex);
    const allCards = rootElement.querySelectorAll(".card");
    allCards.forEach((card) => {
      card.classList.remove("active")
    });
    const selectedCard = allCards[selectedItemIndex]
    selectedCard.classList.add("active");
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
