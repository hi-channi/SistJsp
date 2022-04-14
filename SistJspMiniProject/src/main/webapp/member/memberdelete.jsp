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
	request.setCharacterEncoding("utf-8");

	String num=request.getParameter("num");
	String pw=request.getParameter("pw");
	
	MemberDao dao=new MemberDao();
	boolean check=dao.isPwCheck(num, pw);
	
	if(check==true) {
		dao.deleteMember(num);
		response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
	} else {
		%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
		</script>	
	<% } 
%>

</body>
</html>