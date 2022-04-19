<%@page import="data.dao.MemberDao"%>
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
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	String saveid=request.getParameter("saveid");		// 체크박스 체크 안할 경우 null
	
	MemberDao dao=new MemberDao();
	int opt=dao.loginCheck(id, pw);
	
	if(opt==1) {		// 로그인 성공
		// session 저장
		session.setAttribute("id", id);
		session.setAttribute("saveid", saveid==null?"no":"yes");
		session.setAttribute("loginOk", "yes");
		
		session.setMaxInactiveInterval(60*60*8);
		response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
	} else if(opt==2) {		// 암호 불일치
		%> 
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
		</script>
	<% } else if(opt==3) {		// 아이디 없음
		%>
		<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
		</script>
	<% }
%>

</body>
</html>