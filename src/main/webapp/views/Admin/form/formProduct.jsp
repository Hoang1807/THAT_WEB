<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý sản phẩm</h1>
    <form action="">
        <form class="" action="/category/create" autocomplete="off">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="productId" class="form-label">Mã sản phẩm</label>
                    <input type="text" id="productId" class="form-control shadow-none" name="productId" value="">
                </div>
                <div class="col-sm-6">
                    <label for="productName" class="form-label">Tên sản phẩm</label>
                    <input type="text" id="productName" class="form-control shadow-none" name="productName" value="">
                </div>
                <div class="col-sm-4 col-6">
                    <label for="productQuantity" class="form-label">Số lượng</label>
                    <input type="number" id="productQuantity" class="form-control shadow-none" name="productQuantity"
                        value="">
                </div>
                <div class="col-sm-4 col-6">
                    <label for="productPrice" class="form-label">Giá</label>
                    <input type="number" id="productPrice" class="form-control shadow-none" name="productPrice"
                        value="">
                </div>
                <div class="col-sm-4">
                    <label for="category" class="form-label">Loại</label>
                    <select class="form-select" name="category" id="category">
                        <option value="1">CPU</option>
                        <option value="2">SSD</option>
                        <option value="3">HDD</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="specs" class="form-label">Thông số kỹ thuật</label>
                    <select name="specs" id="specs" multiple>
                        <option value="1">Dòng điện đầu vào: 9A</option>
                        <option value="2">Tần số đầu vào: 50 Hz - 60 Hz</option>
                    </select>
                </div>
                <div class="col-sm-6">
                    <label for="images" class="form-label">Ảnh</label>
                    <input type="file" id="images" name="images" class="form-control" multiple>
                </div>
            </div>
            <hr class="my-4">
            <div class="d-flex gap-2">
                <button class=" btn btn-success text-capitalize">Thêm</button>
                <button class="btn btn-warning text-capitalize" formaction="/category/update"
                    type="submit">Update</button>
                <button class="btn btn-danger text-capitalize" formaction="/category/delete"
                    type="submit">Delete</button>
                <button class="btn btn-primary text-capitalize" formaction="/category/index">Reset</button>
            </div>
        </form>
    </form>
    <div
        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h2>Section title</h2>
        <form class="input-group order-1 order-md-0" id="searchDataTable">
            <input type="text" id="search" class="form-control shadow-none" name="search" placeholder="Tìm kiếm">
            <button class="btn btn-sm btn-outline-secondary"> <i class="bi bi-search"></i></button>
        </form>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="dropdown me-2">
                <button type="button" data-bs-toggle="dropdown"
                    class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                    Số lượng
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Còn hàng</a></li>
                    <li><a class="dropdown-item" href="#">Hết hàng</a></li>
                </ul>
            </div>
            <div class="dropdown me-2">
                <button type="button" data-bs-toggle="dropdown"
                    class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                    Giá
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#">Tăng dần</a></li>
                    <li><a class="dropdown-item" href="#">Giảm dần</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="table-responsive small">
        <table id="tableDataProduct" class="table table-striped table-sm">
            <thead>
                <tr>
                    <th class="fw-bold align-middle text-center" scope="col">#</th>
                    <th class="fw-bold align-middle text-center" scope="col">Ảnh</th>
                    <th class="fw-bold align-middle text-center" scope="col">Mã</th>
                    <th class="fw-bold align-middle text-center" scope="col">Tên</th>
                    <th class="fw-bold align-middle text-center" scope="col">Giá</th>
                    <th class="fw-bold align-middle text-center" scope="col">NSX</th>
                    <th class="fw-bold align-middle text-center" scope="col">Số lượng</th>
                    <th class="fw-bold align-middle text-center" scope="col">Chỉnh</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="align-middle text-center">1</td>
                    <td class="align-middle text-center">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/%E0%B4%B5%E0%B4%BF%E0%B4%A4%E0%B5%8D%E0%B4%A4%E0%B5%81%E0%B4%95%E0%B4%BE%E0%B4%B3.JPG/1200px-%E0%B4%B5%E0%B4%BF%E0%B4%A4%E0%B5%8D%E0%B4%A4%E0%B5%81%E0%B4%95%E0%B4%BE%E0%B4%B3.JPG"
                            alt="" width="100px" class="p-2">
                    </td>
                    <td class="align-middle text-center">PS23306</td>
                    <td class="align-middle text-center">Dell 22035645465879</td>
                    <td class="align-middle text-center">10000</td>
                    <td class="align-middle text-center">DELL</td>
                    <td class="align-middle text-center">50</td>
                    <td class="align-middle text-center"><button class="btn btn-danger"><i
                                class="bi bi-pencil"></i></button></td>
                </tr>
            </tbody>
        </table>
    </div>