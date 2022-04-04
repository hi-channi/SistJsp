<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
DbConnect db=new DbConnect();
Connection conn=db.getConnection();
Statement stmt=null;

ResultSet rs=null;

String sql="select * from friend order by num";

try {
	stmt=conn.createStatement();
	rs=stmt.executeQuery(sql);
	
	//JSONObject가 들어가는 배열
	JSONArray arr=new JSONArray();
	
	while(rs.next()) {
		String num=rs.getString("num");
		String name=rs.getString("name");
		String hp=rs.getString("hp");
		String addr=rs.getString("addr");
		String joindate=rs.getString("joindate");
		
		//JSON 생성
		JSONObject ob=new JSONObject();
		
		// 데이터 넣기
		ob.put("num",num);
		ob.put("name", name);
		ob.put("hp", hp);
		ob.put("addr", addr);
		ob.put("joindate",joindate);
		
		// array에 추가
		arr.add(ob);
	} 
	%>
	<%=arr.toString() %>
	
	<% } catch(SQLException e) {
	} finally {
		db.dbClose(rs, stmt, conn);
	}
%>