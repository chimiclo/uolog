document.addEventListener("turbo:load", () => {
  const main = document.querySelector(".myCatchSwiper");
  const thumbs = document.querySelector(".myThumbsSwiper");

  if (!main || !thumbs) return;

  const thumbsSwiper = new Swiper(".myThumbsSwiper", {
    slidesPerView: 4,
    spaceBetween: 10,
  });

  new Swiper(".myCatchSwiper", {
    loop: true,
    pagination: {
      el: ".swiper-pagination",
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