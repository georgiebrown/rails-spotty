const Collapsible = rootElement => {
  const collapsibleBtn = rootElement.querySelector(".js-collapsible-btn");
  const collapsibleContent = rootElement.querySelector(
    ".js-collapsible-content"
  );
  let isCollapsed = false;

  collapsibleBtn.addEventListener("click", () => {
    isCollapsed = !isCollapsed;
    syncState();
  });

  const syncState = () => {
    collapsibleContent.style.display = isCollapsed ? "none" : "block";
  };
};

export default Collapsible;
