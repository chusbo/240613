<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id=request.getParameter("id");
		String password=request.getParameter("passwd");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		String birth=request.getParameter("birth");
		String mail=request.getParameter("mail");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
				
		java.text.SimpleDateFormat date = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String regist_day = date.format(new java.util.Date());		
	%>
	
	<sql:setDataSource var="dataSource"
		url="jdbc:mysql://localhost:3306/jungdb"
		driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
		
	<sql:update dataSource="${dataSource }" var="resultSet">
		insert into member(id, password, name, gender, birth, mail, phone, address, regist_day) values(?,?,?,?,?,?,?,?,?)
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=password %>"/>
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=gender %>"/>
		<sql:param value="<%=birth %>"/>
		<sql:param value="<%=mail %>"/>
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=address %>"/>
		<sql:param value="<%=regist_day %>"	/>
	</sql:update>
	<c:import var="url" url="resultAddMember.jsp" />
	${url }
</body>
</html>