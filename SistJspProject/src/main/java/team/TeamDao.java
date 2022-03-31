package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class TeamDao {
	DbConnect db=new DbConnect();
	
	// 데이터 삽입(insert)
	public void teamInsert(TeamDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into team (name, driver, addr, writeday) values(?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());
			
			// 실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 테이블의 모든 데이터 가져오기
	public ArrayList<TeamDto> getAllDatas() {
		ArrayList<TeamDto> list=new ArrayList<TeamDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from team order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TeamDto dto=new TeamDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("addr"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				// 리스트에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	// 데이터 삭제(delete)
	public void teamDelete(String num) {
	
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from team where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, num);
			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
