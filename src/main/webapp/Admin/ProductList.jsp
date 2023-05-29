<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body class="bg-body-secondary">
	<jsp:include page="../Admin/header.jsp"></jsp:include>
<main>
        <div class="container border border-3 mt-5 bg-light-subtle p-0 rounded-4 shadow">
            <form class="p-5">
                <legend>Manager Product</legend>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div id="carouselExampleIndicators" class="carousel slide">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                    class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                    aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                    aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="https://i3.ytimg.com/vi/"
                                        class="d-block w-100 img-fluid" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://product.hstatic.net/200000420363/product/i3-10th_931d647ca3794d73b3cf1002f910d3e1_master.jpg"
                                        class="d-block w-100 img-fluid" alt="...">
                                </div>
                                <div class="carousel-item">
                                    <img src="https://product.hstatic.net/200000420363/product/i3-10th_a8ba4f1a505f41b8a0c1298104f162a8_master.jpg"
                                        class="d-block w-100 img-fluid" alt="...">
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button"
                                data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button"
                                data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Choose</label>
                            <input type="file" class="form-control" id="exampleInputPassword1">
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">ID Product</label>
                            <input type="text" disabled class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <div class="row">
                                <div class="col-9 mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Product Name</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="col-3">
                                    <label for="exampleInputPassword1" class="form-label">Quantity</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1">
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Product Email</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Product Phonenumber</label>
                            <input type="number" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Producer</label>
                            <input type="text" class="form-control" id="exampleInputPassword1">
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Specification</label>
                            <select class="form-select" name="spec" id="spec" multiple aria-label="Default select example">
                                <option value="0">Open this select menu</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end ">
                    <button type="submit" class="btn btn-success ms-2 rounded-3">save</button>
                    <button type="submit" class="btn btn-danger ms-2 rounded-3">delete</button>
                </div>
            </form>
        </div>
        <div
            class="container border border-3 mt-5 bg-light-subtle p-3 rounded-4 shadow table-responsive table-responsive-sm table-responsive-md table-responsive-lg">
            <div><a href="ProductAdd.html" class="btn btn-success rounded-pill"><i class="bi bi-plus"></i>ADD</a></div>
            <hr>
            <span>(3)Records Found</span>
            <table class="table table-bordered border-3 text-black">
                <thead>
                    <tr>
                        <th style="width: 10%;" scope="col">Image</th>
                        <th scope="col">ID Product</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Product Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Producer</th>
                        <th scope="col">Edit</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">
                            <img class="img-thumbnail w-100"
                                src="https://product.hstatic.net/200000420363/product/1_cf780ffbe8024e66910638f844b7acd3_large.jpg"
                                alt="">
                        </th>
                        <td>Otto</td>
                        <td>Otto</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>Otto</td>
                        <td><button class="rounded-pill border-0"><i class="bi bi-pencil-fill"></i></button></td>
                    </tr>
                    <tr>
                        <th scope="row"><img class="img-thumbnail w-100"
                                src="https://product.hstatic.net/200000420363/product/1_c07a1f4049214638935a5168913867f8_large.jpg"
                                alt=""></th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>Otto</td>
                        <td><button class="rounded-pill border-0"><i class="bi bi-pencil-fill"></i></button></td>
                    </tr>
                    <tr>
                        <th scope="row"><img class="img-thumbnail w-100"
                                src="https://product.hstatic.net/200000420363/product/gskill-8g-3200-aegis_de49d0bed72140f39fd12378b9a2fd60_large.jpg"
                                alt=""></th>
                        <td>Larry the Bird</td>
                        <td>@twitter</td>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>Otto</td>
                        <td><button class="rounded-pill border-0"><i class="bi bi-pencil-fill"></i></button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script src="/js/MultipleSelect.js"></script>
</body>
</html>