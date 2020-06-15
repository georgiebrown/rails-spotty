const FavButton = favBtn => {
  const btnParent = favBtn.closest('.js-fav-collapse')
  const csrfToken = document.querySelector('meta[name=csrf-token]').content
    favBtn.addEventListener("click", () => {
    if (favBtn.dataset.favstate == "favourited") {
      fetch (`/favourites/${favBtn.dataset.favourite_id}`, { headers: { "X-CSRF-Token": csrfToken } , method : 'DELETE' });
      favBtn.dataset.favstate = "not favourited";
      favBtn.classList.remove("fas")
      favBtn.classList.add("far")
      if (btnParent) btnParent.style.display = "none";
    } else if (favBtn.dataset.favstate == "not favourited") {
      fetch (`/spots/${favBtn.dataset.spot_id}/favourites/`, { headers: { "X-CSRF-Token": csrfToken, accept: "application/json" } , method: 'POST' })
      .then(response => response.json())
      .then((data) => {
        favBtn.dataset.favstate = "favourited";
        favBtn.classList.remove("far")
        favBtn.classList.add("fas")
        favBtn.dataset.favourite_id = data.favourite.id;
      });
    }
  });
};

export default FavButton;
