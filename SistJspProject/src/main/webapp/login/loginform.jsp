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
</head>
<body>
<%
	String idsave=(String)session.getAttribute("saveOk");
	String id=(String)session.getAttribute("idOk");
%>

<form action="loginproc.jsp" method="post">
	<table class="table table-bordered" style="width: 250px;">
		<caption><b>세션 로그인</b></caption>
			<tr>
				<td colspan="2" style="padding-left: 10px;">
				
				<%	// 세션 반환값 유무에 따른 체크박스 상태 기억
				if(idsave==null) {		// 아이디 저장에 체크하지 않았을 때
				%> 
				<input type="checkbox" name="idsave">아이디 저장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<%} else {
				%>
				<input type="checkbox" name="idsave" checked="checked">아이디 저장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<% }
				%>
				
				<b>보안 로그인</b>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
				
				<%	// 세션 반환값에 의해 아이디 입력 폼 value값 부여
				if(idsave==null) {		// 아이디 저장에 체크하지 않았을 때
				%> 
					<input type="text" size="10" name="id" autofocus="autofocus" required="required" class="form-control">
				<%} else {
				%>
					<input type="text" size="10" name="id" autofocus="autofocus" required="required" class="form-control" value="<%=id %>">
				<% }
				%>
				
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
				<input type="password" size="10" name="pw" required="required" class="form-control">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="로그인" class="btn btn-info">
				<input type="button" value="회원가입" class="btn btn-danger" onclick="">
				</td>
			</tr>	
	</table>
</form>

</body>
</html>