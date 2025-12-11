document.addEventListener("turbo:load", () => {
  if (document.querySelector(".swiper")) {
    new Swiper(".swiper", {
      loop: true,
      pagination: { el: ".swiper-pagination" },
    });
  }
});