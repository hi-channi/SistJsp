<%@page import="java.io.File"%>
<%@page import="board.BoardDao"%>
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
	String pw=request.getParameter("pw");
	
	BoardDao dao=new BoardDao();
	boolean match=dao.isEqualPw(num, pw);
	
	if(match) {
		// num에 해당하는 photo값 얻기
		String photo=dao.getBoard(num).getImgname();
	
		// root(/) 서버에 업로드된 실제 디렉토리 찾기
		String path=getServletContext().getRealPath("/");
		System.out.println(path);
	
		// photo 실제 경로가 photo일 경우만 해당 이미지 삭제
		if(photo.startsWith("photo")) {
			// 경로 표시 시 / or \\
			File file=new File(path+"\\"+photo);
			file.delete();
		}
			dao.deleteBoard(num);
			response.sendRedirect("boardlist.jsp");
	} else {
		%>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.")
			history.back();
		</script>
		<% 
	} %>

</body>
</html>