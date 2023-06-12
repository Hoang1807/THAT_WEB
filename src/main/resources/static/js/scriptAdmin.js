// create Multiselect for specs Product
if ($("#specs").length > 0) {
  new MultiSelectTag("specs");
}

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

  //validate form producer
  $("#form-nsx").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      producerId: {
        required: true,
        noSpace: true,
      },
      producerName: {
        required: true,
        maxlength: 50,
      },
      producerEmail: {
        required: true,
        email: true,
        noSpace: true,
      },
      producerPhone: {
        required: true,
        phone: true,
      },
    },
    messages: {
      producerId: {
        required: "Vui lòng nhập mã nsx",
      },
      producerName: {
        required: "Vui lòng nhập tên",
        maxlength: "Vui lòng nhập dưới 50 kí tự",
      },
      producerEmail: {
        required: "vui lòng nhập email",
      },
      producerPhone: {
        required: "Vui lòng nhập số điện thoại",
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
      //   ajax create form category
      if (event.originalEvent.submitter.innerText == "Add") {
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
                $("#btn-update").on("click", function () {
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
                });
              }
            },
          });
        });
        $("#btn-addCategory").trigger("click");
        //   ajax delete form category
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
                  "Mã vừa nhập không có trong hệ thống",
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
                      "Bạn đã xóa thành công.",
                      2000
                    );
                    setTimeout(function () {
                      location.reload();
                    }, 1000);
                  },
                  error: function (jqXHR, textStatus, errorThrown) {
                    bootstrapToast(
                      "#toast-warning",
                      "Thông tin loại này đã liên kết với sản phẩm không thể xóa!!",
                      1000
                    );
                    $("#form-loai button").attr("disabled", false);
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

  // validate form spec
  $("#form-thongsokythuat").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      specKey: {
        required: true,
        maxlength: 20,
      },
      specValue: {
        required: true,
        maxlength: 50,
      },
    },
    messages: {
      specKey: {
        required: "vui lòng nhập key",
        maxlength: "vui lòng nhập dưới 20 ký tự",
      },
      specValue: {
        required: "Vui lòng nhập giá trị",
        maxlength: "vui lòng nhập dưới 50 kí tự",
      },
    },
  });

  // submit form spec
  $("#form-thongsokythuat").on("submit", function (event) {
    event.preventDefault();
    if ($(this).valid()) {
      //   ajax create form spec
      if (event.originalEvent.submitter.innerText == "Add") {
        $("#btn-addSpec").on("click", function () {
          // wait for toast
          $("#form-thongsokythuat button").attr("disabled", true);
          $.ajax({
            url: "/admin/manager-spec/check",
            method: "POST",
            data: {
              specId: $("input[name='specId']").val(),
              specKey: $("input[name='specKey']").val(),
              specValue: $("input[name='specValue']").val(),
            },
            success: function (resultText) {
              // show Toast
              if (resultText) {
                if ($("input[name='specId'").val() == "") {
                  bootstrapToast(
                    "#toast-warning",
                    "Cặp giá trị này đã tồn tại.",
                    1000
                  );
                } else {
                  bootstrapToast(
                    "#toast-update",
                    "Cặp giá trị này đã tồn tại. Bạn muốn cập nhật?",
                    1000
                  );
                  $("#btn-update").on("click", function () {
                    $.ajax({
                      url: "/admin/manager-spec/create",
                      method: "POST",
                      data: {
                        specId: $("input[name='specId']").val(),
                        specKey: $("input[name='specKey']").val(),
                        specValue: $("input[name='specValue']").val(),
                      },
                      success: function () {
                        location.reload();
                      },
                    });
                  });
                }
                $("#form-thongsokythuat button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/manager-spec/create",
                  method: "POST",
                  data: {
                    specKey: $("input[name='specKey']").val(),
                    specValue: $("input[name='specValue']").val(),
                  },
                  success: function (resultText) {
                    bootstrapToast(
                      "#toast-success",
                      "Bạn đã thêm thành công.",
                      2000
                    );
                    setTimeout(function () {
                      location.reload();
                    }, 2000);
                  },
                });
              }
            },
          });
        });
        $("#btn-addSpec").trigger("click");
        //   ajax delete form category
      } else if (event.originalEvent.submitter.innerText == "Delete") {
        $("#btn-delSpec").on("click", function () {
          $("#form-thongsokythuat button").attr("disabled", true);
          $.ajax({
            url: "/admin/manager-spec/check",
            method: "POST",
            data: {
              specKey: $("input[name='specKey'").val(),
              specValue: $("input[name='specValue'").val(),
            },
            success: function (resultText) {
              // show Toast
              if (!resultText) {
                bootstrapToast(
                  "#toast-warning",
                  "Cặp giá trị không có trong hệ thống",
                  1000
                );
                $("#form-thongsokythuat button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/manager-spec/delete",
                  method: "POST",
                  data: {
                    specKey: $("input[name='specKey']").val(),
                    specValue: $("input[name='specValue']").val(),
                  },
                  success: function (resultText) {
                    bootstrapToast(
                      "#toast-success",
                      "Bạn đã xóa thành công.",
                      2000
                    );
                    setTimeout(function () {
                      location.reload();
                    }, 1000);
                  },
                  error: function (jqXHR, textStatus, errorThrown) {
                    bootstrapToast(
                      "#toast-warning",
                      "Thông số này đã liên kết một số sản phẩm không thể xóa!",
                      2000
                    );
                  },
                });
                $("#form-thongsokythuat button").attr("disabled", false);
              }
            },
          });
        });
        $("#btn-delSpec").trigger("click");
      }
    }
  });

  // validate form account
  $("#form-account").validate({
    errorClass: "error fail-alert",
    validClass: "valid success-alert",
    rules: {
      userPhone: {
        required: true,
        phone: true,
      },
      userName: {
        required: true,
        maxlength: 50,
        minlength: 6,
      },
      userEmail: {
        required: true,
        email: true,
      },
      userPassword: {
        required: true,
        maxlength: 50,
        minlength: 6,
      },
    },
    messages: {
      userPhone: {
        required: "Vui lòng nhập sô điện thoại",
      },
      userName: {
        required: "Vui lòng nhập họ tên",
        maxlength: "Vui lòng nhập dưới 50 kí tự",
        minlength: "Vui lòng nhập trên 6 kí tự",
      },
      userEmail: {
        required: "Vui lòng nhập email",
      },
      userPassword: {
        required: "Vui lòng nhập password",
        maxlength: "Vui lòng nhập dưới 60 kí tự",
        minlength: "Vui lòng nhập trên 6 kí tự",
      },
    },
  });

  // submit form account
  $("#form-account").on("submit", function (event) {
    event.preventDefault();
    if ($(this).valid()) {
      //   ajax create form spec
      if (event.originalEvent.submitter.innerText == "Add") {
        $("#btn-addAccount").on("click", function () {
          // wait for toast
          $("#form-account button").attr("disabled", true);
          $.ajax({
            url: "/admin/manager-account/check",
            method: "POST",
            data: {
              userPhone: $("#form-account input[name='userPhone']").val(),
            },
            success: function (resultText) {
              // show Toast
              if (resultText) {
                bootstrapToast(
                  "#toast-update",
                  "Tài khoản đã tồn tại. Bạn muốn cập nhật?",
                  3000
                );
                // if click update
                $("#btn-update").on("click", function () {
                  $.ajax({
                    url: "/admin/manager-account/create",
                    method: "POST",
                    data: {
                      userPhone: $(
                        "#form-account input[name='userPhone']"
                      ).val(),
                      userName: $("#form-account input[name='userName']").val(),
                      userEmail: $(
                        "#form-account input[name='userEmail']"
                      ).val(),
                      userPassword: $(
                        "#form-account input[name='userPassword']"
                      ).val(),
                      userRole: $("#form-account #Admin").prop("checked"),
                    },
                    success: function () {
                      location.reload();
                    },
                  });
                });
                $("#form-account button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/manager-account/create",
                  method: "POST",
                  data: {
                    userPhone: $("#form-account input[name='userPhone']").val(),
                    userName: $("#form-account input[name='userName']").val(),
                    userEmail: $("#form-account input[name='userEmail']").val(),
                    userPassword: $(
                      "#form-account input[name='userPassword']"
                    ).val(),
                    userRole: $("#form-account #Admin").prop("checked"),
                  },
                  success: function (resultText) {
                    bootstrapToast(
                      "#toast-success",
                      "Bạn đã thêm thành công.",
                      2000
                    );
                    setTimeout(function () {
                      location.reload();
                    }, 2000);
                  },
                });
              }
            },
          });
        });
        $("#btn-addAccount").trigger("click");
        //   ajax delete form category
      }
    }
  });

  // submit form producer
  $("#form-nsx").on("submit", function (event) {
    event.preventDefault();
    if ($(this).valid()) {
      if (event.originalEvent.submitter.innerText == "Add") {
        //   ajax create form category
        $("#btn-saveProducer").on("click", function () {
          // wait for toast
          $("#form-nsx button").attr("disabled", true);
          $.ajax({
            url: "/admin/producer/check",
            method: "POST",
            data: {
              producerId: $("#form-nsx input[name='producerId'").val(),
              producerName: $("input[name='producerName'").val(),
              producerEmail: $("input[name='producerEmail'").val(),
              producerPhone: $("input[name='producerPhone'").val(),
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
                $("#btn-update").on("click", function () {
                  $.ajax({
                    url: "/admin/producer/save",
                    method: "POST",
                    data: {
                      producerId: $("#form-nsx input[name='producerId'").val(),
                      producerName: $("input[name='producerName'").val(),
                      producerEmail: $("input[name='producerEmail'").val(),
                      producerPhone: $("input[name='producerPhone'").val(),
                    },
                    success: function () {
                      location.reload();
                    },
                  });
                });
                $("#form-nsx button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/producer/save",
                  method: "POST",
                  data: {
                    producerId: $("#form-nsx input[name='producerId'").val(),
                    producerName: $("input[name='producerName'").val(),
                    producerEmail: $("input[name='producerEmail'").val(),
                    producerPhone: $("input[name='producerPhone'").val(),
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
        $("#btn-saveProducer").trigger("click");
      } else if (event.originalEvent.submitter.innerText == "Delete") {
        $("#btn-deleteProducer").on("click", function () {
          $("#form-nsx button").attr("disabled", true);
          $.ajax({
            url: "/admin/producer/check",
            method: "POST",
            data: {
              producerId: $("#form-nsx input[name='producerId'").val(),
              producerName: $("input[name='producerName'").val(),
              producerEmail: $("input[name='producerEmail'").val(),
              producerPhone: $("input[name='producerPhone'").val(),
            },
            success: function (resultText) {
              // show Toast
              if (!resultText) {
                bootstrapToast(
                  "#toast-warning",
                  "Mã vừa nhập không có trông hệ thống",
                  1000
                );
                $("#form-nsx button").attr("disabled", false);
              } else {
                $.ajax({
                  url: "/admin/producer/delete",
                  method: "POST",
                  data: {
                    producerId: $("#form-nsx input[name='producerId'").val(),
                    producerName: $("input[name='producerName'").val(),
                    producerEmail: $("input[name='producerEmail'").val(),
                    producerPhone: $("input[name='producerPhone'").val(),
                  },
                  success: function (resultText) {
                    bootstrapToast(
                      "#toast-success",
                      "Bạn đã xóa thành công.",
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
        $("#btn-deleteProducer").trigger("click");
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
