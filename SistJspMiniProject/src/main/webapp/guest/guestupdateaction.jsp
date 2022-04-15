<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	// 세션으로부터 DB 저장할 id 읽기
	String myid=(String)session.getAttribute("myid");
	
	// 실제 경로 
	String realPath=getServletContext().getRealPath("/save");
	int uploadSize=1024*1024*2;
	MultipartRequest multi=null;
	
	try {
		multi=new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
	
		//multi로 데이터 읽기
		String num=multi.getParameter("num");
		String content=multi.getParameter("content");
		String photoname=multi.getFilesystemName("photo");
	
		GuestDto dto=new GuestDto();
		GuestDao dao=new GuestDao();
		dto.setNum(num);
		dto.setContent(content);

		// 사진 수정 여부에 따라 데이터 유지 or 대체
		String old_Phtotname=dao.getData(dto.getNum()).getPhotoname();
		dto.setPhotoname(photoname==null?old_Phtotname:photoname);
	
		dao.updateGuest(dto);
		
		// 수정한 방명록이 있는 페이지로 돌아가기 위해서 currentPage로 이동 >> 미설정 시 첫페이지로 이동
		String currentPage=multi.getParameter("currentPage");
		response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);
	} catch (Exception e) {
		System.out.println("DB 오류: "+e.getMessage());
	}
%>

</body>
</html>