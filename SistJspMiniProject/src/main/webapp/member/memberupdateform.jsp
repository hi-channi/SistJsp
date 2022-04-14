<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
form {
	padding-top: 30px;
	font-family: 'Noto Sans KR';
	display: flex;
	justify-content: center;
}
tr>th {
	text-align: center;
}
</style>
<script type="text/javascript">
$(function () {
	// 이메일 선택 이벤트
	$("#selemail").change(function () {
		if($(this).val()=="") {
			$("#email2").val("");
		} else {
			$("#email2").val($(this).val());
		} 
	});
});

// 아이디 입력 이벤트
function idcheck() {
	window.open('member/idsearch.jsp' ,"", "left=1200px, top=300px, width=400px, height=200px");
}
	
// 비밀번호 검증 이벤트
function check(form) {
	if(form.pw.value!==form.mpw.value) {
		alert("비밀번호가 일치하지 않습니다");
		form.pw.value="";
		form.mpw.value="";
		return false;
	}
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function search_DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("zipcode").value = extraAddr;
                
                } else {
                    document.getElementById("addr1").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	
	
	MemberDao dao=new MemberDao();
	MemberDto dto=dao.getDate(num);
	
	StringTokenizer stAddr=new StringTokenizer(dto.getAddr(),"?");
	
	String addr1=stAddr.nextToken();
	String addr2=stAddr.nextToken();
	String zipcode=stAddr.nextToken();
	
	StringTokenizer stEmail=new StringTokenizer(dto.getEmail(),"@");
	
	String email1=stEmail.nextToken();
	String email2=stEmail.nextToken();
%>

<form action="member/memberupdate.jsp" method="post" class="form-inline" name="frm" onsubmit="return check(this)">
	<table class="table table bordered" style="width: 700px;">
		<caption>회원정보 수정</caption>
		<tr>
			<th width="100" bgcolor="#aaa">아이디</th>
			<td>
				<input type="text" class="form-control" name="id" readonly="readonly" style="width: 150px;" value="<%=dto.getId() %>">
				<input type="hidden" class="form-control" name="num" value="<%=num %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">암호</th>
			<td>
				<input type="password" class="form-control" name="pw" placeholder="비밀번호" style="width: 150px;">
				&nbsp;<input type="password" class="form-control" name="mpw" placeholder="비밀번호 확인" style="width: 150px;">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">이름</th>
			<td>
				<input type="text" class="form-control" name="name" placeholder="이름 입력" required="required" style="width: 120px;" value="<%=dto.getName() %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">연락처</th>
			<td>
				<input type="text" class="form-control" name="hp" placeholder="하이픈(-)포함 입력" required="required" style="width: 200px;" value="<%=dto.getHp() %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">주소</th>
			<td>
				<input type="text" class="form-control" name="zipcode" id="zipcode" readonly="readonly" style="width: 100px;" value="<%=zipcode.replace("?", "").replace("(", "").replace(")", "") %>">
				<button type="button" class="btn btn-success btn-sm" onclick="search_DaumPostcode()">찾기</button>
				<input type="text" class="form-control" name="addr1" id="addr1" readonly="readonly" style="width: 200px;" value="<%=addr1.replace("?", "") %>">
				<input type="text" class="form-control" name="addr2" id="addr2" required="required" style="width: 358px;" value="<%=addr2.replace("?", "") %>">
			</td>
		</tr>
		<tr>
			<th width="100" bgcolor="#aaa">이메일</th>
			<td>
				<input type="text" class="form-control" name="email1" required="required" style="width: 120px;" value="<%=email1 %>">&nbsp;@
				<input type="text" class="form-control" name="email2" id="email2" required="required" style="width: 120px;" value="<%=email2 %>">
				<select class="form-control" id="selemail" onkeyup="selemail(this)">
					<option value="">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="nate.com">nate.com</option>
					<option value="gmail.com">gmail.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-default">수정하기</button>&nbsp;
				<button type="reset" class="btn btn-default">다시작성</button>			
			</td>
		</tr>
	</table>
</form>

</body>
</html>