<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="board.BoardDao"%>
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
div.list {
	padding-top: 50px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<!-- 페이징 처리 -->
<%
	BoardDao dao=new BoardDao();
	//Vector<BoardDto> list=dao.getAllBoard();
	SimpleDateFormat sdf=new SimpleDateFormat("yy.MM.dd\nHH:mm");
	
	// (순서대로) 총 게시글 수, 각 블럭의 시작 페이지, 각 블럭의 끝 페이지, 각 페이지의 시작 번호, 각 페이지의 끝 번호, 현재 페이지
	int totalCount, totalPage, startPage, endPage, start, end, currentPage;		
	int perPage=4;		// 한 페이지에 노출될 게시글 수
	int perBlock=3;		// 한 블럭 당 보여지는 페이지
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
	List<BoardDto> list=dao.getList(start, perPage);
	
	// 각 게시글 앞에 붙일 시작번호 구하기
	// 총 게시글이 20개 >> 1페이지 20, 2페이지 15부터 출력 시작해 1씩 감소
	no=totalCount-(currentPage-1)*perPage;
%>

<div class="list">
<table class="table table-hover" style="width: 800px;">
	<caption>게시판 목록&nbsp;<span class="badge">총 <%=totalCount %>개</span>&nbsp;
		<button class="btn btn-success btn-xs glyphicon glyphicon-pencil" onclick="location.href='boardform.jsp'">작성하기</button>
	</caption>
	
	<tr align="center">
		<th width="75">No</th>
		<th width="380">제목</th>
		<th width="120">작성자</th>
		<th width="150">작성일</th>
		<th width="75">조회</th>
	</tr>
	<% if(list.size()==0) {
		%>
		<tr>
			<td colspan="8" align="center">
			<b>등록된 게시글이 없습니다.</b>
			</td>
		</tr>
	<% } else {
			for(BoardDto dto:list) {
		%>
		<tr>
			<td align="center"><%=no-- %></td>
			<td><img alt="" src="../photo/<%=dto.getImgname() %>" style="width: 30px; height: 30px;"> 
			&nbsp;<a href="content.jsp?num=<%=dto.getNum() %>"><%=dto.getSubject() %></a>
			</td>
			<td><%=dto.getWriter() %></td>
			<td><%=sdf.format(dto.getWday()) %></td>
			<td align="center"><%=dto.getReadcount() %></td>
		</tr>
		<% }
	}%>
	</table>
</div>

<!-- 페이징 처리(네비게이션 바) -->
<div style="width: 500px; text-align: center;" class="container">
 <ul class="pagination">
         <%
         //이전
         if(startPage>1){
         	%>
			<li>
				<a href="boardlist.jsp?currentPage=<%=startPage-1%>">이전</a>
			</li>
         <%}
         for(int pg=startPage;pg<=endPage;pg++) {
			if(pg==currentPage) {
			%>
			<li class="active">
				<a href="boardlist.jsp?currentPage=<%=pg %>"><%=pg %></a>
			</li>
			<% } else {
				%>
				<li>
					<a href="boardlist.jsp?currentPage=<%=pg %>"><%=pg %></a>
				</li>
			<%}
		}
		//다음
		if(endPage<totalPage){
			%>
			<li>
				<a href="boardlist.jsp?currentPage=<%=endPage+1%>">다음</a>
 			</li>
         <% }
         %>
  </ul>
</div>

</body>
</html>