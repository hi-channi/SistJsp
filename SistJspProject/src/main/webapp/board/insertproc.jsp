<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
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
	String realPath=getServletContext().getRealPath("/photo");

	int uploadSize=1024*1024*2;
	MultipartRequest multi=null;
	
	try {
		multi=new MultipartRequest(request, realPath, uploadSize, "UTF-8", new DefaultFileRenamePolicy());
		
		BoardDao dao=new BoardDao();
		BoardDto dto=new BoardDto();
		
		dto.setWriter(multi.getParameter("writer"));
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setPw(multi.getParameter("pw"));
		
		String imgname=multi.getFilesystemName("imgname");
		dto.setImgname(imgname);
		
		// 입력폼에서 이미지가 필수 값이므로 비활성
		/* 
		if(imgname==null) {
			dto.setImgname("../image/20.png");
		} else {
			dto.setImgname("../photo/"+imgname);
		} 
		*/
		
		dao.insertBoard(dto);
		response.sendRedirect("boardlist.jsp");	
		System.out.println(realPath);
		
	} catch(Exception e) {
		System.out.println("업로드 오류: "+e.getMessage());
	}
%>

</body>
</html>