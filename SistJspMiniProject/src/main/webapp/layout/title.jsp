<%@page import="data.dao.ShopDao"%>
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
<style type="text/css">
div.cart{
	float: right;
	cursor: pointer;
}
span.carticon {
	font-size: 20pt;
}
div.count{
	background-color: red;
	color: white;
	width: 30px;
	height 30px;
	border-radius: 100px;
	float: right;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function () {
	$("div.cart").click(function () {
		location.href="index.jsp?main=shop/mycart.jsp";
	});
});

</script>
</head>

<%
	String root=request.getContextPath();
%>

<body>

<a href="<%=root %>">
	<img alt="" src="image/title.png">
</a>

<div style="float: right; padding-right: 100px;">

<%
	String loginOk=(String)session.getAttribute("loginOk");
	
	String myid=(String)session.getAttribute("id");
	
	MemberDao dao=new MemberDao();
	String name=dao.getName(myid);
	
	// 장바구니 기능 추가()
	ShopDao sdao=new ShopDao();
	int cartCnt=sdao.getCartList(myid).size();
	
	if(loginOk==null) {
		%>
		<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=login/loginform.jsp'">로그인</button>
	<% } else {
		%>
		<b style=""><%=name %></b>님&nbsp;
		<button type="button" class="btn btn-success btn-sm" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
		&nbsp;&nbsp;
		<div class="cart">
			<span class="glyphicon glyphicon-shopping-cart carticon"></span>
			<div class="count"><%=cartCnt %></div>
		</div>
	<% } 
%>

</div>
</body>
</html>