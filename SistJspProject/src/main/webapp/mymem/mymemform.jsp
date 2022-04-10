<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>멤버 추가</title>
<style type="text/css">

div.insertform {
padding-top: 50px;
font-family: 'Noto Sans KR';
display: flex;
justify-content: center;
}

</style>
<script type="text/javascript">
function goFocus(hp) {
	if(hp.value.length==4) {
		frm.hp2.focus();
	}
}
</script>
</head>
<body>

<!-- 최초 페이지 -->
<!-- 입력 폼 -->
<div class="insertform">
<form action="insertproc.jsp" method="post" name="frm">
	<table class="table table-hover" style="width: 500px;">
		<caption> 신규 멤버 정보 입력 </caption>
		<tr>
			<th>ID</th>
			<td>
			<input type="text" id="id" name="id" size="15" required="required" autofocus="autofocus" placeholder="아이디 입력">
		</tr>
		<tr>
			<th>PW</th>
			<td>
			<input type="password" id="pw" name="pw" size="15" required="required" placeholder="암호 입력">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
			<input type="text" id="name" name="name" size="10" required="required" placeholder="이름 입력">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
			<select name="acode" required="required">
				<option value="">선택</option>
				<option value="010">010</option>
				<option value="070">070</option>
				<option value="02">02</option>
				<option value="031">031</option>
			</select>-
			<input type="text" id="hp1" name="hp1" size="4" maxlength="4" required="required" onkeyup="goFocus(this)">-
			<input type="text" id="hp2" name="hp2" size="4" maxlength="4" required="required">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
			<input type="text" id="email1" name="email1" size="10" required="required">&nbsp;@
			<select name="email2" required="required">
				<option value="">선택하세요</option>
				<option value="naver.com">naver.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="nate.com">nate.com</option>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" class="btn btn-info" value="저장하기">
			<input type="button" class="btn btn-warning" value="멤버 목록 보기" onclick="location.href='mymemlist.jsp'">
		</tr>
	</table>
</form>
</div>

</body>
</html>