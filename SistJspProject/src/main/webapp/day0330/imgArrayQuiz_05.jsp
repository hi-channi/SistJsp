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
<% int n=0;
%> 
<table class="table table-bordered" style="width: 400px">
	<% for(int i=0; i<4; i++) { %> 
		<tr>
		<% for(int j=0; j<5; j++) {
			n++; %>
			<td><img src="../image/<%=n%>.png" width="150px;"
				height="150px;"></td>
				<%
				}%>
				</tr>
			<%} 
			%>
</table>

</body>
</html>