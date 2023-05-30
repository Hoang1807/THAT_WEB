<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
    integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

  <link rel="stylesheet" href="/css/product.css">
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
            <input type="radio" class="btn-check btn-size col-3 col-lg-2" value="12312">
            <label class="btn btn-outline-dark btn-size col-3 col-lg-2" for="12312">Hình hãng</label>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <span><Strong>Loại</Strong></span>
        </div>
        <div class="row d-flex column-gap-2">
          <div class="col-3 col-lg-2">
            <input type="radio" class="btn-check btn-size col-3 col-lg-2" value="12312">
            <label class="btn btn-outline-dark btn-size col-3 col-lg-2" for="12312">Tên loại</label>
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
      <div class="row mt-2 p-1 pe-5 ps-5">
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2 col-xxl-2 product">
          <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
            <div class="card-img-top">
                <img class="card-img" src="./image/product/1.jpg" alt="" >
            </div>
            <div class="card-body mx-auto">
              <div class="loopName">
                <span><a href="">Laptop Gaming Gigabyte A5 K1 AVN1030SB R5 5600H | 8GB | 512GB | RTX 3060 6GB | 15.6" FHD | Win11 (Black)</a></span>
              </div>
              <div class="">
                <div class="loopPrice text-center">
                  <span>19,000,000đ</span>
                </div>
                <div class="text-center">
                  <button class="btn button"><i class="bi bi-eye"></i></button>
                  <button class="btn button"><i class="bi bi-cart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2 col-xxl-2 product">
          <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
            <div class="card-img-top">
                <img class="card-img" src="./image/product/1.jpg" alt="" >
            </div>
            <div class="card-body mx-auto">
              <div class="loopName">
                <span><a href="">Laptop Gaming Gigabyte A5 K1 AVN1030SB R5 5600H | 8GB | 512GB | RTX 3060 6GB | 15.6" FHD | Win11 (Black)</a></span>
              </div>
              <div class="">
                <div class="loopPrice text-center">
                  <span>19,000,000đ</span>
                </div>
                <div class="text-center">
                  <button class="btn button"><i class="bi bi-eye"></i></button>
                  <button class="btn button"><i class="bi bi-cart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2 col-xxl-2 product">
          <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
            <div class="card-img-top">
                <img class="card-img" src="./image/product/1.jpg" alt="" >
            </div>
            <div class="card-body mx-auto">
              <div class="loopName">
                <span><a href="">Laptop Gaming Gigabyte A5 K1 AVN1030SB R5 5600H | 8GB | 512GB | RTX 3060 6GB | 15.6" FHD | Win11 (Black)</a></span>
              </div>
              <div class="">
                <div class="loopPrice text-center">
                  <span>19,000,000đ</span>
                </div>
                <div class="text-center">
                  <button class="btn button"><i class="bi bi-eye"></i></button>
                  <button class="btn button"><i class="bi bi-cart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2 col-xxl-2 product">
          <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
            <div class="card-img-top">
                <img class="card-img" src="./image/product/1.jpg" alt="" >
            </div>
            <div class="card-body mx-auto">
              <div class="loopName">
                <span><a href="">Laptop Gaming Gigabyte A5 K1 AVN1030SB R5 5600H | 8GB | 512GB | RTX 3060 6GB | 15.6" FHD | Win11 (Black)</a></span>
              </div>
              <div class="">
                <div class="loopPrice text-center">
                  <span>19,000,000đ</span>
                </div>
                <div class="text-center">
                  <button class="btn button"><i class="bi bi-eye"></i></button>
                  <button class="btn button"><i class="bi bi-cart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2 col-xxl-2 product">
          <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
            <div class="card-img-top">
                <img class="card-img" src="./image/product/1.jpg" alt="" >
            </div>
            <div class="card-body mx-auto">
              <div class="loopName">
                <span><a href="">Laptop Gaming Gigabyte A5 K1 AVN1030SB R5 5600H | 8GB | 512GB | RTX 3060 6GB | 15.6" FHD | Win11 (Black)</a></span>
              </div>
              <div class="">
                <div class="loopPrice text-center">
                  <span>19,000,000đ</span>
                </div>
                <div class="text-center">
                  <button class="btn button"><i class="bi bi-eye"></i></button>
                  <button class="btn button"><i class="bi bi-cart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-6 col-sm-6 col-md-4 col-lg-4 col-xl-2 col-xxl-2 product">
          <div class="card mx-auto border-0 rounded-0 h-auto  position-relative">
            <div class="card-img-top">
                <img class="card-img" src="./image/product/1.jpg" alt="" >
            </div>
            <div class="card-body mx-auto">
              <div class="loopName">
                <span><a href="">Laptop Gaming Gigabyte A5 K1 AVN1030SB R5 5600H | 8GB | 512GB | RTX 3060 6GB | 15.6" FHD | Win11 (Black)</a></span>
              </div>
              <div class="">
                <div class="loopPrice text-center">
                  <span>19,000,000đ</span>
                </div>
                <div class="text-center">
                  <button class="btn button"><i class="bi bi-eye"></i></button>
                  <button class="btn button"><i class="bi bi-cart"></i></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br>
    <hr>
  </div>
  <jsp:include page="../layout/_footer.jsp"></jsp:include>
</body>
</html>