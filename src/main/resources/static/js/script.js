// start code Flickity top-bar
var elemTopBar = document.querySelector(".top-bar");
var flkty = new Flickity(elemTopBar, {
  prevNextButtons: false,
  pageDots: false,
  contain: true,
  lazyLoad: true,
});
// end code Flickity top-bar

// start code Flickity itemSlide-carousel
var elemItemSlideCarousel = document.querySelector(".itemSlide-carousel");
var flkty = new Flickity(elemItemSlideCarousel, {
  pageDots: false,
  contain: true,
  lazyLoad: true,
  draggable: true,
  autoPlay: 2000,
});
// end code Flickity itemSlide-carousel

// start code Flickity itemSlide-carousel
var elem = document.querySelector(".homeProduct-content-carousel");
var flkty = new Flickity(elem, {
  pageDots: false,
  contain: true,
  groupCells: true,
  autoPlay: 2000,
});
// end code Flickity itemSlide-carousel

// start code form Dangnhap
// validate form
(() => {
  "use strict";
  const forms = $(".needs-validation");
  Array.from(forms).forEach((form) => {
    form.addEventListener(
      "submit",
      (event) => {
        if (!form.checkValidity()) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add("was-validated");
      },
      true
    );
  });
})();

// showpassword form dangnhap
$(document).ready(function () {
  $(".btn-show-pw").on("click", "i", { showPass: false }, function (event) {
    if (event.data.showPass) {
      $("input.password")
        .prop("type", "password")
        .next()
        .children("i")
        .toggleClass("bi-eye bi-eye-slash");
      event.data.showPass = false;
    } else {
      $("input.password")
        .prop("type", "text")
        .next()
        .children("i")
        .toggleClass("bi-eye bi-eye-slash");
      event.data.showPass = true;
    }
  });

  $(".btn-show-pw")
    .on("mouseenter", function () {
      console.log(this);
      $(this).toggleClass("d-block");
    })
    .on("mouseleave", function () {
      console.log(this);
      $(this).toggleClass("d-none");
    });
});
// end code form Dangnhap
