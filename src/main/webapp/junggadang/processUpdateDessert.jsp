<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");

	String number=request.getParameter("number");
	String name=request.getParameter("name");
	String Price=request.getParameter("price");
	String category=request.getParameter("category");
	String Stock=request.getParameter("stock");
	String allergy=request.getParameter("allergy");
	String origin=request.getParameter("origin");
	String description=request.getParameter("description");
	String filename=request.getParameter("filename");
	String originfile=request.getParameter("originfile");
	
	Integer price;
	Integer stock;

	if (Price == null || Price.isEmpty()) {
	    price = 0;
	} else {
	    price = Integer.valueOf(Price);
	}

	if (Stock == null || Stock.isEmpty()) {
	    stock = 0;
	} else {
	    stock = Integer.valueOf(Stock);
	}
	
    if (filename == null || filename.isEmpty()) {
        filename = originfile;
    }
    
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="select * from dessert where number=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, number);
	rs=pstmt.executeQuery();
	
	if (rs.next()) {
		if (filename != null) {
			sql="update dessert set name=?, price=?, description=?, category=?, stock=?, filename=? where number=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setLong(5, stock);
			pstmt.setString(6, filename);
			pstmt.setString(7, number);
			pstmt.executeUpdate();
		} else {
			sql="update dessert set name=?, price=?, description=?, category=?, stock=? where number=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, category);
			pstmt.setLong(5, stock);
			pstmt.setString(6, number);
			pstmt.executeUpdate();
		}
	}
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("editDessert.jsp?edit=update");
%>
