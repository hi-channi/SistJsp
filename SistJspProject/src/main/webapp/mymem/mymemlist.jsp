<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mymem.MymemDto"%>
<%@page import="mymem.MymemDao"%>
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

<style type="text/css">

div.list {
padding-top: 50px;
font-family: 'Noto Sans KR';
display: flex;
justify-content: center;
}

</style>
</head>
<body>

<!-- 최초 페이지를 통해 입력받은 회원 정보 리스트를 출력 -->
<%
	MymemDao db=new MymemDao();
	List<MymemDto> list=db.getAllMem();
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
%>

<div class="list">
<table class="table table-hover" style="width: 850px;">
	<caption>멤버 리스트&nbsp;<span class="badge">총 <%=list.size() %>명 </span>&nbsp;
		<button class="btn btn-success btn-xs glyphicon glyphicon-plus-sign" onclick="location.href='mymemform.jsp'">추가하기</button>
	</caption>
	<tr>
		<th width="50">번호</th>
		<th width="80">이름</th>
		<th width="100">아이디</th>
		<th width="150">암호</th>
		<th width="150">연락처</th>
		<th width="150">이메일</th>
		<th width="70">가입일</th>
		<th width="100">관리</th>
	</tr>
	
	<% for(int i=0;i<list.size();i++) {
		MymemDto dto=list.get(i);
	%>
		<tr>
		<td><%=i+1 %></td>
		<td><%=dto.getName() %></td>
		<td><%=dto.getId() %></td>
		<td><%=dto.getPw() %></td>
		<td><%=dto.getHp() %></td>
		<td><%=dto.getEmail() %></td>
		<td><%=sdf.format(dto.getMday()) %></td>
		<td>
			<button class="btn btn-warning btn-xs" onclick="location.href='updateform.jsp'">수정</button>
			<button class="btn btn-danger btn-xs" onclick="location.href='deleteproc.jsp'">삭제</button>
		</td>
		</tr>
	<% }
	%>
	
</table>
</div>

</body>
</html>