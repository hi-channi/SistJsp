<%@page import="data.dto.ShopDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
img.photo {
	width: 200px;
	height: 230px;
	border: 1px solid gray;
	margin-bottom: 10px;
}

.shoptb tr {
	height: 280px;
	font-weight: bold;
	padding: 10px;
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
$(function name() {
	$("a.godetail").click(function name() {
		// 태그에 넣어둔 snum
		var snum=$(this).attr("snum");
		//alert(snum);
		// snum에 따른 각각의 번호 불러오기
		location.href="index.jsp?main=shop/detailpage.jsp?snum="+snum;
	});
});
</script>
</head>

<%
	ShopDao dao=new ShopDao();
	List<ShopDto>list=dao.getAllItems();
%>
<body>
	<div class="container">
		<h2>상품 목록</h2>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#전체">전체상품</a></li>
			<li><a data-toggle="tab" href="#뷰티">뷰티</a></li>
			<li><a data-toggle="tab" href="#패션잡화">패션잡화</a></li>
			<li><a data-toggle="tab" href="#테크">테크</a></li>
			<li><a data-toggle="tab" href="#식품">식품</a></li>
		</ul>
		<div class="tab-content">
			<div id="전체" class="tab-pane fade in active">
				<h3>전체상품</h3>
				<p>
				<table class="shoptb table table-bordered" style="width: 700px;">
					<tr>
						<%
						NumberFormat nf = NumberFormat.getCurrencyInstance();
						int i=0;
						for (ShopDto dto:list) {
							// 사진
							String photo=dto.getPhoto();
							// 할인율: 20~50 사이의 난수 발생
							int sale=(int)(Math.random()*31)+20;
						%>
						<td>
						<a snum="<%=dto.getSnum() %>" style="cursor: pointer;" class="godetail"> 
						<img alt="" src="shopsave/<%=photo %>" class="photo">
						<br>
						<%=dto.getItem() %>
						<br>
						<b style="color: red; font-size: 1.3em;"><%=sale %>% 할인</b><span style="float: right;">
						<div style="color: gray; font-size: 13pt;">
							<%
								int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
							%>
							<strike><%=nf.format(price) %></strike>
						</div>
						<div style="color: black; font-size: 16px;">
							<%=nf.format(dto.getPrice()) %>
						</div>
						</span>
						</a>
						</td>
						<%
							if((i+1)%5==0) {
								%>
					</tr>
					<tr>
						<% }
						i++;
					}
					%>
					</tr>
				</table>
				</p>
			</div>
			
			<div id="뷰티" class="tab-pane fade in active">
				<h3>뷰티</h3>
				<p>
				<table class="shoptb table table-bordered" style="width: 700px;">
					<tr>
						<%
						i=0;
						for (ShopDto dto:list) {
							if (dto.getCategory().equals("뷰티")) {
								//사진
								String photo=dto.getPhoto();
								// 할인율: 20~50 사이의 난수 발생
								int sale=(int)(Math.random()*31)+20;
						%>
						<td><a snum="<%=dto.getSnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="shopsave/<%=photo %>" class="photo"> 
						<br>
						<%=dto.getItem() %>
						<br>
						<b style="color: red; font-size: 1.3em;"><%=sale %>% 할인</b> <span style="float: right;">
						<div style="color: gray; font-size: 13pt;">
							<%
							int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
							%>
							<strike><%=nf.format(price) %></strike>
						</div>
						<div style="color: black; font-size: 16px;">
							<%=nf.format(dto.getPrice()) %>
						</div>
						</span>
						</a>
						</td>
							<%
								if((i+1)%5==0) {
									%>
					</tr>
					<tr>
							<% }
							i++;
							}
						}
						%>
					</tr>
				</table>
			</div>

			<div id="패션잡화" class="tab-pane fade in active">
				<h3>패션잡화</h3>
				<p>
				<table class="shoptb table table-bordered" style="width: 700px;">
					<tr>
						<%
						i=0;
						for (ShopDto dto:list) {
							if (dto.getCategory().equals("패션/잡화")) {
								//사진
								String photo=dto.getPhoto();
								// 할인율: 20~50 사이의 난수 발생
								int sale=(int)(Math.random()*31)+20;
						%>
						<td><a snum="<%=dto.getSnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="shopsave/<%=photo %>" class="photo"> 
						<br>
						<%=dto.getItem() %>
						<br>
						<b style="color: red; font-size: 1.3em;"><%=sale %>% 할인</b> <span style="float: right;">
						<div style="color: gray; font-size: 13pt;">
							<%
							int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
							%>
							<strike><%=nf.format(price) %></strike>
						</div>
						<div style="color: black; font-size: 16px;">
							<%=nf.format(dto.getPrice()) %>
						</div>
						</span>
						</a>
						</td>
						<%
								if((i+1)%5==0) {
									%>
					</tr>
					<tr>
							<% }
							i++;
							}
						}
						%>
					</tr>
				</table>
				</p>
			</div>
			
			<div id="테크" class="tab-pane fade in active">
				<h3>테크</h3>
				<p>
				<table class="shoptb table table-bordered" style="width: 700px;">
					<tr>
						<%
						i=0;
						for (ShopDto dto:list) {
							if (dto.getCategory().equals("테크")) {
								// 사진
								String photo=dto.getPhoto();
								// 할인율: 20~50 사이의 난수 발생
								int sale=(int)(Math.random()*31)+20;
						%>
						<td><a snum="<%=dto.getSnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="shopsave/<%=photo %>" class="photo"> 
						<br>
						<%=dto.getItem() %>
						<br>
						<b style="color: red; font-size: 1.3em;"><%=sale %>% 할인</b> <span style="float: right;">
						<div style="color: gray; font-size: 13pt;">
							<%
							int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
							%>
							<strike><%=nf.format(price) %></strike>
						</div>
						<div style="color: black; font-size: 16px;">
							<%=nf.format(dto.getPrice()) %>
						</div>
						</span>
						</a>
						</td>
						<%
								if((i+1)%5==0) {
									%>
					</tr>
					<tr>
							<% }
							i++;
							}
						}
						%>
					</tr>
				</table>
			</div>
			
			<div id="식품" class="tab-pane fade in active">
				<h3>식품</h3>
				<p>
				<table class="shoptb table table-bordered" style="width: 700px;">
					<tr>
						<%
						i=0;
						for (ShopDto dto:list) {
							if (dto.getCategory().equals("식품")) {
								// 사진
								String photo=dto.getPhoto();
								// 할인율: 20~50 사이의 난수 발생
								int sale=(int)(Math.random()*31)+20;
						%>
						<td><a snum="<%=dto.getSnum() %>" style="cursor: pointer;" class="godetail">
						<img alt="" src="shopsave/<%=photo %>" class="photo"> 
						<br> 
						<%=dto.getItem() %>
						<br>
						<b style="color: red; font-size: 1.3em;"><%=sale %>% 할인</b> <span style="float: right;">
						<div style="color: gray; font-size: 13pt;">
							<%
							int price=(int)(dto.getPrice()+(dto.getPrice()*(sale/100.0)));
							%>
							<strike><%=nf.format(price) %></strike>
						</div>
						<div style="color: black; font-size: 16px;">
							<%=nf.format(dto.getPrice()) %>
						</div>
						</span>
						</a>
						</td>
						<%
								if((i+1)%5==0) {
									%>
					</tr>
					<tr>
							<% }
							i++;
							}
						}
						%>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>