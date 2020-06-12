const FollowButton = rootElement => {
  const followBtn = rootElement.querySelector(".js-follow-btn");

    followBtn.addEventListener("click", () => {
    if (followBtn.dataset.followstate == "following") {
      fetch (`/unfollow/${followBtn.dataset.follow_id}`);
      followBtn.dataset.followstate = "not following";
    }
    if (followBtn.dataset.followstate == "not following") {
      fetch (`/users/${followBtn.dataset.user_id}/follows/`, { headers: { accept: "application/json" } })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        followBtn.dataset.followstate = "following";
        followBtn.dataset.follow_id = data;
      });
    }
  });



};

export default FollowButton;
