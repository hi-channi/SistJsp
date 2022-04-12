<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDao"%>
<%@page import="board.BoardDto"%>
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

	BoardDao dao=new BoardDao();
	BoardDto dto=dao.getBoard(num);
	
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
				<%=sdf.format(dto.getWday())  %></span>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<span style="color: gray; font-size: 9pt;">
				<%=dto.getWriter() %></span>
				<br><br>
				<%=dto.getContent().replace("\n","<br>")  %>
				<br><br>
				<!-- 이미지 클릭하면 원본 사이즈로 보기 -->
				<a href="../photo/<%=dto.getImgname()%>" target="_blank">
				<img alt="" src="../photo/<%=dto.getImgname()%>" style="max-width: 250px">
				</a>
				<br>
				<i style="color: gray; font-size: 8pt;">이미지를 클릭하면 원본 사이즈로 볼 수 있습니다.</i>
				<br><br>
				<b style="color: gray; font-size: 9pt;">조회 <%=dto.getReadcount() %></b>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='updateform.jsp?num=<%=dto.getNum() %>'">수정</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='deleteform.jsp?num=<%=dto.getNum() %>'">삭제</button>
				<button type="button" class="btn btn-default btn-sm" onclick="location.href='boardlist.jsp'">목록</button>
				<button type="button" class="btn btn-success btn-sm" onclick="location.href='boardform.jsp'">글쓰기</button>
			</td>
		</tr>
	</table>
</div>
</html>