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
<body>

<form action="addmember.jsp" method="post" name="mfrm" enctype="multipart/form-data">
	<table class="table table-hover" style="width: 600px;">
		<caption> 회원가입 </caption>
		<tr>
			<th>ID</th>
			<td>
			<input type="text" class="form-control" name="id" size="15" style="width: 200px; float: left;" readonly="readonly" placeholder="중복체크 클릭">
			&nbsp;<button type="button" class="btn btn-danger btn-sm" onclick="idcheck()">중복확인</button>
		</tr>
		<tr>
			<th>PW</th>
			<td>
			<input type="password" class="form-control" name="pw" size="15" required="required" placeholder="암호 입력" style="width: 200px;">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
			<input type="text" class="form-control" name="name" size="10" required="required" placeholder="이름 입력" style="width: 150px;">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
			<input type="text" class="form-control" name="hp" required="required" style="width: 200px;" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');"/>
			</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>
			<input type="file" class="form-control" name="photo" style="width: 300px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" class="btn btn-info" value="가입하기">&nbsp;&nbsp;
			<input type="button" class="btn btn-warning" value="뒤로가기" onclick="location.href='../member2login/loginform.jsp'">
		</tr>
	</table>
</form>

</body>
</html>