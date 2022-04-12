<%@page import="java.io.File"%>
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
	// root(/) 서버에 배포된 실제 디렉토리 찾기
	String path=getServletContext().getRealPath("/");
	System.out.println(path);
	
	String num=request.getParameter("num");
	// num에 해당하는 photo값 얻기
	Member2Dao dao=new Member2Dao();
	String photo=dao.getMember2(num).getPhoto();
	
	// photo 실제 경로가 save일 경우만 해당 이미지 삭제
	if(photo.startsWith("save")) {
		// 경로 표시 시 / or \\
		File file=new File(path+"\\"+photo);
		file.delete();
	}
	
	dao.deleteMember2(num);
	
	// 로그인 했던 세션 삭제
	session.removeAttribute("loginOK");
	session.removeAttribute("id");
	session.removeAttribute("saveId");
	
	// 리스트로 되돌아가기
	response.sendRedirect("../member2/list.jsp");
%>

</body>
</html>