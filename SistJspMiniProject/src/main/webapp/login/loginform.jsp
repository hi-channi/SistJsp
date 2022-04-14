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
div.loginform {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
</style>
</head>

<body>

<%
	// 세션으로부터 아이디 저장값 불러오기
	String id=(String)session.getAttribute("id");
	String saveid=(String)session.getAttribute("saveid");
	
	boolean check;
	if(saveid==null || saveid.equals("no")) {
		check=false;
	} else {
		check=true;
	}
%>

<div class="loginform">
<form action="login/loginaction.jsp" method="post">
	<table class="table table-hover" style="width: 400px;">
		<caption>회원 로그인</caption>
		<tr>
			<th>ID</th>
			<td>
			<input type="text" class="form-control" name="id" style="width: 200px; float: left" value="<%=check?id:"" %>">&nbsp;
			<input type="checkbox" name="saveid" value="<%=check?"checked":"" %>"> 아이디 저장
			</td>
		</tr>
		<tr>
			<th>PW</th>
			<td>
			<input type="password" class="form-control" name="pw" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info btn-xs" style="width: 150px; height: 30px;">회원로그인</button>
			&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-success btn-xs" style="width: 100px; height: 30px;" onclick="location.href='index.jsp?main=member/memberform.jsp'">회원가입</button>
			</td>
		</tr>
	</table>
</form>
</div>

</body>
</html>