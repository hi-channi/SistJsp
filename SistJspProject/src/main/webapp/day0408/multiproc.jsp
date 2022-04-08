<%@page import="java.util.Enumeration"%>
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
	multi=new MultipartRequest(request, realfolder, filesize, "UTF-8", new DefaultFileRenamePolicy());
	String writer=multi.getParameter("writer");
	%>
	
	<h2>작성자: <%=writer %></h2>
	<%
	// 파일 타입이 여러 개일 때
	Enumeration formNames=multi.getFileNames();
	
	while(formNames.hasMoreElements()) {
		
		// 파일태그에서 name 얻기
		String fileName=(String)formNames.nextElement();
		System.out.println("filetype name: "+fileName); // 확인
		
		// 실제 업로드된 파일명 얻기
		String uploadfilename=multi.getFilesystemName(fileName);
	
		// 파일을 선택하지 않았을 경우
		if(uploadfilename!=null) {
		%>
			<img src="../save/<%=uploadfilename %>" style="max-width: 200px;" border="1">
		<%	
		}
	}
	%>
	<%} catch(Exception e) {
	}%>

</body>
</html>