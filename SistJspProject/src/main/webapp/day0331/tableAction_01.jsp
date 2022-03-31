<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>



	<%
request.setCharacterEncoding("UTF-8");

String grade=request.getParameter("grade");
String[] skill=request.getParameterValues("skill");
String selectF=request.getParameter("selectF");
String bestT=request.getParameter("bestT");
String height=request.getParameter("height");
String weight=request.getParameter("weight");
String selectC=request.getParameter("selectC");
String selectD=request.getParameter("selectD");

%>

	<table class="table table-bordered" style="width: 500px;">
		<caption>저장 내용 확인</caption>
		<tr>
			<th>최종학력:</th>
			<td><%=grade %>&nbsp;졸업</td>
		</tr>

		<tr>
			<th>사용 언어:</th>
			<td>
			<% if(skill==null) {
				%>
			<font color="red">가능한 프로그래밍 언어 없음</font>
			<% } else {
				for(int i=0; i<skill.length;i++) {
					%>
				<b><%=skill[i] %></b>
				<% } 
				%> <i>(총 <%=skill.length %>개)</i>
			<% }
			%>
		</tr>

		<tr>
			<th>첨부 파일:</th>
			<td><%=selectF %></td>
		</tr>

		<tr>
			<th>우수 그룹 예상:</th>
			<td><%=bestT %></td>
		</tr>

		<tr>
			<th>신장:</th>
			<td><%=height %>&nbsp;cm</td>
		</tr>

		<tr>
			<th>체중:</th>
			<td><%=weight %>&nbsp;kg</td>
		</tr>

		<tr>
			<th>선택한 색상:</th>
			<td><%=selectC %>
		</tr>

		<tr>
			<th>선택한 날짜:</th>
			<td><%=selectD %></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<a href="javascript:history.back()">수정하기</a></td>
		</tr>

	</table>
</body>
</html>