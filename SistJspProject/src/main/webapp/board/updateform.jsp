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
form {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}

th {
	text-align: center;
	vertical-align: middle;
}
</style>
<script type="text/javascript">
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$("#blah").attr('src', e.target.result);
		};
	reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>
<body>

<%
	String num=request.getParameter("num");
	BoardDao dao=new BoardDao();
	BoardDto dto=dao.getBoard(num);
%>

<form action="updateproc.jsp" method="post" enctype="multipart/form-data">
	<table class="table table-bordered" style="width: 500px;">
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">작성자</th>
			<td>
			<%=dto.getWriter() %>
			<input type="hidden" name="num" size="2" readonly="readonly" value="<%=dto.getNum() %>" >
			</td>
		</tr>
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">제목</th>
			<td>
			<input type="text" name="subject" class="form-control" required="required" placeholder="subject" value="<%=dto.getSubject() %>">
			</td>
		</tr>
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">암호</th>
			<td>
			<input type="password" name="pw" class="form-control" required="required" placeholder="숫자 4자리" style="width: 100px;" pattern="[0-9]{4}">
			
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea name="content" style="width: 500px; height: 250px; resize: vertical;" placeholder="1000자 이내">
			<%=dto.getContent() %>
			</textarea>
			</td>
		</tr>
		<tr>
			<th style="width: 100px;" bgcolor="#ddd">이미지 첨부</th>
			<td>
			<input type="file" name="imgname" onchange="readURL(this)">
			<img id="blah" src="" style="max-width: 100px; margin-top: 10px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-success">수정</button>
			<button type="button" class="btn btn-warning" onclick="history.back()">이전화면</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>