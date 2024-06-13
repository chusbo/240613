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
<script type="text/javascript" src="../resources/js/updateValidation.js"></script>
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
			<h1 class="display-5 fw-bold">회원가입</h1>					
		</div>
	</div>
<div class="all">       
	<div class="row align-items-md-stretch">
		<form name="newMember" action="./processAddMember.jsp" class="form-horizontal" method="post">			
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input type="text" id="id" name="id" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" id="passwd" name="passwd" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-3">
					<select id="gender" name="gender" class="form-control">
						<option>남성</option>
						<option>여성</option>
					</select>					
				</div>
			</div>	
			<div class="mb-3 row">
				<label class="col-sm-2">생년월일</label>
				<div class="col-sm-3">
					<input type="date" id="birth" name="birth" class="form-control">
				</div>				
			</div>			
			<div class="mb-3 row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="email" id="mail" name="mail" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="tel" id="phone" name="phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" class="form-control">
				</div>
			</div>
			<div class ="mb-3 row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" id="address" name="address" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="가입하기" onclick="CheckUpdate()">
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