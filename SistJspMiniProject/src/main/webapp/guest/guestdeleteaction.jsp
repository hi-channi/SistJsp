<%@page import="java.io.File"%>
<%@page import="data.dao.GuestDao"%>
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
	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	GuestDao dao=new GuestDao();
	
	// num에 해당하는 Photoname값 얻기
	String photoname=dao.getData(num).getPhotoname();
	
	// photoname값이 없으면 즉시 데이터 삭제, 존재하면 파일 삭제 후 데이터 삭제
	if(photoname==null || photoname.equals("")) {		
		dao.deleteGuest(num);
	} else {
		// 서버 내 업로드 된 실제 디렉토리 찾기
		String path=getServletContext().getRealPath("/");
		
		File file=new File(path+"/"+photoname);
		System.out.println(path);
		file.delete();
		dao.deleteGuest(num);
	}
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
%>

</body>
</html>