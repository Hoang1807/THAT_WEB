// create Multiselect for specs Product
if ($("#specs").length > 0) {
  new MultiSelectTag("specs");
}
//
function loadFiles(event) {
  $('#carousel-cell').empty();
  var files = event.target.files;
  var output = document.getElementById('carousel-cell');
  for (var i = 0; i < files.length; i++) {
    var file = files[i];
    var imageUrl = URL.createObjectURL(file);
    var img = document.createElement('img');
    img.src = imageUrl;
    img.setAttribute('class', 'anhyeu me-1');
    img.alt = 'Preview Image';
    img.width = '200';
    img.height = '200';
    output.append(img)
  }
}
function editProduct(id){
  $('input#productId').val(id).reload();
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
                  $("#btn-update-spec").on("click", function () {
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

  // submit form producer
  $("#form-nsx").on("submit", function (event) {
    event.preventDefault();
    if ($(this).valid()) {
      if (event.originalEvent.submitter.innerText == "Lưu") {
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
                $("#btn-update-cate").on("click", function () {
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
                  error: function (jqXHR, textStatus) { },
                });
              }
            },
          });
        });
        $("#btn-saveProducer").trigger("click");
      } else if (event.originalEvent.submitter.innerText == "Xóa") {
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
//submit form product
$("#form-product").on("submit", function (event) {
  event.preventDefault();
  //   ajax create form spec
  if (event.originalEvent.submitter.innerText == "Add") {
    $("#addPro").on("click", function () {
      $("#form-product button").attr("disabled", true);
      $.ajax({
        url: "/admin/manager-product/create",
        method: "POST",
        data: {
          productId: $("input[name='productId']").val(),
          category: $("select[name='category']").val(),
          producer: $("select[name='producer']").val(),
          productName: $("input[name='productName']").val(),
          productQuantity: $("input[name='productQuantity']").val(),
          productPrice: $("input[name='productPrice']").val(),
          specs: $("select[name='specs']").val(),
          
        },
        success: function (resultText) {
          console.log(productId)
          console.log(category)
          console.log(producer)
          console.log(productName)
          console.log(productQuantity)
          console.log(productPrice)
          console.log(specs)

          bootstrapToast(
            "#toast-success",
            "Bạn đã thêm thành công.",
            2000
          )
          }
        }
      )}
  )}
});
