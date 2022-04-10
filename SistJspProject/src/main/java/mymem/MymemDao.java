package mymem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mysql.db.DbConnect;

public class MymemDao {
	
	DbConnect db=new DbConnect();
	
	// 데이터 입력
	public void insertMem(MymemDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into mymem values(null, ?, ?, ?, ?, ?, now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getEmail());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	// 모든 데이터 출력
	public List<MymemDto> getAllMem() {
		
		List<MymemDto> list=new ArrayList<MymemDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		String sql="select * from mymem order by num desc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MymemDto dto=new MymemDto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setEmail(rs.getString("email"));
				dto.setMday(rs.getTimestamp("mday"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	
	// num값에 의한 특정 데이터 출력
	
	
	// 데이터 삭제
	
	
	
	// 데이터 수정
	
	
	
	
}
