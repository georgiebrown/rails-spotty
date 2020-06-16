
const SlideMenu = page => {
  document.querySelector('.js-menu-toggle').addEventListener("click", () => {
    page.classList.toggle('shazam');
  });
  document.querySelector('.js-content').addEventListener("click", () => {
    page.classlist.remove('shazam');
  });
};

export default SlideMenu;

