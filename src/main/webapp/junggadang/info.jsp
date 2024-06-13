<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page errorPage="exceptionNoName.jsp" %>


<%
request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
	<style>
	img
	{width:100%; height:100%; border-radius:10px;}
	.all
	{margin:10px; padding:20px; box-shadow: 5px 5px 10px #ccc, inset -5px -5px 20px #fff; border-radius:10px;}
	</style>
<meta charset="UTF-8">
<title>상세 정보</title>
	<script type="text/javascript">
		function addToCart(){
			if (confirm("장바구니에 추가하시겠습니까?")) {
				document.addForm.submit();
				console.log();
			} else {
				document.addForm.reset();
			}
		}
	</script>
</head>
<body>
		<%@ include file="header.jsp" %>		
	<div class="row align-items-md-stretch text-center">
		<%@ include file="dbconn.jsp"%>		

			<div class="p-5 mb-4 bg-body-tertiary rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">제품정보</h1>
				</div>
			</div>

			<%
				String number = request.getParameter("number");
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from dessert where number=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, number);
				rs = pstmt.executeQuery();
				if (rs.next()) {
			%>
		<div class="all">
			<div class="row align-items-md-stretch">
				<div class="imgbox col-md-6">
						<img src="../resources/images/<%=rs.getString("filename")%> " style="width:70%">
					</div>
				<div class="col-md-6">
					<h3><b><%=rs.getString("name")%></b></h3>
					<p><%=rs.getString("description")%></p>
					<p><b>제품번호</b> :<%=rs.getString("number") %>
					<p><b>분류</b> :<%=rs.getString("category") %>
					<p><b>재고</b> :<%=rs.getString("stock")%>
					<p><b>알레르기</b> :<%=rs.getString("allergy") %>
					<p><b>원산지</b> :<%=rs.getString("origin") %>				
					<p><b>가격</b> :<%=rs.getString("price") %>원</p>
					<p><form name="addForm" action="./addCart.jsp?number=<%=rs.getString("number") %>" method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">주문하기</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니</a> 
						<a href="./sell.jsp" class="btn btn-secondary">돌아가기</a>
						</form>
				</div>
			<%
			}
			if (rs!=null)
				rs.close();
			if (pstmt!=null)
				pstmt.close();
			if (conn!=null)
				conn.close();
			%>			
			<br>
		</div>
	</div>
</div>
	<%@ include file="footer.jsp"%>
</body>
</html>