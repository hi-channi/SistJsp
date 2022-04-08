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
	String folder="/save";
	ServletContext context=getServletContext();
	String realfolder=context.getRealPath(folder);
	
	System.out.println("folder: "+realfolder);
	
	int filesize= 1024*1024*5;	// 5MB= 1024*1024=1MB
	
	MultipartRequest multi=null;
	
	try {
	// MultipartRequest(request, 파일 경로, 파일 크기, 인코딩 방식, new DefaultFileRenamePolicy());
		// new DefaultFileRenamePolicy(): 같은 이름의 파일이 있을 경우 '자동으로 다른 이름으로 저장' 수행
	multi=new MultipartRequest(request, realfolder, filesize, "UTF-8", new DefaultFileRenamePolicy());
	String name=multi.getParameter("name");
	String title=multi.getParameter("title");
	
	// 실제 업로드 된 파일명(new DefaultFileRenamePolicy()에 의해 변경될 경우 변경된 이름) 반환
	String uploadFilename=multi.getFilesystemName("uploadfile");
	// 변경되기 전 원래 파일명 반환
	String orignalFilename=multi.getOriginalFileName("uploadfile");
	%>
	
	<table class="table table-bordered" style="width: 300px;">
		<tr>
			<th width="100">이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th width="100">제목</th>
			<td><%=title %></td>
		</tr>
		<tr>
			<th width="100">업로드된 파일명:<br><%=uploadFilename %></th>
			<td><img alt="" src="../save/<%=uploadFilename %>"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="업로뜨">
			<input type="submit" value="다시 업로드" onclick="location.href='uploadform.jsp'">
		</td>
	</tr>
	</table>
	<%} catch(Exception e) {
	}	
	%>
	
</body>
</html>