<%@page import="log.LogDao"%>
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
	String idsave=request.getParameter("idsave");
	 
	// 아이디와 암호가 일치하는지 확인
	LogDao db=new LogDao();
	boolean flag=db.islogin(id, pw);
	//boolean flag=db.islogin2(id, pw); 	//  SQL Injection
	
	// 일치하면 세션 저장 후 로그인 메인으로 이동
	if(flag) {
		// 로그인 중인지 알 수 있는 세션 저장
		session.setAttribute("loginOk", "SUCCESS");

		session.setAttribute("idOk", id);
		// 체크박스는 체크 할 경우 on, 체크 안하면 null 반환
		session.setAttribute("saveOk", idsave);
		// 세션 유지시간 설정
		session.setMaxInactiveInterval(60*60*8);	// 8시간 >> 60sec*60sec=1시간
		
		response.sendRedirect("loginmain.jsp");
	} else {
	%>
		<script type="text/javascript">
		alert("로그인 정보가 일치하지 않습니다.");
		history.back();
		</script>
	<%} 
	%>

</body>
</html>