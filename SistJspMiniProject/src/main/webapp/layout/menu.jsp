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
<%
	String loginOk=(String)session.getAttribute("loginOk");
	String myid=(String)session.getAttribute("id");
%>
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
							<li>
								<a class="parent" href="#"><i class="icon-file-alt"></i>게시판</a>
								<ul class="sub-menu">
									<li><a href="index.jsp?main=board/smartform.jsp">스마트게시판</a></li>
									<li><a href="index.jsp?main=board/smartlist.jsp">게시글 목록</a></li>
									<li><a href="#">[준비중]</a></li>
									<li><a href="#">[준비중]</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li><a href="index.jsp?main=guest/guestlist.jsp?currentPage=1">Guestbook</a></li>
					<li class="parent">
						<a href="#">Shop(beta)</a>
						<ul class="sub-menu">
						<%
							// id가 admin인 멤버만 상품등록 메뉴 노출
							if(loginOk!=null && myid.equals("admin")) {
								%>
								<li><a href="index.jsp?main=shop/addform.jsp">상품등록</a></li>
								<li><a href="index.jsp?main=shop/shoplist.jsp">상품목록</a></li>
							<% } else {
								%>
								<li><a href="index.jsp?main=shop/shoplist.jsp">상품목록</a></li>
							<% }
						%>
						</ul>
					</li>
					<%
						// 로그인 상태일 때는 Logout, 미로그인 상태일 때는 Login 노출
						if(loginOk==null || loginOk.equals("")) {
							%>
							<li><a href="index.jsp?main=login/loginform.jsp" class="glyphicon glyphicon-chevron-right">Login</a>
						<% } else {
							%>
							<li><a href="index.jsp?main=login/logoutaction.jsp" class="glyphicon glyphicon-chevron-left">Logout</a></li>
						<% }
					%>
					</li>
				</ul>
			</nav>
			<div class="clear"></div>
		</div>
	</header>	
</div>    
</body>
</html>

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

