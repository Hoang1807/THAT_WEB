<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h2 class="text-capitalize">Sản phẩm trong kho</h2>
        <form class="input-group order-1 order-md-0" action="/admin/statistical_two/search" id="searchDataTable" autocomplete="off" ng-init="search = '${search}'">
            <input type="text" id="search" class="form-control shadow-none" name="search" placeholder="Tìm kiếm">
            <button class="btn btn-sm btn-outline-secondary"><i class="bi bi-search"></i></button>
        </form>
    </div>
<div class="table-responsive small">
    <table class="table table-light border-danger table-bordered table-striped">
		<thead>
			<tr>
				<th scope="col">Mã</th>
				<th scope="col">Tên sản phẩm</th>
				<th scope="col">Nhà sản xuất</th>
				<th scope="col">Số lượng</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="i" items="${productInStore.content}">
				<tr>
					<th scope="row">${i.productId}</th>	
					<td>${i.productName}</td>
					<td scope="row">${i.producer.producerName}</td>	
					<td>${i.productQuantity}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
	<nav class="d-flex flex-column">
                <span class="m-auto mb-2">Page ${productInStore.number+1}/${productInStore.totalPages}</span>
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link ${productInStore.totalPages ==0?'disabled':''}" href="
                            /admin/statistical_two/search?page=0">&#8676</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${productInStore.totalPages ==0?'disabled':''}"
                            href="/admin/statistical_two/search?page=${productInStore.number<=0?productInStore.totalPages-1:productInStore.number-1}">&laquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${productInStore.totalPages ==0?'disabled':''}"
                            href="/admin/statistical_two/search?page=${productInStore.number>=productInStore.totalPages-1?0:productInStore.number+1}">&raquo;</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link ${productInStore.totalPages ==0?'disabled':''}"
                            href="/admin/statistical_two/search?page=${productInStore.totalPages-1}">&#8677</a>
                    </li>
                </ul>
            </nav>
