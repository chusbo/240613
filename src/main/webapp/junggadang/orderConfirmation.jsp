<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="java.net.URLDecoder"%>
<%@ page import="jung.Dessert" import="jung.DessertRepository" %>

<%
	request.setCharacterEncoding("utf-8");

	String cartId=session.getId();
	
	String shipping_cartId="";
	String shipping_name="";
	String shipping_shippingDate="";
	String shipping_country="";
	String shipping_zipCode="";
	String shipping_addressName="";
	
	Cookie[] cookies=request.getCookies();
	
	if (cookies!=null) {
		for (int i=0; i<cookies.length; i++) {
			Cookie thisCookie=cookies[i];
			String n=thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode=URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName=URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />

<meta charset="UTF-8">
<title>주문 정보</title>
</head>
<body>


		<%@ include file="header.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">주문정보</h1>
			</div>
		</div>
	<div class="container py-4">		
		<div class="row align-items-md-stretch alert alert-info">
			<div class="text-center">
				<h1>상세 주문정보</h1>
			</div>
			<div class="row justify-content-between">
				<div class="col-4" align="left">
					<Strong>배송주소</Strong> <br> 성명 : <% out.println(shipping_name); %><br>
					우편번호 : <% out.println(shipping_zipCode); %><br>
					주소 : <%out.println(shipping_addressName); %>(<%out.println(shipping_country); %><br>
				</div>
				<div class="col-4" align="right">
					<p><em>배송일: <% out.println(shipping_shippingDate); %></em>
				</div>
			</div>
			<div class="py-5">
				<table class="table table-hover">
				<tr>
					<th class="text-center">제과명</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum=0;
					ArrayList<Dessert> cartList=(ArrayList<Dessert>) session.getAttribute("cartlist");
					if (cartList==null)
						cartList=new ArrayList<Dessert>();
						for (int i=0; i < cartList.size(); i++) { //상품리스트 하나씩 출력하기
							Dessert dessert=cartList.get(i);
							int total=dessert.getPrice() * dessert.getQuantity();
							sum=sum + total;						
				%>
				<tr>
				<td class="text-center"><em><%=dessert.getName() %></em></td>
				<td class="text-center"><%=dessert.getQuantity() %></td>
				<td class="text-center"><%=dessert.getPrice() %>원</td>
				<td class="text-center"><%=total %>원</td>
				</tr>
				<%
					}
				%>
				<tr>
				<td> </td>
				<td> </td>
				<td class="text-right"><strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum %></strong>
				</td>
				</tr>
				</table>
				<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
				<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			</div>
		</div>
	</div>
</body>
</html>