<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" import="jung.Dessert" import="jung.DessertRepository" %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%
	String cartId=session.getId();
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%@ include file="header.jsp" %>
		
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">장바구니</h1>
			</div>
		</div>	
	
	<div class="container py-4">
		<div class="row align-items-md-stretch">
			<div class="row">
				<table width="100%">
					<tr>
						<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>"
									class="btn btn-danger">삭제하기</a></td>
						<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId %>"
									class="btn btn-success">주문하기</a></td>						
					</tr>
				</table>
			</div>
			<div style="padding-top:50px">
			<table class="table table-hover">
				<tr>
					<th>제과명</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					int sum=0;
					ArrayList<Dessert> cartList=(ArrayList<Dessert>) session.getAttribute("cartlist");
					if (cartList==null)
					cartList=new ArrayList<Dessert>();
					for (int i=0; i <cartList.size(); i++) {
					Dessert dessert=cartList.get(i);
					int total=dessert.getPrice() * dessert.getQuantity();
					sum=sum + total;
				%>
					<tr>
						<td><%=dessert.getNumber() %> - <%=dessert.getName() %></td>
						<td><%=dessert.getPrice() %></td>
						<td><%=dessert.getQuantity() %></td>
						<td><%=total %></td>
						<td><a href="./removeCart.jsp?id=<%=dessert.getNumber() %>" class="badge text-bg-danger">삭제</a></td>
					</tr>
				<%
					}
				%>
					<tr>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum %></th>
						<th></th>
					</tr>					
			</table>
		<a href="./sell.jsp" class="btn btn-secondary">쇼핑 계속하기</a>
		</div>
	</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>