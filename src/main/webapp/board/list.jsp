<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.BoardDTO" %>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	List boardList = (List) request.getAttribute("boardlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Board</title>
<script type="text/javascript">
	function checkForm(){
		if(${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}
		
		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>
</head>
<body>
	<jsp:include page="../junggadang/header.jsp" />
	<div class="jumbotron">
		<div class="container">
			<br>
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success"  style="color:black">전체 <%=total_record %>건</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성일</td>
						<td>조회</td>
						<td>글쓴이</td>
					</tr>
					<%
						for (int j = 0; j < boardList.size(); j++) {
							BoardDTO notice = (BoardDTO) boardList.get(j);						
					%>
					<tr>
						<td><%=notice.getNum() %></td>
						<td><a href="./BoardViewAction.do?num=<%=notice.getNum() %>&pageNum=<%=pageNum %>" style="color:black"><%=notice.getSubject() %></a></td>
						<td><%=notice.getRegist_day() %></td>
						<td><%=notice.getHit() %></td>
						<td><%=notice.getName() %></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum %>"/>
				<c:forEach var="i" begin="1" end="<%=total_page %>">
					<a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
						<c:choose>
							<c:when test="${pageNum==i }">
								<font color='4c5317'><b> [${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4c5317'> [${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>				
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
						<select name="items" class="txt">
							<option value="subject">제목에서</option>
							<option value="content">본문에서</option>
							<option value="name">글쓴이에서</option>							
						</select> <input name="text" type="text" /> <input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
						<td width="100%" align="right">						
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
						</td>
					</tr>
				</table>
			</div>			
		</form>
		<hr>
	</div>
	<jsp:include page="../junggadang/footer.jsp" />
</body>
</html>