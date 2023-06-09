// create Multiselect for specs Product
if ($("#specs").length > 0) {
  new MultiSelectTag("specs");
}

// start Jquery
$(document).ready(function () {
  // validate phone
  $.validator.addMethod(
    "phone",
    function (value) {
      return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(value);
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
  // validate spaces
  $.validator.addMethod(
    "noSpace",
    function (value) {
      return /^\S+$/.test(value);
    },
    "Vui lòng không để khoản trống"
  );
  // validate form category
  $("#form-loai").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      categoryId: {
        required: true,
        maxlength: 10,
        noSpace: true,
      },
      categoryName: {
        required: true,
        maxlength: 50,
      },
    },
    messages: {
      categoryId: {
        required: "vui lòng nhập mã loại",
        maxlength: "vui lòng dưới 10 ký tự",
      },
      categoryName: {
        required: "Vui lòng nhập tên",
        minlength: "vui lòng nhập dưới 50 kí tự",
      },
    },
  });

  // submit form category
  $("#form-loai").on("submit", function (event) {
    event.preventDefault();
    if ($(this).valid()) {
      if (event.originalEvent.submitter.innerText == "Add") {
        //   ajax create form category
        $("#btn-addCategory").on("click", function () {
          // wait for toast
          $("#form-loai button").attr("disabled", true);
          $.ajax({
            url: "/admin/manager-category/check",
            method: "POST",
            data: {
              categoryId: $("#form-loai input[name='categoryId'").val(),
              categoryName: $("input[name='categoryName'").val(),
            },
            success: function (resultText) {
              // show Toast
              if (resultText) {
                bootstrapToast(
                  "#toast-update",
                  "Mã này đã tồn tại. Bạn muốn cập nhật?",
                  3000
                );
                // if click update
                $("#btn-update-cate").on("click", function () {
                  $.ajax({
                    url: "/admin/manager-category/create",
                    method: "POST",
                    data: {
                      categoryId: $("#form-loai input[name='categoryId'").val(),
                      categoryName: $("input[name='categoryName'").val(),
                    },
                    success: function () {
                      location.reload();
                    },
                  });
                });
                $("#form-loai button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/manager-category/create",
                  method: "POST",
                  data: {
                    categoryId: $("#form-loai input[name='categoryId'").val(),
                    categoryName: $("input[name='categoryName'").val(),
                  },
                  success: function (resultText) {
                    bootstrapToast(
                      "#toast-success",
                      "Bạn đã thêm thành công.",
                      3000
                    );
                    setTimeout(function () {
                      location.reload();
                    }, 2000);
                  },
                  error: function (jqXHR, textStatus) {},
                });
              }
            },
          });
        });
        $("#btn-addCategory").trigger("click");
      } else if (event.originalEvent.submitter.innerText == "Delete") {
        $("#btn-delCategory").on("click", function () {
          $("#form-loai button").attr("disabled", true);
          $.ajax({
            url: "/admin/manager-category/check",
            method: "POST",
            data: {
              categoryId: $("#form-loai input[name='categoryId'").val(),
              categoryName: $("input[name='categoryName'").val(),
            },
            success: function (resultText) {
              // show Toast
              if (!resultText) {
                bootstrapToast(
                  "#toast-warning",
                  "Mã vừa nhập không có trông hệ thống",
                  1000
                );
                $("#form-loai button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/manager-category/delete",
                  method: "POST",
                  data: {
                    categoryId: $("#form-loai input[name='categoryId'").val(),
                    categoryName: $("input[name='categoryName'").val(),
                  },
                  success: function (resultText) {
                    bootstrapToast(
                      "#toast-success",
                      "Bạn đã thêm thành công.",
                      2000
                    );
                    setTimeout(function () {
                      location.reload();
                    }, 1000);
                  },
                });
              }
            },
          });
        });
        $("#btn-delCategory").trigger("click");
      }
    }
  });

  function getDateNow() {
    let date = new Date();
    let dateString =
      (date.getDate() < 10 ? "0" + date.getDate() : date.getDate()) +
      "/" +
      (date.getMonth() + 1 < 10
        ? "0" + (date.getMonth() + 1)
        : date.getMonth() + 1) +
      "/" +
      date.getUTCFullYear() +
      " " +
      (date.getHours() < 10 ? "0" + date.getHours() : date.getHours()) +
      ":" +
      (date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes()) +
      ":" +
      (date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds());
    return dateString;
  }

  function bootstrapToast(element, text, delay) {
    let option = {
      animation: true,
      delay: delay,
    };
    $(element).find(".toast-title").text(text);
    $(element).find("small").text(getDateNow());
    bootstrap.Toast.getOrCreateInstance($(element), option).show();
  }
});
