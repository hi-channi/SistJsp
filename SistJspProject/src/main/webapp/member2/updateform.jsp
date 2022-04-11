<%@page import="member2.Member2Dto"%>
<%@page import="member2.Member2Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>회원가입</title>
<style type="text/css">

form {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}

</style>
<script type="text/javascript">
	function idcheck() {
		window.open('idcheck.jsp' ,"", "left=1200px, top=300px, width=400px, height=200px");
	}
</script>
</head>

<%
	String num=request.getParameter("num");
	Member2Dao dao=new Member2Dao();
	Member2Dto dto=dao.getMember2(num);
%>

<body>

<form action="updatemember.jsp" method="post" name="mfrm" enctype="multipart/form-data">
	<table class="table table-hover" style="width: 600px;">
		<caption> 회원정보 수정 </caption>
		<tr>
			<th>ID</th>
			<td>
			<input type="text" class="form-control" name="id" size="15" style="width: 200px; float: left;" readonly="readonly" value="<%=dto.getId() %>">
			<input type="hidden" class="form-control" name="num" size="5" style="width: 50px;"value="<%=dto.getNum() %>">
		</tr>
		<tr>
			<th>PW</th>
			<td>
			<input type="password" class="form-control" name="pw" size="15" required="required" style="width: 200px;" value="<%=dto.getPw() %>">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
			<input type="text" class="form-control" name="name" size="10" required="required" style="width: 150px;" value="<%=dto.getName() %>">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
			<input type="text" class="form-control" name="hp" required="required" style="width: 200px;" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');" value="<%=dto.getHp() %>">
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
			<input type="file" class="form-control" name="photo" style="width: 300px;">
			<%-- <img alt="" src="../<%=dto.getPhoto() %>" width="60" border="1"> --%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" class="btn btn-info" value="수정하기">
			<input type="button" class="btn btn-warning" value="뒤로가기" onclick="location.href='list.jsp'">
		</tr>
	</table>
</form>

</body>
</html>