<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
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
<%
String num=request.getParameter("num");

MemberDao dao=new MemberDao();
MemberDto dto=dao.getData(num);

%>
<body>
	<br>
	<form action="updateformproc.jsp" method="post">
		<table class="table table-bordered" style="width: 400px; margin: 50px 0 0 50px;">
			<tr>
			<td colspan="2" align="center" style="font-weight: bold;">
			팀원 정보 수정
			</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" size="7" class="form-control"
					name="name" value="<%=dto.getName() %>"></td>
			</tr>

			<tr>
				<th>연락처</th>
				<td><input type="text" size="10" class="form-control" name="hp"
					value="<%=dto.getHp() %>"></td>
			</tr>
			<tr>
			<td colspan="2" align="center">
			<!--hidden으로 num을 넘김 >> form 내부 어디든 작성 가능 -->
			<input type="hidden" name="num" value="<%=dto.getNum() %>">
			
			<button type="submit" class="btn btn-xs btn-info">수정</button>
			<button type="reset" class="btn btn-xs btn-warning">초기화</button>
			</td>
		</table>
	</form>
</body>
</html>