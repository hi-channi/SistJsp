<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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

<!-- 수정 버튼을 클릭한 회원의 num값을 받아 DB에서 삭제 -->
<%
	String num=request.getParameter("num");
	String pw=request.getParameter("pw");
	
	MemberDao dao=new MemberDao();
	boolean check=dao.isPwCheck(num, pw);
	
	// 입력한 암호와 DB의 암호를 대조 >> 일치하면 mymemlist.jsp로 이동, 틀리면 이전 화면으로 이동
	if(check) {
	%>
		<script type="text/javascript">
			location.href="../index.jsp?main=member/memberupdateform.jsp?num=<%=num %>";
		</script>
	<%
	} else {
	%> 
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.");
			history.back();
		</script>
	<% 
	}
%>

</body>
</html>