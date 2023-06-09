<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <h1 class="h2 pt-3 pb-2 mb-3 border-bottom text-capitalize">Quản lý loại</h1>
        <form id="form-loai" method="POST" autocomplete="off">
            <div class="row g-3">
                <div class="col-sm-6">
                    <label for="categoryId" class="form-label">Mã loại</label>
                    <input type="text" id="categoryId" class="form-control shadow-none" name="categoryId" value="">
                </div>
                <div class="col-sm-6">
                    <label for="categoryName" class="form-label">Tên loại</label>
                    <input type="text" id="categoryName" class="form-control shadow-none" name="categoryName" value="">
                </div>
            </div>

            <hr class="my-4">
            <div class="d-flex gap-2">
                <button class="btn btn-success text-capitalize" id="btn-addCategory">Add</button>
                <button class="btn btn-danger text-capitalize" id="btn-delCategory">Delete</button>
                <button class="btn btn-primary text-capitalize" formaction="/category/index">Reset</button>
            </div>
        </form>

        <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h2 class="text-capitalize">Danh sách loại</h2>
            <form class="input-group order-1 order-md-0" id="searchDataTable">
                <input type="text" id="search" class="form-control shadow-none" name="search" placeholder="Tìm kiếm">
                <button class="btn btn-sm btn-outline-secondary"> <i class="bi bi-search"></i></button>
            </form>
            <div class="btn-toolbar mb-2 mb-md-0">
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Mã
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Tăng dần</a></li>
                        <li><a class="dropdown-item" href="#">Giảm dần</a></li>
                    </ul>
                </div>
                <div class="dropdown me-2">
                    <button type="button" data-bs-toggle="dropdown"
                        class="btn btn-sm btn-outline-secondary dropdown-toggle d-flex align-items-center gap-1">
                        Tên
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
                        <th class="fw-bold align-middle text-center" scope="col">Mã loại</th>
                        <th class="fw-bold align-middle text-center" scope="col">Tên loại</th>
                        <th class="" scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${listCate}" varStatus="loop">
                        <tr>
                            <td class="align-middle text-center">${loop.index}</td>
                            <td class="align-middle text-center">${item.categoryId}</td>
                            <td class="align-middle text-center">${item.categoryName}</td>
                            <td class="align-middle text-center">
                                <button class="btn btn-danger">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>