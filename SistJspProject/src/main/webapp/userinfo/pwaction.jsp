<%@page import="org.apache.catalina.tribes.group.interceptors.FragmentationInterceptorMBean"%>
<%@page import="Userinfo.UserinfoDao"%>
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

<!-- 비밀번호가 a1234라고 가정 -->
<%
	UserinfoDao dao=new UserinfoDao();
	String pw=request.getParameter("pw");
	String num=request.getParameter("num");
	
	// 비밀번호 확인 후 맞으면 userlist.jsp로 이동 
	// 다르면 이전 화면으로 이동
	if(pw.equals("a1234")) {
		dao.deleteInfo(num);
		response.sendRedirect("userlist.jsp");
	} else {
	%> 
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
	</script>
	<% 
	}
%>

</body>
</html>