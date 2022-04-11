<%@page import="org.apache.jasper.compiler.NewlineReductionServletWriter"%>
<%@page import="member2.Member2Dao"%>
<%@page import="member2.Member2Dto"%>
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
function saveId(id) {
	//alert(id);
	// 부모창: opener
	opener.mfrm.id.value=id;
	window.close();
}

</script>
</head>
<body>

<%
	// 최초 호출 시 null값
	String key=request.getParameter("key");
	
	// key값이 없을 때 폼을 출력
	if(key==null) {
		%>
		<div style="margin: 30px 30px;">
			<form action="idcheck.jsp" method="post" class="form-inline">
			<b>아이디를 입력해주세요</b>
			<br>
			<br>
			<!-- key값 hidden으로 넘기기 -->
			<input type="hidden" name="key" value="ok">
			<input type="text" name="id" class="form-control input-sm" style="width: 130px; float: left;" required="required" autofocus="autofocus" placeholder="아이디 입력">
			<button type="submit" class="btn btn-success btn-sm" style="margin-left: 10px;">중복확인</button>
			</form>
		</div>
	
	<% } else {		// key값이 있을 경우 action을 처리
		String id=request.getParameter("id");
		Member2Dao dao=new Member2Dao();
		boolean pass=dao.isIdCheck(id);
			
			if(pass) {
			%>
			<div style="margin: 30px 30px;">
				<h5><%=id %>는 사용하실 수 없습니다.</h5>
				<img alt="" src="../image/2.png" width="60" align="left">
				<button type="button" class="btn btn-danger btn-sm" onclick="location.href='idcheck.jsp'">다시입력</button>
			</div>
		<% } else {		// 존재하지 않는 경우
			%>
	 		<div style="margin: 30px 30px;">
				<h5><%=id %>는 사용가능 합니다.</h5>
				<img alt="" src="../image/3.png" width="60" align="left">
				<button type="button" class="btn btn-info btn-sm" onclick="saveId('<%=id%>')">사용하기</button>
				<button type="button" class="btn btn-danger btn-sm" onclick="location.href='idcheck.jsp'">다시입력</button>
			</div>
		<% }
	}
%>

</body>
</html>