document.addEventListener("turbo:load", () => {
  if (!window.Swiper) {
    console.log("Swiper がまだ読み込まれていません");
    return;
  }

  console.log("swiper_init loaded");

  const thumbs = new Swiper(".myThumbsSwiper", {
    slidesPerView: "auto",
    spaceBetween: 10,
    freeMode: true,
    watchSlidesProgress: true,
  });

  new Swiper(".myCatchSwiper", {
    loop: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    thumbs: {
      swiper: thumbs,
    },
  });
});
