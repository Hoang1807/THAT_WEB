<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<table class="table">
    <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Sản phẩm</th>
            <th scope="col">Giá</th>
            <th scope="col">Sốt Lượng</th>
            <th scope="col">Tổng</th>
            <th scope="col">Xóa</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="item" items="${cart.items}">
            <tr>
                <td class="col-sm-8 col-md-1">
                    <strong>${item.id}</strong>
                </td>
                <td class="col-3 text-left">
                    <strong class="text-danger">${item.productName}</strong>
                </td>
                <td class="col-2">
                    <strong>${item.productPrice}</strong>
                </td>
                <td class="col-1 text-center">
                    <input type="number" value="${ item.productQuantity }" class="form-control">
                </td>
                <td class="col-3 text-center">
                    <strong>${item.productPrice * item.productQuantity}</strong>
                </td>
                <td class="col-1">
                    <a href="/cart/remove/?prid=${pro.productId}" class="btn btn-danger"> Remove </a>
                </td>
            </tr>
        </c:forEach>
        <!-- <tr>
            <th scope="row">1</th>
            <td><img src="#"/></td>
            <td class="text-break">jjdkfjkajdfkjn n ansdfjklnakjdnkjndkjf</td>
            <td>2.400.000</td>
            <td class="quantity"><input type="number"/></td>
            <td>2.400.000</td>
            <td><a href="#">Delete</a></td>
        </tr>
        <tr>
                <th scope="row">2</th>
            <td><img src="#"/></td>
            <td class="text-break">jjdkfjkajdfkjn n ansdfjklnakjdnkjndkjf</td>
            <td>2.400.000</td>
            <td class="quantity"><input type="number"/></td>
            <td>2.400.000</td>
            <td><a href="#">Delete</a></td>
        </tr>
        <tr>
            <th scope="row">3</th>
            <td><img src="#"/></td>
            <td class="text-break">jjdkfjkajdfkjn n ansdfjklnakjdnkjndkjf</td>
            <td>2.400.000</td>
            <td class="quantity"><input type="number"/></td>
            <td>2.400.000</td>
            <td><a href="#">Delete</a></td>
        </tr> -->
    </tbody>
</table>