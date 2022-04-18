<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
form {
	padding-top: 30px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
tr>th{
	text-align: center;
}
</style>
</head>
<body>

<div>
	<form action="shop/addaction.jsp" method="post" class="form-inline" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 600px;">
			<caption>상품 등록</caption>
				<tr>
					<th style="width: 150px; background-color: tomato">
					<b>카테고리</b>
					</th>
					<td>
						<select style="width: 200px" name="category" class="form-control" required="required">
							<option value="뷰티">뷰티</option>
							<option value="패션/잡화">패션/잡화</option>
							<option value="테크">테크</option>
							<option value="식품">식품</option>
						</select>
					</td>
				</tr>
				<tr>
					<th style="width: 150px; background-color: tomato">
					<b>상품명</b>
					</th>
					<td>
					<input type="text" name="item" style="width: 200px;" class="form-control" placeholder="상품명 입력" required="required">
					</td>
				</tr>
				<tr>
					<th style="width: 150px; background-color: tomato">
					<b>상품 이미지</b>
					</th>
					<td>
					<input type="file" name="photo" style="width: 300px;">
					</td>
				</tr>
				<tr>
					<th style="width: 150px; background-color: tomato">
					<b>상품 가격</b>
					</th>
					<td>
					<input type="text" name="price" style="width: 120px;" class="form-control" placeholder="상품가격 입력" required="required">
					</td>
				</tr>
				<tr>
					<th style="width: 150px; background-color: tomato">
					<b>입고일</b>
					</th>
					<td>
					<%
						SimpleDateFormat sdf=new SimpleDateFormat("yy.mm.dd");
						String day=sdf.format(new Date());
					%>
					<input type="date" name="iday" value="<%=day %>" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info">상품저장</button>
						<button type="button" class="btn btn-info" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">목록보기</button>
					</td>
				</tr>
		</table>
	</form>
</div>

</body>
</html>