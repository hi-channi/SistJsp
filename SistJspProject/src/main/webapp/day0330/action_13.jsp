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
div.box {
float: left;
width: 300px;
height: 400px;
border-radius: 50px;

}

</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String item=request.getParameter("item");
String[] iColor=request.getParameterValues("iColor");
String iSize=request.getParameter("iSize");
String additem=request.getParameter("additem");
%>

<div class="box">
<h2>주문 내역</h2>
<h4>
상품명: <%=item %>
</h4>
<h4>
색상: 
<% for(int i=0; i<iColor.length;i++) {
	%>[<%=iColor[i]%>]&nbsp; 
	
	<% }
	%>
&nbsp;<font size="2">선택된 색상: <%=iColor.length %>개</font>
</h4>
<h4>사이즈: <%=iSize %></h4>
<h4>추가상품: <%=additem %></h4>
<br>
<a href="javascript:history.back()">재주문하기</a>

</div>
</body>
</html>