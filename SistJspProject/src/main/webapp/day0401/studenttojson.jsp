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
			data+="\"num\":"+num+",\"name\":\""+name+"\",\"photo\":\""+photo;
			data+="\",\"score\":{\"java\":"+java+",\"spring\":"+spring+"}";
			data+="},";
		}
	
		// 마지막 데이터 행 이후 생성되는 콤마 제거
		data=data.substring(0, data.length()-1);
	} catch (SQLException e) {	
	} finally {
		db.dbClose(rs, pstmt, conn);
	}
	
	data+="]";
	// 코드 오류 없는데 "]"만 출력될 경우 반드시 생성한 테이블에 데이터 있는지 체크할 것
	// 탈출문자 유의해 출력문 작성
%>

<%=data %>