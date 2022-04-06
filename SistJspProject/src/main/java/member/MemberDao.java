package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import mysql.db.DbConnect;

public class MemberDao {

	DbConnect db=new DbConnect();
	
	// 데이터 추가(insert)
	public void insertMember(MemberDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into member (name, hp, sdate) values (?,?,now())";
		
		try {
			// 바인딩
			pstmt=conn.prepareStatement(sql);	// 미완성의 spl문 작성 시 활용
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			
			// 실행
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 모든 데이터 가져오기(select)
	public Vector<MemberDto> getAllDatas() {
		Vector<MemberDto> list=new Vector<MemberDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member order by num asc";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDto dto=new MemberDto();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
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
	
	// 특정 데이터 가져오기(select-where)
	public MemberDto getData(String num) {
		MemberDto dto=new MemberDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from member where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setHp(rs.getString("hp"));
				dto.setSdate(rs.getTimestamp("sdate"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
	// 특정 데이터 삭제(delete)
	public void deleteMember(String num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from member where num=?";
		
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
	
	// 특정 데이터 수정(update)
	public void updateMember(MemberDto dto) {
		//MemberDto dto=new MemberDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update member set name=?, hp=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			// 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setString(3, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
}
