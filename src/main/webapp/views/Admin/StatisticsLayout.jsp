<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/MultipleSelect.css">
</head>
<body>
	 <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link ${TabReport=='1'?'active':''}" onclick="location.href=window.location.href.split('?')[0]+'?TabReport=1'" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane"
                    type="button" role="tab" aria-controls="home-tab-pane" >Best selling product</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link ${TabReport=='2'?'active':''}" onclick="location.href=window.location.href.split('?')[0]+'?TabReport=2'" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane"
                    type="button" role="tab" aria-controls="profile-tab-pane" >Store revenue</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link ${TabReport=='3'?'active':''}" onclick="location.href=window.location.href.split('?')[0]+'?TabReport=3'" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane"
                    type="button" role="tab" aria-controls="contact-tab-pane" >Product statistics</button>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade ${TabReport=='1'?'show active':''}" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab"tabindex="1">
                <%@include file="BestSell.jsp" %>
            </div>
            <div class="tab-pane fade ${TabReport=='2'?'show active':''}" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="2">
                <%@include file="StoreRevenue.jsp" %>
            </div>
            <div class="tab-pane fade ${TabReport=='3'?'show active':''}" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="3">
                <%@include file="ProductStatistics.jsp" %>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
</body>
</html>