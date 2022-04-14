<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>menu</title>
<link rel="stylesheet" type="text/css" href="menu/menu.css">

</head>
<body>
<div id="wrap">
	<header>
		<div class="inner relative">
			<a class="logo" href="#"></a>
			<a id="menu-toggle" class="button dark" href="#"><i class="icon-reorder"></i></a>
			<nav id="navigation">
				<ul id="main-menu">
					<li class="current-menu-item"><a href="index.jsp">Home</a></li>
					<li class="parent">
						<a href="#">Member</a>
						<ul class="sub-menu">
							<li><a href="index.jsp?main=member/memberform.jsp"><i class="icon-wrench"></i> 회원가입</a></li>
							<li><a href="index.jsp?main=member/memberlist.jsp"><i class="icon-credit-card"></i>멤버리스트</a></li>
							<li><a href="#"><i class="icon-gift"></i>submenu 2-3</a></li>
							<li>
								<a class="parent" href="#"><i class="icon-file-alt"></i>submenu 2-4</a>
								<ul class="sub-menu">
									<li><a href="#">submenu 2-3.1</a></li>
									<li><a href="#">submenu 2-3.2</a></li>
									<li><a href="#">submenu 2-3.3</a></li>
									<li><a href="#">submenu 2-3.4</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="#">menu 3</a></li>
					<li class="parent">
						<a href="#">menu 4</a>
						<ul class="sub-menu">
							<li><a href="#">submenu 4-1</a></li>
							<li><a href="#">submenu 4-2</a></li>
							<li><a href="#">submenu 4-3</a></li>
							<li><a href="#">submenu 4-4</a></li>
							<li><a href="#">submenu 4-5</a></li>
						</ul>
					</li>
					<li><a href="index.jsp?main=login/loginform.jsp" class="glyphicon glyphicon-chevron-right">Login</a></li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body></html>

<%-- 
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
	String root=request.getContextPath();
%>

<body>
<a href="<%=root %>">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>">로그인</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="index.jsp?main=member/memberform.jsp">회원가입</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>">방명록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>">Q&A</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>">답변형게시판</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<%=root %>">상품등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</body>
</html>
--%>

