<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
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
</head>

<%
	// snum(상품번호) 읽기
	String snum=request.getParameter("snum");
	
	// 로그인 상태 체크
	String loginOk=(String)session.getAttribute("loginOk");
	// 로그인 한 아이디
	String myid=(String)session.getAttribute("id");
	
	// Dao 선언 및 아이디에 해당하는 num(멤버번호) 읽기
	MemberDao mdao=new MemberDao();
	String num=mdao.getNum(myid);
	
	// 해당상품 하나의 데이터 가져오기 >> 디테일 페이지
	ShopDao sdao=new ShopDao();
	// num에 해당하는 dto 얻기
	ShopDto dto=sdao.getItem(snum);

%>

<body>

<form action="" id="frm">
	<input type="hidden" name="snum" value="<%=snum %>">
	<input type="hidden" name="num" value="<%=num %>">
		<table style="width: 800px;">
		<tr>
			<td style="width: 500px;">
			<div>
				<img alt="" src="shopsave/<%=dto.getPhoto() %>" class="large img-thumbnail">
			</div>
			</td>
			<td style="width: 300px;" valign="top">
				<h3>카테고리: <%=dto.getCategory() %></h3>
				<h3>상품명: <%=dto.getItem() %></h3>
				<%
					NumberFormat nf=NumberFormat.getCurrencyInstance();
				%>
				<h3>가격: <%=nf.format(dto.getPrice()) %></h3>
				<h3>갯수:
					<input type="number" min="1" max="10" value="1" step="1" name="cnt">
				</h3>
				<div style="margin-top: 200px; margin-left: 60px;">
					<button type="button" class="btn btn-success" id="btncart">장바구니</button>
					<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
				</div>
				</td>
				</tr>
		</table>
</form>

<script type="text/javascript">
$("#btncart").click(function () {
	var login="<%=loginOk %>";
	if(login=="null") {
		alert("먼저 로그인을 해주세요");
		return;
	}
	
	// form 태그의 모든 내용 가져오기
	var formdata=$("#frm").serialize();
	//alert(formdata);
	
	// ajax 처리 >> 성공 시 mycart.jsp로 이동
	$.ajax({
		type:"post",
		dataType:"html",
		data:formdata,
		url:"shop/detailprocess.jsp",
		success: function () {
			//alert("success");
			var msg=confirm("장바구니에 저장하였습니다. \n장바구니로 이동하려면 [확인]을 클릭하세요.");
			if(msg) {
				location.href="index.jsp?main=shop/mycart.jsp";
			}
		}
	});
});
</script>

</body>
</html>