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
        String password=request.getParameter("password");
        
        System.out.println("Session ID: " + id);
        System.out.println("Password: " + password);
    %>
    
    <sql:setDataSource var="dataSource"
        url="jdbc:mysql://localhost:3306/jungdb"
        driver="com.mysql.jdbc.Driver" user="root" password="1234"/>
        
    <sql:update dataSource="${dataSource}" var="resultSet">
        delete from member where id=? and password=?
        <sql:param value="<%=id %>"/>
        <sql:param value="<%=password %>"/>    
    </sql:update>

    <c:choose>
        <c:when test="${resultSet >= 1}">
            <%
                session.invalidate();
            %>
            <c:import url="./welcome.jsp" />
        </c:when>
        <c:otherwise>
            <% response.sendRedirect("./deleteMember.jsp?error=true"); %>
        </c:otherwise>
    </c:choose>
</body>
</html>
