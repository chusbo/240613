<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jung.Dessert" import="jung.DessertRepository" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript" src="../resources/js/validation.js"></script>
<style>
.all
{margin:10px; padding:20px; box-shadow: 5px 5px 10px #ccc, inset -5px -5px 20px #fff;}
</style>

<title>제과 등록</title>
</head>
<body>
	<%@ include file = "header.jsp" %>

	<div class = "p-5 mb-4 bg-body-teritary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">제품등록</h1>						
		</div>
		  	<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>          
        </div>
<div class="all">       
	<div class="row align-items-md-stretch">
		<form name="newDessert" action="./processAddDessert.jsp" class="form-horizontal" method="post" encType="multipart/form-data">			
			<div class="mb-3 row">
				<label class="col-sm-2">제품 번호</label>
				<div class="col-sm-3">
					<input type="text" id="number" name="number" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">제과명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-3">
					<select id="category" name="category" class="form-control">
						<option>Dessert</option>
						<option>Drink</option>
						<option>Cake</option>
						<option>Gift</option>
					</select>
					<!-- <input type="text" id="category" name="category" class="form-control">-->
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">알르레기</label>
				<div class="col-sm-3">
					<input type="text" id="allergy" name="allergy" class="form-control">
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2">원산지</label>
				<div class="col-sm-3">
					<input type="text" id="origin" name="origin" class="form-control">
				</div>				
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">재고</label>
				<div class="col-sm-3">
					<input type="text" id="stock" name="stock" class="form-control">
				</div>
			</div>
			<div class ="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2"
					class="form-control" placeholder="100자 이하 적어주세요"></textarea>
				</div>
			</div>

	        <div class="mb-3 row">
                <label class="col-sm-2">파일</label>
                <div class="col-sm-5">
                    <input type="file" name="filename" class="form-control">                    
            	</div>
            </div>            

			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddBook()">
				</div>
			</div>
		</form>
	</div>
</div>
<br>
<br>
	<%@ include file="footer.jsp"%>
</body>
</html>