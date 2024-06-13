<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.div1
	{text-align:center;}
	.div1 a
	{text-decoration:none; color:gray;}	
	.div1 a:hover
	{color:black; transition: .3s ease-in-out}
	.div2
	{text-align:center;}	
	.images
	{width:600px;
	-webkit-filter: blur(3px);
	filter: blur(3px);
	border-radius:10px;}
	.images:hover
	
	{-webkit-filter: blur(0);
	filter: blur(0);
	-webkit-transition: .3s ease-in-out;
	transition: .3s ease-in-out;}
	
</style>
<title>정가당</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<div class="div1">
		<br>
		<h1><b>정가당</b></h1>
		<br>
		
		<a href="./sell.jsp"><img src="../resources/images/join.jpg" class="images"><h1>입장하기</h1></a>
	</div>
	<hr>
	<div class="div2">
	<h5 class="c">구움과자전문점 정가당</h5>
	<%
		Date day = new java.util.Date();
		String am_pm;
		int hour = day.getHours();
		int minute = day.getMinutes();
		int second = day.getSeconds();
		if(hour / 12 == 0){
			am_pm = "AM";
		} else {
			am_pm = "PM";
			hour = hour - 12;
		}
		String CT = hour + ":" + minute + ":" + second + "" + am_pm;
		out.println("현재 접속 시간: " + CT + "\n");
		%>
	</div>	
	
	
	<%@ include file="footer.jsp" %>
</body>
</html>