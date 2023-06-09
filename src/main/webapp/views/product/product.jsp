<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

      <!DOCTYPE html>
      <html>

      <head>
        
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
          crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/css/bootstrap.min.css">
        <link rel="stylesheet" href="/css/flickity.css">
        <link rel="stylesheet" href="/css/style.css">
        <link rel="stylesheet" href="/css/product.css">
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js">
        <title>Insert title here</title>
      </head>

      <body>
        <jsp:include page="../layout/_header.jsp"></jsp:include>
        <div class="container mt-2 w-100">
          <div class="content">
            <div class="row justify-content-start">
              <div class="col-2 filter">
                <span><Strong>Bộ lọc</Strong></span>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <span><Strong>Hãng sãn xuất</Strong></span>
              </div>
              <div class="row d-flex column-gap-2">
                <div class="col-3 col-lg-2">
                  <input type="radio" class="btn-check btn-size col-3 col-lg-2" value="12312"> <label
                    class="btn btn-outline-dark btn-size col-3 col-lg-2" for="12312">Hình
                    hãng</label>
                </div>
              </div>
            </div>
            <div class="w-100 mt-2">
              <div class="sp_all float-start">
                <h5>Tổng số lượng sản phẩm</h5>
              </div>
              <div class="sp_order float-end">
                <select name="" id="">
                  <option value="">Sắp xếp theo</option>
                </select>
              </div>
            </div>
          </div>
          <br>
          <hr>
          <div class="product-list_item">
            <div class="row mt-2 p-1 pe-5 ps-5 w-auto ">
              <c:forEach var="item" items="${items.content}">
                <div class="col-12 col-sm-12 col-md-6 col-lg-4 col-xl-3 col-xxl-2 product">
                  <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
                    <div class="card-img">
                      <img class="card-img "
                        src="https://res.cloudinary.com/dz9gzy7iz/image/upload/v1686224214/okk/kho.jpg" alt=""
                        >
                    </div>
                    <div class="card-body mx-auto mt-2">
                      <div class="loopName text-center ">
                        <span><a href="">${item.productName}</a></span>
                      </div>
                      <div class="">
                        <div class="loopPrice text-center">
                          <span>
                            <fmt:formatNumber>${item.productPrice}</fmt:formatNumber>đ
                          </span>
                        </div>
                        <div class="text-center">
                          <a class="btn button btn-link" href="/product/detail?id=${item.productId}">
                            <i class="bi bi-eye"></i>
                          </a>
                          <button class="btn button btn-link">
                            <i class="bi bi-cart"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
          <br>
          <hr>
          <div class="row justify-content-end">
            <div class="col-3">
              <a class="btn" href="/laptop/product?page=0"><i class="bi bi-chevron-double-left"></i></a>
              <a class="btn" href="/laptop/product?page=${items.number - 1}"><i class="bi bi-chevron-left"></i></a>
              <a class="btn" href="/laptop/product?page=${items.number + 1}"><i class="bi bi-chevron-right"></i></a>
              <a class="btn" href="/laptop/product?page=${items.totalPages - 1}"><i
                  class="bi bi-chevron-double-right"></i></a>
            </div>
          </div>
        </div>
        <jsp:include page="../layout/_footer.jsp"></jsp:include>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
          integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
          </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
          integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
          </script>
      </body>

      </html>