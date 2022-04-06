<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.AjaxboardDto"%>
<%@page import="ajaxboard.AjaxboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	//num 읽기
	String num=request.getParameter("num");
	
	// dao 선언
	AjaxboardDao db=new AjaxboardDao();
	
	// num에 해당하는 dto 읽기
	AjaxboardDto dto=db.getData(num);
	
	JSONObject ob=new JSONObject();
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	ob.put("num",dto.getNum());
	ob.put("writer", dto.getWriter());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("pfimg",dto.getPfimg());
	ob.put("writeday",sdf.format(dto.getWriteday()));

%>

<%=ob.toString() %>