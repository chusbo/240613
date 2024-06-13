<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>디저트 수정</title>
</head>
<body>

	<%@ include file="header.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">디저트 수정</h1>
		</div>
	</div>	
	<%@ include file="dbconn.jsp" %>
	
	<%
		
		String number=request.getParameter("id");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from dessert where number=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, number);
		rs=pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="row align-items-md-stretch">
		<div class="col-md-5">
			<img src="../resources/images/<%=rs.getString("filename")%>" style="width:70%"> 
		</div>
		<div class="col-md-7">
			<form name="newDessert" action="./processUpdateDessert.jsp" method="post">
			<div class="mb-3 row">
				<label class="col-sm-2">제품번호</label>
				<div class="col-sm-5">
					<input type="text" name="number" id="number" class="form-control" value='<%=rs.getString("number") %>' >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">제과명</label>
				<div class="col-sm-5">
					<input type="text" name="name" id="name" class="form-control" value='<%=rs.getString("name") %>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-5">
					<input type="text" name="price" id="price" class="form-control" value='<%=rs.getString("price") %>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2" class="form-control" placeholder="100자 이하로 적어주세요"><%=rs.getString("description")%></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">분류</label>
				<div class="col-sm-5">
    				<select id="category" name="category" class="form-control">
   					    <option <%= rs.getString("category").equals("Dessert") ? "selected" : "" %>>Dessert</option>
						<option <%= rs.getString("category").equals("Drink") ? "selected" : "" %>>Drink</option>
        				<option <%= rs.getString("category").equals("Cake") ? "selected" : "" %>>Cake</option>
        				<option <%= rs.getString("category").equals("Gift") ? "selected" : "" %>>Gift</option>
    				</select>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">재고</label>
				<div class="col-sm-5">
					<input type="text" name="stock" id="stock" class="form-control" value='<%=rs.getString("stock") %>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="filename" id="filename" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
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
	</div>		
<%@ include file="footer.jsp" %>
</body>
</html>