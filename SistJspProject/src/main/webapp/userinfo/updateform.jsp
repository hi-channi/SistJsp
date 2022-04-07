<%@page import="java.util.StringTokenizer"%>
<%@page import="Userinfo.UserinfoDto"%>
<%@page import="Userinfo.UserinfoDao"%>
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
<script type="text/javascript">
// 연락처 입력 폼 커서 자동 이동 
function goFocus(hp) {
	if(hp.value.length==4) {
		frm.uhp2.focus();
	}
}
</script>
</head>
<%
	String num=request.getParameter("num");
	UserinfoDao dao=new UserinfoDao();
	UserinfoDto dto=dao.getData(num);
%>
<body>

<form action="updateaction.jsp" method="post" name="frm">
	<table class="table table=bordered" style="width: 400px;">
		<caption>유저 정보 수정</caption>
		<tr>
			<th width="100">이름</th>
			<td>
			<input type="hidden" name="num" size="2" value="<%=dto.getNum() %>">
			<input type="text" name="name" size="8" value="<%=dto.getName() %>">
			</td>
		</tr>
		<tr>
			<th>혈액형</th>
			<td><select name="blood" size="1">
			<%
			String[] btypes={"A","B","O","AB"};
			for (int i=0;i<btypes.length;i++) {
				if(dto.getBlood().equalsIgnoreCase(btypes[i])) {
				%>
				<option value="<%=btypes[i] %>" selected="selected"><%=btypes[i] %>형</option>
				<%} else {
				%>
				
				<option value="<%=btypes[i] %>"><%=btypes[i] %>형</option>
				<% }
			}
			%>
			</select></td>
		</tr>
		
		<tr>
			<%
				// 휴대폰 번호를 하나로 묶었던 것을 다시 분리 >> StringTokenizer(자를 문자열, 구분자)
				StringTokenizer st=new StringTokenizer(dto.getHp(),"-");
				// .nextToken(): 구분자를 기준으로 잘라낸 문자열
				String acode=st.nextToken();
				String hp1=st.nextToken();
				String hp2=st.nextToken();
			%>
			<th>연락처</th>
			<td>
			<select name="acode">
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
			<b>-</b>
			<input type="text" name="hp1" max="4" size="3" value="<%=hp1 %>">
			<b>-</b>
			<input type="text" name="hp2" max="4" size="3" value="<%=hp2 %>">
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
			<input type="date" name="birth" value="<%=dto.getBirth() %>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="hidden" name="num" size="2" value="<%=dto.getNum() %>">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='userlist.jsp'">
			</td>
		</tr>	
	</table>
</form>

</body>
</html>