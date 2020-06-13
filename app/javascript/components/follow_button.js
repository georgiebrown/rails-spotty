const FollowButton = rootElement => {
  const followBtn = rootElement;

    followBtn.addEventListener("click", () => {
    if (followBtn.dataset.followstate == "following") {
      fetch (`/unfollow/${followBtn.dataset.follow_id}`, { method : 'DELETE' });
      followBtn.dataset.followstate = "not following";
      console.log(followBtn.dataset.followstate)
      followBtn.classList.remove("fas", "fa-minus-square")
      followBtn.classList.add("far", "fa-plus-square")

    } else if (followBtn.dataset.followstate == "not following") {
      fetch (`/users/${followBtn.dataset.user_id}/follows/`, { headers: { accept: "application/json" } , method: 'POST' })
      .then(response => response.json())
      .then((data) => {
        followBtn.dataset.followstate = "following";
        console.log(followBtn.dataset.followstate)
        followBtn.classList.remove("far", "fa-plus-square")
        followBtn.classList.add("fas", "fa-minus-square")
        followBtn.dataset.follow_id = data.follow.id;
      });
    }
  });



};

export default FollowButton;
