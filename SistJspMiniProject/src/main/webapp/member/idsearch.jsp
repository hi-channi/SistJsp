<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Yeon+Sung&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
body {
	margin: 10px 50px;
}
</style>
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String key=request.getParameter("key");
	
	if(key==null) {
		%>
		<form action="idsearch.jsp" method="post" class="form-inline" name="mfrm">
			<input type="hidden" name="key" value="result">
			<table>
				<tr>
					<td>
					
					<br>
					<img alt="" src="../image2/4.png" width="50" align="left">
					<b>사용할 아이디를 입력하세요.</b>
					<br>
					<input type="text" name="id" class="form-control" style="width: 150px;" required="required">
					<br>
					<button type="submit" class="btn btn-info btn-sm" style="margin-left: 50px;">중복체크</button>
					</td>
				</tr>
			</table>
		</form>
	<% } else {
		// 아이디 검증
		String id=request.getParameter("id");
		MemberDao dao=new MemberDao();
		System.out.println(id);
		boolean check=dao.isIdCheck(id);
		
		if(check) {
			%>
			<script type="text/javascript">
			alert("이미 사용 중인 아이디 입니다.");
			history.back();
			</script>
		<% } else { 
			%>
			<br>
			<h4 class="alert alert-success"><%=id %>는 사용가능합니다.</h4>
			<br>
			<button type="button" class="btn btn-warning btn-sm" id="btnuse" style="margin-left: 50px;" myid="<%=id %>" onclick="getId('<%=id %>')">사용하기</button>
			<button type="button" class="btn btn-warning btn-sm" id="btnuse" style="margin-left: 50px;"onclick="location.href='idsearch.jsp'">다시하기</button>
		<% } 
	}
%>

<script type="text/javascript">
/* 
// 방법 1 (사용하기 버튼에 임의로 생성한 myid 속성을 이용)
$("#btnuse").click(function() {
	var myid=$(this).attr("myid");
	// 부모창에 아이디 보내고 현재 창 닫기
	opener.frm.id.value=myid;
	window.close();
});
*/

// 방법 2 (사용하기 onclick 속성으로 id값을 넘김)
function getId(id) {
	opener.frm.id.value=id;
	window.close();
}
</script>

</body>
</html>