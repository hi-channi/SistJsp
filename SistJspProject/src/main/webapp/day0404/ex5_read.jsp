<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String name = request.getParameter("name");
	String item = request.getParameter("item");
	String price = request.getParameter("price");
	String color = request.getParameter("color");

	JSONObject ob = new JSONObject();
	ob.put("name", name);
	ob.put("item", item);
	ob.put("price", price);
	ob.put("color", color);
%>

<%=ob.toString()%>