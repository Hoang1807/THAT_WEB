<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/MultipleSelect.css">
</head>
<body class="bg-body-secondary">
	<jsp:include page="../Admin/header.jsp"></jsp:include>
	<main>
        <div class="container border border-3 mt-5 bg-light-subtle p-0 rounded-4 shadow ">
            <p class="fs-3"></p>
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12 ms-3" style="height: auto;">
                    <form class="border border-3 p-5">
                        <legend>Manager Specification</legend>
                        <div class="row">
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">ID Bill</label>
                                <input type="text" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">ID Product</label>
                                <input type="text" class="form-control" id="exampleInputPassword1">
                            </div>
                            <div class="row">
                                <div class="col-lg-9 col-md-12 col-sm-12 mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Product Name</label>
                                    <input type="text" class="form-control" id="exampleInputPassword1">
                                </div>
                                <div class="col-lg-3 col-md-12 col-sm-12">
                                    <label for="exampleInputPassword1" class="form-label">Count</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1">
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">Price</label>
                                <input type="number" class="form-control" id="exampleInputPassword1">
                            </div>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-end">
                            <button type="submit" class="btn btn-primary me-3">|<-</button>
                            <button type="submit" class="btn btn-primary">->|</button>
                        </div>
                    </form>
                </div>
                <div class="col-lg-5 col-md-12 col-sm-12  ms-3 table-responsive table-responsive-sm table-responsive-md table-responsive-lg">
                    <span>(3)Records Found</span>
                    <table class="table table-bordered border-3 text-black">
                        <thead>
                            <tr>
                                <th scope="col">ID Bill</th>
                                <th scope="col">Product name</th>
                                <th scope="col">Price</th>
                                <th scope="col">More</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td><button><i class="bi bi-three-dots"></i></button></td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td><button><i class="bi bi-three-dots"></i></button></td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry the Bird</td>
                                <td>@twitter</td>
                                <td><button><i class="bi bi-three-dots"></i></button></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td>
                                    <div>
                                        <span>Amount bill: </span>
                                    </div>
                                </td>
                                <td colspan="3"><p>$20000</p></td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script type="/js/MultipleSelect.js"></script>
</body>
</html>