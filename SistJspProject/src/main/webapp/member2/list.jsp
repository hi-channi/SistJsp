<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
div.list {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}

#profile {
	width: 70px;
	height: 70px;
	border: 1px solid gray;
	border-radius: 100px;
}
</style>
</head>
<body>

<%
	Member2Dao dao=new Member2Dao();
	Vector<Member2Dto> list=dao.getAllMember2();
	
	// 세션에 저장된 아이디 얻기
	String dbid=(String)session.getAttribute("id");
	String name=dao.getName(dbid);
%>

<div class="list">
<table class="table table-hover" style="width: 850px;">
	<caption>멤버 리스트&nbsp;<span class="badge">총 <%=list.size() %>명 </span>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<b><%=name %></b>님 환영합니다.
		<button class="btn btn-default btn-xs glyphicon glyphicon-log-out" onclick="location.href='../member2login/logoutproc.jsp'">로그아웃</button>
	</caption>
	<tr style="text-align: center;">
		<th width="50">No</th>
		<th width="80">이름</th>
		<th width="100">아이디</th>
		<th width="150">연락처</th>
		<th width="70">가입일</th>
		<th width="100"><span class="glyphicon glyphicon-cog"></span></th>
	</tr>
	
	<% SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd");
		if(list.size()==0) {
		%>
		<tr>
			<td colspan="6" align="center">
			<b>등록된 멤버가 없습니다.</b>
			</td>
		</tr>
	<% } else {
			for(int i=0;i<list.size();i++) {
			Member2Dto dto=list.get(i);
		%>
		<tr style="vertical-align: middle;">
			<td><%=i+1 %></td>
			<td align="center"><img id="profile" alt="" src="<%=dto.getPhoto() %>"><br><%=dto.getName() %></td>
			<td><%=dto.getId() %></td>
			<td><%=dto.getHp() %></td>
			<td><%=sdf.format(dto.getSdate()) %></td>
			<td>
			<!-- 회원목록에서 로그인한 멤버의 정보만 수정/삭제 권한 부여 -->
			<%
				String loginOK=(String)session.getAttribute("loginOK");
				String id=(String)session.getAttribute("id");
				
				// 해당 유저만 관리 버튼 출력
				if(loginOK!=null && dto.getId().equals(id)) {
					%>
					<!-- loginmain.jsp에서 이동하기 때문에 상대경로 올바르게 지정 -->
					<button type="button" class="btn btn-warning btn-sm glyphicon glyphicon-edit" style="width: 50px;" onclick="location.href='../member2/updateform.jsp?num=<%=dto.getNum() %>'"></button>
					<button type="button" class="btn btn-danger btn-sm glyphicon glyphicon-trash" style="width: 50px;" onclick="fundel(<%=dto.getNum() %>)"></button>
				<% } else {
				}%> 
			</td>
		</tr>
	<% }
	}%>
	
</table>
</div>

<script type="text/javascript">
function fundel(num) {
	alert(num);
	$("#btnmdel").attr("num",num);
	$("#member2DelModal").modal();
}
</script>

<div class="modal fade" id="member2DelModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">회원 탈퇴</h4>
			</div>
			<div class="modal-body">
				<p>탈퇴하시겠습니까?</p>
				<button type="button" class="btn btn-danger" id="btnmdel">탈퇴하기</button>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

</body>

<script type="text/javascript">
$("#btnmdel").click(function() {
	// num값 읽어오기
	var num=$(this).attr("num");
	alert(num);
	
	// 삭제 후 이동
	location.href="../member2/deletemember.jsp?num="+num;
});
</script>

</html>