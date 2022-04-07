<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
function goFocus(hp) {
	if(hp.value.length==4) {
		frm.hp2.focus();
	}
}

</script>
</head>
<body>

<form action="insertaction.jsp" method="post" name="frm">
	<table class="table table=bordered" style="width: 400px;">
		<caption>유저 정보 입력</caption>
		<tr>
			<th width="100">이름</th>
			<td>
			<input type="text" name="name" size="8" placeholder="이름" required="required">
			</td>
		</tr>
		<tr>
			<th>혈액형</th>
			<td>
			<select name="blood" size="1">
				<option value="A">A형</option>
				<option value="B">B형</option>
				<option value="O">O형</option>
				<option value="AB">AB형</option>	
			</select>
			</td>
		</tr>
		
		<tr>
			<th>연락처</th>
			<td>
			<select name="acode">
				<option value="010">010</option>
				<option value="070">070</option>
				<option value="O2">02</option>
				<option value="031">031</option>	
			</select>
			<b>-</b>
			<input type="text" name="hp1" max="4" size="3" required="required" onkeyup="goFocus(this)">
			<b>-</b>
			<input type="text" name="hp2" max="4" size="3" required="required">
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
			<input type="date" name="birth" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='userlist.jsp'">
			</td>
		</tr>	
	</table>
</form>

</body>
</html>