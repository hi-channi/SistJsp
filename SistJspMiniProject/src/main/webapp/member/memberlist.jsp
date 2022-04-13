<%@page import="java.util.List"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
#list {
	padding-top: 30px;
	font-family: 'Noto Sans KR';
	font-size: 10pt;
	display: flex;
	justify-content: center;
}
tr>th {
	text-align: center;
}
</style>
</head>
<body>

<%
	MemberDao db=new MemberDao();
	List<MemberDto> list=db.getAllMembers();
%>

<div id="list">
<table class="table table-hover" style="width: 1000px;">
	<caption>멤버 리스트&nbsp;<span class="badge">총 <%=list.size() %>명 </span>&nbsp;
		<button class="btn btn-success btn-xs glyphicon glyphicon-plus-sign" onclick="location.href='index.jsp?main=member/memberform.jsp'">회원가입</button>
	</caption>
	<tr style="text-align: center;">
		<th width="50">번호</th>
		<th width="80">이름</th>
		<th width="100">아이디</th>
		<th width="120">연락처</th>
		<th width="150">이메일</th>
		<th width="270">주소</th>
		<th width="90">가입일</th>
		<th width="90"><span class="glyphicon glyphicon-cog"></span></th>
	</tr>
	
	<% if(list.size()==0) {
		%>
		<tr>
			<td colspan="8" align="center">
			<b>등록된 멤버가 없습니다.</b>
			</td>
		</tr>
	<% } else {
			for(int i=0;i<list.size();i++) {
				MemberDto dto=list.get(i);
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=dto.getAddr() %></td>
			<td><%=dto.getSdate() %></td>
			<td>
				<button type="button" class="btn btn-warning btn-xs" onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-danger btn-xs" onclick="location.href=''">삭제</button>
			</td>
		</tr>
	<% }
	}
%>
	
</table>
</div>

</body>
</html>