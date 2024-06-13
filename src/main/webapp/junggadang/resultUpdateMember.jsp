<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>수정완료</title>
</head>
<body>
		<%@ include file="header.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid  py-5">
				<h1 class="display-5 fw-bold">수정완료</h1>
			</div>
		</div>
	<div class="container py-4">
		<div class="row align-items-md-stretch">
			<h2 class="alert">회원정보 수정을 완료하였습니다.</h2>
		</div>
		<div class="container">
			<p><a href="./sell.jsp" class="btn btn-secondary">홈으로</a>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>