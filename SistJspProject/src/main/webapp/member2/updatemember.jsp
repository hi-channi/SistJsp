<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="member2.Member2Dao"%>
<%@page import="member2.Member2Dto"%>
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
	String realPath=getServletContext().getRealPath("/save");;

	int uploadSize=1024*1024*2;
	MultipartRequest multi=null;
	
	try {
		multi=new MultipartRequest(request, realPath, uploadSize, "UTF-8", new DefaultFileRenamePolicy());
		
		Member2Dao dao=new Member2Dao();
		Member2Dto dto=new Member2Dto();
		
		dto.setNum(multi.getParameter("num"));
		dto.setPw(multi.getParameter("pw"));
		dto.setName(multi.getParameter("name"));
		dto.setHp(multi.getParameter("hp"));
		dto.setPhoto(multi.getParameter("photo"));
		String photo=multi.getFilesystemName("photo");
		
		// 수정 폼에서 사진 선택하지 않았을 경우 기존 사진 경로 유지
		if(photo==null) {
			String p=dao.getMember2(dto.getNum()).getPhoto();
			dto.setPhoto(p);
		// 사진 수정했을 경우 새로운 사진 업로드
		} else {
			dto.setPhoto("../save/"+photo);
		}
			dao.updateMember2(dto);
			response.sendRedirect("list.jsp");	
			System.out.println(realPath);
	} catch(Exception e) {
		System.out.println("업로드 오류"+e.getMessage());
	}
%>

</body>
</html>