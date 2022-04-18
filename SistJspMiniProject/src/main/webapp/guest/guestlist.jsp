<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.GuestDao"%>
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
span.day {
	float: right;
	font-size: 11pt;
	color: gray;
}
</style>
<script type="text/javascript">
$(function () {
	$("span.likes").click(function() {
		var num=$(this).attr("num");
		var tag=$(this);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"guest/ajaxlikecount.jsp",
			data:{"num":num},
			success: function (data) {
				// 텍스트로 변환 >> next()를 다음 태그에 likecnt값을 받음
				tag.next().text(data.likes);
				tag.next().next().animate({"font-size": "15px"}, 1000, function () {	// 추천 클릭 시 애니메이션 작동
				$(this).css("font-size","0px");
				});
			}
		});
	});
	/* 댓글창 기본값: 숨기기 >> 클릭 시: 보이기(toggle) */
	$("div.answer").hide();
	$("span.answer").click(function() {
		$(this).parent().find("div.answer").toggle();
	});
	
	/* 댓글 삭제 이벤트 */
	$("span.del").click(function() {
		var idx=$(this).attr("idx");
		
		$.ajax({
			type:"get",
			dataType: "html",
			data: {"idx":idx},
			url: "guest/answerdelete.jsp",
			success: function () {
				location.reload();
			}
		});
	});
});
</script>
</head>

<%
	// 로그인 상태(세션) 확인 후 입력 폼 나타내기
	String loginOk=(String)session.getAttribute("loginOk");
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd HH:mm");

	/* 페이징 처리 */
	GuestDao dao=new GuestDao();
	
	// (순서대로) 총 게시글 수, 각 블럭의 시작 페이지, 각 블럭의 끝 페이지, 각 페이지의 시작 번호, 각 페이지의 끝 번호, 현재 페이지
	int totalCount, totalPage, startPage, endPage, start, end, currentPage;		
	int perPage=3;		// 한 페이지에 노출될 게시글 수
	int perBlock=5;		// 한 블럭 당 보여지는 페이지
	int no;		// 게시글 번호
	
	// 총 게시글 수
	totalCount=dao.getTotalCount();
	
	// 현재 페이지 번호 읽기(단, null일 경우에는 1페이지로 설정)
	if(request.getParameter("currentPage")==null) {
		currentPage=1;
	} else {
		currentPage=Integer.parseInt(request.getParameter("currentPage"));
	}
	
	// 총 페이지 개수 구하기
	totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);
	// 총 페이지를 한 페이지 당 게시글 수로 나눴을 때 나누어 떨어지지 않을 경우 1(한 페이지가 추가)로 설정
	
	// 각 블럭의 시작페이지
	// ex) 현재 페이지가 3인 경우 >> startPage=1, endPage=5 / 현재 페이지가 6인 경우 >> startPage=6, endPage=10
	startPage=(currentPage-1)/perBlock*perBlock+1;
	endPage=startPage+perBlock-1;
	
	// 만약 총 페이지가 8, -2번째 블럭: 6-10 >> 이 경우에 endPage는 8로 수정되어야 함
	if(endPage>totalPage) {
		endPage=totalPage;
	}
	// 각 페이지에서 불러올 시작번호
	start=(currentPage-1)*perPage;
	
	// 각 페이지에서 필요한 게시글 가져오기
	List<GuestDto> list=dao.getList(start, perPage);
	
	// 각 게시글 앞에 붙일 시작번호 구하기
	// 총 게시글이 20개 >> 1페이지 20, 2페이지 15부터 출력 시작해 1씩 감소
	no=totalCount-(currentPage-1)*perPage;
%>

<body>

<div>
<%
	if(loginOk!=null) {		// 로그인 상태
		%>
		<jsp:include page="guestform.jsp"/>
		<hr align="left" width="700">
<% } 
%>
<br>
<b>방명록&nbsp;<span class="badge"> <%=totalCount %> </span>&nbsp;</b>
<br>
<%
	if(loginOk==null || loginOk.equals("")) {		// 로그인 상태
		%>
		<i style="font-size: 9pt;">방명록을 작성하기 위해서는 <a href="index.jsp?main=login/loginform.jsp">로그인</a> 해야합니다.</i>
		
<% } 
	MemberDao mdao=new MemberDao();
	for(GuestDto dto:list) {
		// 이름 얻기
		String name=mdao.getName(dto.getMyid());
		%>
	<br>
	<table class="table table-bordered" style="width: 600px;">
	<tr>
		<td>
			<b><span class="glyphicon glyphicon-user"></span><%=name %>(<%=dto.getMyid() %>)</b>
			<%
			// 로그인 한 아이디
			String myid=(String)session.getAttribute("id");
			// 로그인 한 아이디 = 글 작성한 아이디 >> 수정, 삭제 가능
			if(loginOk!=null && dto.getMyid().equals(myid)) {
				%>
				<!-- 페이징 처리 후에는 반드시 num값 뿐만 아니라 currentPage도 같이 넘겨줄 것 -->
				&nbsp;<a href="index.jsp?main=guest/guestupdateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>">수정</a>
				&nbsp;|&nbsp;<a href="index.jsp?main=guest/guestdeleteaction.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" onclick="return guestDel()">삭제</a>
		<% }
		%>
		<span class="day"><%=sdf.format(dto.getWriteday()) %></span>	
		</td>
	</tr>
	<tr height="120">
		<td>
			<a href="save/<%=dto.getPhotoname() %>" target="_blank">
			<img alt="" src="save/<%=dto.getPhotoname() %>" align="left" style="width: 120px;">
			</a>
			&nbsp;<%=dto.getContent().replace("\n","<br>&nbsp;") %> 
		</td>
	</tr>
	<!-- 댓글, 추천 -->
	<%
		// 각 방명록에 달린 댓글 목록 가져오기
		AnswerDao adao=new AnswerDao();
		List<AnswerDto> alist=adao.getAllAnswer(dto.getNum());
	%>
	<tr>
		<td>
			<span class="answer" style="cursor: pointer;" num=<%=dto.getNum() %>>댓글 <%=alist.size() %> </span>
			<span class="likes" style="cursor: pointer;" num=<%=dto.getNum() %>>추천</span>
			<span class="likecnt"><%=dto.getLikecnt() %></span>
			<span class="glyphicon glyphicon-heart" style="color: red; font-size: 0pt;"></span>
		<!-- 댓글 작성 폼, 댓글 목록 -->
		<div class="answer">
		<%
			if(loginOk!=null) {
				%>
				<div class="answerform">
					<form action="guest/answerinsert.jsp" method="post">
						<table>
							<tr>
								<td width="480">
								<input type="hidden" name="num" value="<%=dto.getNum() %>">
								<input type="hidden" name="myid" value="<%=myid%>">
								<input type="hidden" name="currentPage" value="<%=currentPage%>">
								<textarea style="width: 470px; height: 70px;" name="content" required="required" class="form-control"></textarea>
								</td>
								<td>
									<button type="submit" class="btn btn-info" style="width: 70px; height: 70px;">등록</button>
								</td>
							</tr>
						</table>		
					</form>
				</div>
		<% }
		%>
		<div class="answerlist">
			<table>
			<%
			for(AnswerDto adto:alist) {
				%>
				<tr>
					<td width="60" align="left">
						<span class="glyphicon glyphicon-user" style="font-size: 20pt;"></span>
					</td>
					<td>
					<%
						String aname=mdao.getName(adto.getMyid());
					%>
					<br>
					<b><%=aname %></b>&nbsp;
					<%
					// 글 작성자와 댓글 작성자가 같을 경우
					if(dto.getMyid().equals(adto.getMyid())) {
						%>
						<span class="badge">작성자</span>
					<% }
					%>
					<span style="font-size:9pt; color: gray; margin-left: 20px;"><%=sdf.format(adto.getWriteday()) %></span>
					<%
					// 댓글 삭제는 로그인 중이면서 로그인한 아이디 = 댓글 작성 아이디일 경우 삭제 아이콘 노출
					if(loginOk!=null && adto.getMyid().equals(myid)) {
						%>
						<span class="glyphicon glyphicon-remove del" idx="<%=adto.getIdx() %>" style="margin-left: 10px;"></span>
					<% }
					%>
					<br>
					<span style="font-size: 10px;"><%=adto.getContent().replace("\n", "<br>&nbsp;") %></span>
					</td>
				</tr>
			<% } 
			%>
			</table>
		</div>
		
		</div>
		</td>
	</tr>
</table>
	
<% }
%>
</div>

<script type="text/javascript">
// 삭제 버튼 클릭 시 즉시 href 링크로 이동하지 않고 확인창을 띄움
function guestDel() {
	return confirm("삭제하시겠습니까?");
}

</script>

<!-- 페이징 처리(네비게이션 바) -->
<div style="width: 500px; text-align: center;" class="container">
	<ul class="pagination">
	<%
		//이전
		if(startPage>1){
			%>
			<li>
				<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=startPage-1%>">이전</a>
			</li>
		<% }
		for(int pg=startPage;pg<=endPage;pg++) {
			if(pg==currentPage) {
				%>
				<li class="active">
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pg %>"><%=pg %></a>
				</li>
			<% } else {
				%>
				<li>
					<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=pg %>"><%=pg %></a>
				</li>
			<% }
		}
	//다음
		if(endPage<totalPage){
			%>
			<li>
				<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%=endPage+1%>">다음</a>
			</li>
		<% }
	%>
	</ul>
</div>

</body>
</html>