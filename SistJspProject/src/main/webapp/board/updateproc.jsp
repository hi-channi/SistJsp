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
	String realPath=getServletContext().getRealPath("/photo");;

	int uploadSize=1024*1024*2;
	MultipartRequest multi=null;
	
	try {
		multi=new MultipartRequest(request, realPath, uploadSize, "UTF-8", new DefaultFileRenamePolicy());
		
		BoardDao dao=new BoardDao();
		BoardDto dto=new BoardDto();
		
		String num=multi.getParameter("num");
		String subject=multi.getParameter("subject");
		String content=multi.getParameter("content");
		String pw=multi.getParameter("pw");
		String imgname=multi.getFilesystemName("imgname");
		
		dto.setNum(num);
		dto.setSubject(subject);
		dto.setContent(content);
		dto.setImgname(multi.getParameter("imgname"));

		boolean match=dao.isEqualPw(num, pw);
		
		// 암호가 일치하면 수정 후 content로 이동, 다를 경우 경고창
		if(match) {
			// 사진 수정 안했을 경우 기존 사진 유지
			if(imgname==null) {
				String p=dao.getBoard(dto.getNum()).getImgname();
				dto.setImgname(p);
			// 사진 수정했을 경우 새로운 사진 업로드
			} else {
				dto.setImgname("../photo/"+imgname);
			}
			dao.updateBoard(dto);
			response.sendRedirect("content.jsp?num="+num);	
		} else {
		%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.")
			history.back();
		</script>
		<% }
	} catch(Exception e) {
		System.out.println("업로드 오류: "+e.getMessage());
	}
%>

</body>
</html>