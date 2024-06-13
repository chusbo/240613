<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			<h1 class="display-5 fw-bold">로그인</h1>		
		</div>
	</div>
	
	<div class="row align-items-md-stretch text-center">
		<div class="row justify-content-center align-items-center">
			<div class="h-100 p-5 col-md-6">
				<%
				  String error=request.getParameter("error");
				  if (error !=null){
					  out.println("<div class='alert alert-danger'>");
					  out.println("아이디와 비밀번호를 확인해 주세요");
					  out.println("</div>");
				  }
				%>		
				<form class="form-signin" action="./login_process.jsp" method="post">		
				<div class="form-floating mb-3 row">
					<input type="text" class="form-control" name="id"
					required autofocus>
					<label for="floatingInput">ID</label>					
				</div>
				<div class="form-floating mb-3 row">
					<input type="password" class="form-control" name="passwd">
					<label for="floatingInput">Password</label>
				</div>			
				<div class="d-flex justify-content-between">
				<button class="btn btn-lg btn-success" type="submit">로그인</button>	
				<button class="btn btn-lg btn-success"><a href="./addMember.jsp">회원가입</a></button>					
<!--  					<c:choose>
						<c:when test="${empty sessionId }">
							<a class="btn btn-lg btn-success" href="<c:url value="./login_process.jsp" />">로그인</a>
							<a class="btn btn-lg btn-success" href="<c:url value="./addMember.jsp" />">회원가입</a>							
						</c:when>
						<c:otherwise>
							<li style="padding-top:7px; color:white">[<%=sessionId %>님]</li>
							<a class="btn btn-lg btn-danger" href="<c:url value="./logout_process.jsp" />">로그아웃</a>
							<a class="btn btn-lg btn-warning" href="<c:url value="./updateMember.jsp" />">회원수정</a>
						</c:otherwise>
					</c:choose>			-->	
				</div>
				</form>
			</div>
		</div>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>
