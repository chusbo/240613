<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%	
//	String id = (String)session.getAttribute("sessionId");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
    
    String url = "jdbc:mysql://localhost:3306/jungdb";    
    String userid = "root";
    String userpw = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {   
    	Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, userid, userpw);
        
        String query = "select * from member where id=? and password=?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, id);
        pstmt.setString(2, passwd);
        rs = pstmt.executeQuery();

        if (rs.next()) {       
        	session.setAttribute("sessionId", id);
            response.sendRedirect("sell.jsp");
        } else {            
            response.sendRedirect("loginMember.jsp?error=true");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
