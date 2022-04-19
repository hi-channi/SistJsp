<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
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
	String realPath=getServletContext().getRealPath("/shopsave");
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2;
	
	MultipartRequest multi=null;
	
	try {
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8",
	      new DefaultFileRenamePolicy());
	
	String item=multi.getParameter("item");
	String category=multi.getParameter("category");
	String iday=multi.getParameter("iday");
	int price=Integer.parseInt(multi.getParameter("price"));
	String photo=multi.getFilesystemName("photo"); 
	
	//dto에 저장
	ShopDto dto=new ShopDto();
	dto.setItem(item);
	dto.setCategory(category);
	dto.setPhoto(photo);
	dto.setPrice(price);
	dto.setIday(iday);
	
	//dao선언
	ShopDao dao=new ShopDao();
	//insert
	dao.insertItem(dto);
	
	//상품등록
	response.sendRedirect("../index.jsp?main=shop/addform.jsp");
	
	} catch(Exception e) {
		System.out.println("DB 오류: "+e.getMessage());
	}
%>

</body>
</html>