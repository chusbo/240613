<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>디저트편집</title>
<script type="text/javascript">
	function deleteConfirm(number) {
		if(confirm("해당 제품을 삭제합니다!") == true)
			location.href="./deleteDessert.jsp?number=" + number;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>

	<%@ include file="header.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">디저트편집</h1>
		</div>
	</div>
	
	<%@ include file="dbconn.jsp" %>
	
	<div class="row align-items-md-stretch text-center">
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from dessert";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		%>
	
		<div class="col-md-4">
			<div class="h-100 p-2 rounded-3">
				<img src="../resources/images/<%= rs.getString("filename") %>" style="width:70%" />
				<h5><b><%= rs.getString("name") %></b></h5>
				<p><%= rs.getString("description") %></p>
				<p><%= rs.getString("price") %></p>
				<%
					if (edit.equals("update")) {
				%>
					<a href="./updateDessert.jsp?id=<%= rs.getString("number") %>" class="btn btn-success" role="button">수정</a>
				<%
					} else if (edit.equals("delete")) {
				%>
					<a href="#" onclick="deleteConfirm('<%= rs.getString("number") %>')" class="btn btn-danger" role="button">삭제</a>
				<%
					}
				%>
			</div>
		</div>
		<%
			}
			if (rs != null) 
				rs.close();
			if (pstmt != null) 
				pstmt.close();
			if (conn != null) 
				conn.close();
		%>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>