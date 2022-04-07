package Userinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import mysql.db.DbConnect;

public class UserinfoDao {
	
	DbConnect db=new DbConnect();
	
	public void insertInfo(UserinfoDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into userinfo values (null, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBlood());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getBirth());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}		
		
	}
	
	// 모든 데이터 가져오기
	public Vector<UserinfoDto> getAllDatas() {
		Vector<UserinfoDto> list=new Vector<UserinfoDto>();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		
		ResultSet rs=null;
		
		String sql="select * from userinfo order by num desc";
		
		try {
			stmt=conn.createStatement();
		
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				UserinfoDto dto=new UserinfoDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBlood(rs.getString("blood"));
				dto.setHp(rs.getString("hp"));
				dto.setBirth(rs.getString("birth"));
				
				// 단일 데이터를 출력하려면 쓰지 않음
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(stmt, conn);
		}
		
		return list;
	}
	
	// 데이터 지정 삭제
	public void deleteInfo(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from userinfo where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// PK(num)값에 의한 단일 데이터 가져오기
	public UserinfoDto getData(String num) {
		UserinfoDto dto=new UserinfoDto();
		
		Connection conn=db.getConnection();
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql="select * from userinfo where num="+num;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setBlood(rs.getString("blood"));
				dto.setHp(rs.getString("hp"));
				dto.setBirth(rs.getString("birth"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, stmt, conn);
		}
		return dto;
	}
	
	// 데이터 수정
	public void updateInfo(UserinfoDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update userinfo set name=?, blood=?, hp=?, birth=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBlood());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getNum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
