<%@page import="member2.Member2Dao"%>
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
	String saveid=request.getParameter("saverid");		// 체크박스 체크 안할 경우 null
	
	Member2Dao dao=new Member2Dao();
	int idx=dao.getLogin(id, pw);
	
	if(idx==1) {
		// session 저장
		session.setAttribute("id", id);
		session.setAttribute("saveid", saveid==null?"no":"yes");
		session.setAttribute("loginOK", "yes");
		
		session.setMaxInactiveInterval(60*60*8);
	
		response.sendRedirect("loginmain.jsp");
		
	} else if(idx==2) {
		%> 
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.back();
		</script>
		
	<%} else if(idx==3) {
		%>
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.back();
		</script>
	<% }
%>
	
</body>
</html>