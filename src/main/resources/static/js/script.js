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

// start Jquery
$(document).ready(function () {
  // showpassword form dangnhap
  $(".btn-show-pw").on("click", "i", function () {
    if (!$(this).hasClass("bi-eye-slash")) {
      $(this)
        .toggleClass("bi-eye bi-eye-slash")
        .closest("div")
        .children("input")
        .prop("type", "password");
    } else {
      $(this)
        .toggleClass("bi-eye bi-eye-slash")
        .closest("div")
        .children("input")
        .prop("type", "text");
    }
  });

  // change icon showpassword
  $(".btn-show-pw")
    .on("mouseenter", function () {
      $(this).toggleClass("d-block");
    })
    .on("mouseleave", function () {
      $(this).toggleClass("d-none");
    });

  // validate phone
  $.validator.addMethod(
    "phone",
    function (value) {
      return /0[0-9]{9}/.test(value);
    },
    "Điện thoại chưa đúng đinh dạng"
  );

  // validate email
  $.validator.addMethod(
    "email",
    function (value) {
      return /[^@]+@[^@]+\.[a-zA-Z]{2,6}/.test(value);
    },
    "Vui lòng nhập đúng đinh dạng abc@domain.tld"
  );

  // validate form dangky
  $("#form-dangky").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      userPhone: {
        required: true,
        phone: true,
      },
      userName: {
        required: true,
        minlength: 6,
      },
      userEmail: {
        required: true,
        email: true,
      },
      userPassword: {
        required: true,
        minlength: 6,
      },
      confirmPassword: {
        required: true,
        equalTo: "input[name='userPassword'",
      },
    },
    messages: {
      userPhone: {
        required: "vui lòng nhập số điện thoại",
      },
      userName: {
        required: "Vui lòng nhập tên",
        minlength: "vui lòng nhập trên 6 kí tự",
      },
      userEmail: {
        required: "Vui lòng nhập gmail",
      },
      userPassword: {
        required: "Vui lòng nhập password",
        minlength: "vui lòng nhập trên 6 kí tự",
      },
      confirmPassword: {
        required: "Vui lòng nhập lại mật khẩu",
        equalTo: "Mật khẩu không trùng khớp",
      },
    },
  });

  // validate form dangnhap
  $("#form-dangnhap").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      userPhone: {
        required: true,
        phone: true,
      },
      userPassword: {
        required: true,
        minlength: 6,
      },
    },
    messages: {
      userPhone: {
        required: "vui lòng nhập số điện thoại",
      },
      userPassword: {
        required: "Vui lòng nhập password",
        minlength: "vui lòng nhập trên 6 kí tự",
      },
    },
  });
});

// end Jquery
