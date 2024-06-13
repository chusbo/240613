<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	 	<%@ include file="header.jsp" %>
	 
	 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
	 	<div class="container-fluid py-5">
	 		<h1 class="alert alert-danger">해당 제품이 존재하지 않습니다.</h1>
	 	</div>	 
	 </div>
	 <div class="row align-items-md-stretch">
	 	<div class="col-md-12">
	 		<div class="h-100 p-5">
	 			<p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
	 			<p><a href="info.jsp" class="btn btn-secondary">제과목록 &raquo;</a>
	 		</div>
	 	</div>	 
	 </div>
	 <%@ include file="footer.jsp" %>

</body>
</html>