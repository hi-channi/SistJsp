<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="ajaxboard.AjaxboardDao"%>
<%@page import="ajaxboard.AjaxboardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	AjaxboardDao db=new AjaxboardDao();
	
	ArrayList<AjaxboardDto> list=db.getAllDatas();
	JSONArray arr=new JSONArray();
	
	SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd hh:mm");
	
	for(AjaxboardDto dto:list) {
		JSONObject ob=new JSONObject();
		
		ob.put("num",dto.getNum());
		ob.put("writer", dto.getWriter());
		ob.put("subject",dto.getSubject());
		ob.put("content",dto.getContent());
		ob.put("pfimg",dto.getPfimg());
		ob.put("writeday",sdf.format(dto.getWriteday()));
		
		arr.add(ob);
	}
%>

<%=arr.toString() %>