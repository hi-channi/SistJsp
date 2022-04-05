<?xml version="1.0" encoding="UTF-8"?>
<%@page import="memo.MemoDto"%>
<%@page import="memo.MemoDao"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<data>

<%
	// 가져올(수정할) 메모의 번호 읽기
	String num=request.getParameter("num");
	
	// 데이터 가져오는 메소드 호출
	MemoDao dao=new MemoDao();
	MemoDto dto=dao.getData(num);
%>

<num><%=dto.getNum() %></num>
<writer><%=dto.getWriter() %></writer>
<content><%=dto.getContent() %></content>
<avatar><%=dto.getAvatar() %></avatar>
<writeday><%=dto.getWriteday() %></writeday>

</data>