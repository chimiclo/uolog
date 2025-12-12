document.addEventListener("DOMContentLoaded", () => {
  const mainEl = document.querySelector(".myCatchSwiper");
  const thumbEl = document.querySelector(".myThumbsSwiper");

  if (!mainEl || !thumbEl) return;

  console.log("🌀 SWIPER INIT LOADED");

  const thumbsSwiper = new Swiper(".myThumbsSwiper", {
    spaceBetween: 10,
    slidesPerView: 4,
    freeMode: true,
    watchSlidesProgress: true,
  });

  new Swiper(".myCatchSwiper", {
    spaceBetween: 10,
    loop: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    thumbs: {
      swiper: thumbsSwiper,
    },
  });
});