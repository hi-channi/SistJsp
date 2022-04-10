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
</style>

</head>

<%
	String num=request.getParameter("num");
%>

<body>
	<form action="deleteproc.jsp" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
				<td align="center">
					<h3><b>암호를 입력하세요</b><br></h3>
					
					<font color="red"><i>삭제 이후에는 복구가 불가능합니다.</i></font>
					<br>
					<br>
					<input type="hidden" name="num" value="<%=num %>">
					<input type="password" name="pw" size="10" required="required" placeholder="선택한 멤버의 암호">
					<br>
					<br>
					<input type="submit" class="btn btn-default" value="확인">
					<input type="button" class="btn btn-default" value="목록" onclick="location.href='mymemlist.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>