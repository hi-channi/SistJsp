package log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import mysql.db.DbConnect;

public class LogDao {
	DbConnect db=new DbConnect();
	
	// id를 통해 name값을 획득
	public String getName(String id) {
		String name="";
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from log where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
		
			if(rs.next()) {
				name=rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return name;
	}
	
	// 입력받은 id, pw가 db와 일치하는지 검증
	public boolean islogin(String id, String pw) {
		boolean flag=false;
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from log where id=? and pw=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				flag=true; // pw가 일치하는 데이터가 있으면 true
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	// id에 맞는 pw인지 확인하는 메소드2 (SQL Injection 공격) 
		public boolean islogin2(String id, String pw) {
			boolean flag=false;
			
			Connection conn=db.getConnection();
			Statement stmt=null;
			ResultSet rs=null;
			
			// 완성된 SQL 구문을 받는 Statement는 비밀번호 필드에 SQL 구문을 덧붙일 수 있기에 취약점 발생
			String sql="select * from log where id='"+id+"' and pw='"+pw+"'";
			
			try {
				stmt=conn.createStatement();
				
				rs=stmt.executeQuery(sql);
				
				if(rs.next()) {
					flag=true; // pw가 일치하는 데이터가 있으면 true
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				db.dbClose(rs, stmt, conn);
			}
			return flag;
		}
}
