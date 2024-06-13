<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="header.jsp" %>
	
	 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
	 	<div class="container-fluid py-5">
	 		<h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
	 	</div>	 
	 </div>
	 <div class="row align-items-md-stretch">
	 	<div class="col-md-12">
	 		<div class="h-100 p-5">
				<p><%=request.getRequestURL() %></p>
				<p><a href="sell.jsp" class="btn btn-secondary">제과목록 &raquo;</a>
			</div>
		</div>			
	</div>

</body>
</html>