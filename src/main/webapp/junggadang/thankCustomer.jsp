<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>주문 완료</title>
</head>
<body>
	<%
		String shipping_cartId="";
		String shipping_name="";
		String shipping_shippingDate="";
		String shipping_country="";
		String shipping_zipCode="";
		String shipping_addressName="";
		
		Cookie[] cookies=request.getCookies();
		if (cookies!=null) {
			for (int i=0; i < cookies.length; i++) {
				Cookie thisCookie=cookies[i];
				String n=thisCookie.getName();
				if (n.equals("Shipping_cartId"))
					shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	

		<%@ include file="header.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid  py-5">
				<h1 class="display-5 fw-bold">주문완료</h1>
			</div>
		</div>
	<div class="container py-4">
		<div class="row align-items-md-stretch">
			<h2 class="alert alert-danger">주문해주셔서 감사합니다</h2>
			<p> 주문은<% out.println(shipping_shippingDate); %>에 배송될 예정입니다!
			<p> 주문번호 :<% out.println(shipping_cartId); %>
		</div>
		<div class="container">
			<p><a href="./sell.jsp" class="btn btn-secondary">홈으로</a>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
<%
	session.invalidate();
	
	for (int i=0; i < cookies.length; i++) {
		Cookie thisCookie=cookies[i];
		String n=thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				thisCookie.setMaxAge(0);
			if (n.equals("Shipping_name"))
				thisCookie.setMaxAge(0);
			if (n.equals("Shipping_shippingDate"))
				thisCookie.setMaxAge(0);
			if (n.equals("Shipping_country"))
				thisCookie.setMaxAge(0);
			if (n.equals("Shipping_zipCode"))
				thisCookie.setMaxAge(0);
			if (n.equals("Shipping_addressName"))
				thisCookie.setMaxAge(0);
				
			response.addCookie(thisCookie);
		}
%>