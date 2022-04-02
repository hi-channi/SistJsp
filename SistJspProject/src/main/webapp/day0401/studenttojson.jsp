<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysql.db.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

	DbConnect db=new DbConnect();
	Connection conn=db.getConnection();
	PreparedStatement pstmt=null;
	
	
	ResultSet rs=null;
	
	String sql="select * from student order by num";
	
	String data="[";
	
	try {
 		pstmt=conn.prepareStatement(sql);
 		rs=pstmt.executeQuery();
 		
		while(rs.next()) {
			String num=rs.getString("num");
			String name=rs.getString("name");
			String photo=rs.getString("photo");
			String java=rs.getString("java");
			String spring=rs.getString("spring");
		
			data+="{";
			data+="\"num\":"+num+",\"name\":"+name+",\"photo\":"+photo;
			data+=",\"score\":{\"java\":"+java+",\"spring\":"+spring+"}";
			data+="},";
		}
	
		data=data.substring(0, data.length()-1);
	} catch (SQLException e) {	
	} finally {
		db.dbClose(rs, pstmt, conn);
	}
	
	data+="]";
%>

<%=data %>