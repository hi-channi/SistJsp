<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String num=request.getParameter("num");

	GuestDao dao=new GuestDao();
	
	// num에 해당하는 Likecnt 증가
	dao.updateLikes(num);
	
	// 증가된 Like값을 JSON으로 반환
	int likes=dao.getData(num).getLikecnt();
	JSONObject ob=new JSONObject();
	ob.put("likes", likes);
%>

<%=ob.toString()  %>