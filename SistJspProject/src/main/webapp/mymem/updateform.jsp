<%@page import="java.util.StringTokenizer"%>
<%@page import="mymem.MymemDto"%>
<%@page import="mymem.MymemDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>멤버 정보 수정</title>
<style type="text/css">

div.updateform {
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

<%
	String num=request.getParameter("num");
	MymemDao dao=new MymemDao();
	MymemDto dto=dao.getMem(num);
%>

<%
	// 휴대폰 번호와 이메일을 하나로 묶었던 것을 다시 분리
	StringTokenizer stHp=new StringTokenizer(dto.getHp(),"-");
	StringTokenizer stEmail=new StringTokenizer(dto.getEmail(),"@");
	
	String acode=stHp.nextToken();
	String hp1=stHp.nextToken();
	String hp2=stHp.nextToken();
	
	String email1=stEmail.nextToken();
	String email2=stEmail.nextToken();
%>

<!-- 수정할 회원 정보를 폼 안에 담은 채로 출력 -->
<!-- 수정 폼 -->
<div class="updateform">
<form action="updateproc.jsp" method="post" name="frm">
	<table class="table table-hover" style="width: 500px;">
		<caption> 멤버 정보 수정 </caption>
		<tr>
			<th>ID</th>
			<td>
			<input type="text" id="id" name="id" size="15" value="<%=dto.getId() %>"> &nbsp;&nbsp;
			<input type="hidden" id="num" name="num" size="15" value="<%=dto.getNum() %>" readonly="readonly">
		</tr>
		<tr>
			<th>PW</th>
			<td>
			<input type="password" id="pw" name="pw" size="15" required="required" value="<%=dto.getPw() %>">
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
			<input type="text" id="name" name="name" size="10" required="required" value="<%=dto.getName() %>">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
			<select name="acode" required="required">
			<%
				String[] acodes={"010","070","02","031"};
				for (int i=0;i<acodes.length;i++) {
					if(acode.equalsIgnoreCase(acodes[i])) {
					%>
					<option value="<%=acodes[i] %>" selected="selected"><%=acodes[i] %></option>
					<%} else {
					%>
					<option value="<%=acodes[i] %>"><%=acodes[i] %></option>
					<% }
				}
			%>
			</select>
			-<input type="text" id="hp1" name="hp1" size="4" maxlength="4" required="required" onkeyup="goFocus(this)" value="<%=hp1 %>">
			-<input type="text" id="hp2" name="hp2" size="4" maxlength="4" required="required" value="<%=hp1 %>">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
			<input type="text" id="email1" name="email1" size="10" required="required" value="<%=email1 %>">&nbsp;@
			<select name="email2" required="required">
			<%
				String[] emails={"naver.com","hanmail.net","gmail.com","nate.com"};
				for (int i=0;i<emails.length;i++) {
					if(dto.getEmail().equalsIgnoreCase(emails[i])) {
					%>
					<option value="<%=emails[i] %>" selected="selected"><%=emails[i] %>형</option>
					<%} else {
					%>
					<option value="<%=emails[i] %>"><%=emails[i] %></option>
					<% }
				}
			%>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" class="btn btn-info" value="수정하기">
			<input type="button" class="btn btn-warning" value="뒤로가기" onclick="location.href='mymemlist.jsp'">&nbsp;&nbsp;
			<input type="button" class="btn btn-danger" value="삭제하기" onclick="location.href='deleteproc.jsp?num=<%=dto.getNum() %>'">
		</tr>
	</table>
</form>
</div>

</body>
</html>