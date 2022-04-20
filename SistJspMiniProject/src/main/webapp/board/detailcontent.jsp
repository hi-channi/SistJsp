<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartboardDto"%>
<%@page import="data.dao.SmartboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.content {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>

<%
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");

	SmartboardDao dao=new SmartboardDao();
	SmartboardDto dto=dao.getData(num);
	
	dao.updateReadCount(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd HH:mm");
%>

</body>
<div class="content">
<table class="table table-condensed" style="width: 650px;">
	<caption>게시글 상세보기</caption>
		<tr>
			<td style="width: 500px;">
				<b><%=dto.getSubject() %></b>
			</td>
			<td>
				<span style="color: gray; font-size: 9pt;">
				<%=sdf.format(dto.getWriteday())  %></span>&nbsp;
				<b style="color: gray; font-size: 9pt;">조회 <%=dto.getReadcount() %></b>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span style="color: gray; font-size: 9pt;">
				<%=dto.getWriter() %></span>
				<br><br>
				<%=dto.getContent().replace("\n","<br>") %>
				<br>
				<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='index.jsp?main=board/#.jsp?num=<%=dto.getNum() %>'">수정</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='#.jsp?num=<%=dto.getNum() %>'">삭제</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='index.jsp?main=board/smartlist.jsp?cuttentPage=<%=currentPage%>'">목록</button>
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='index.jsp?main=board/smartform.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>
</div>
</html>