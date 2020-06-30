const FollowButton = followBtn => {
  const btnParent = followBtn.closest('.js-follow-collapse')
  const csrfToken = document.querySelector('meta[name=csrf-token]').content
    followBtn.addEventListener("click", () => {
    if (followBtn.dataset.followstate == "following") {
      fetch (`/unfollow/${followBtn.dataset.follow_id}`, { headers: { "X-CSRF-Token": csrfToken } , method : 'DELETE' });
      followBtn.dataset.followstate = "not following";
      followBtn.classList.remove("fas", "fa-minus-square")
      followBtn.classList.add("far", "fa-plus-square")
      if (btnParent) btnParent.style.display = "none";
    } else if (followBtn.dataset.followstate == "not following") {
      fetch (`/follow/${followBtn.dataset.user_id}`, { headers: { "X-CSRF-Token": csrfToken, accept: "application/json" } , method: 'POST' })
      .then(response => response.json())
      .then((data) => {
        followBtn.dataset.followstate = "following";
        followBtn.classList.remove("far", "fa-plus-square")
        followBtn.classList.add("fas", "fa-minus-square")
        followBtn.dataset.follow_id = data.follow.id;
      });
    }
  });
};

export default FollowButton;
