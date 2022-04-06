package ajaxboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mysql.db.DbConnect;

public class AjaxboardDao {

	DbConnect db = new DbConnect();

	// Insert
	public void insertBoard(AjaxboardDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into ajaxboard (writer, subject, content, pfimg, writeday) values (?, ?, ?, ?, now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPfimg());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	// getAllDatas
	 public ArrayList<AjaxboardDto> getAllDatas()
	   {
	      ArrayList<AjaxboardDto> list=new ArrayList<AjaxboardDto>();
	      
	      Connection conn=db.getConnection();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from ajaxboard order by num desc"; 
	      
	      try {
	         pstmt=conn.prepareStatement(sql);
	         rs=pstmt.executeQuery();
	         
	         while(rs.next())
	         {
	            AjaxboardDto dto=new AjaxboardDto();
	            
	            dto.setNum(rs.getString("num"));
	            dto.setWriter(rs.getString("writer"));
	            dto.setSubject(rs.getString("subject"));
	            dto.setContent(rs.getString("content"));
	            dto.setPfimg(rs.getString("pfimg"));
	            dto.setWriteday(rs.getTimestamp("writeday"));
	            
	            //list에 추가
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

	// getData
	public AjaxboardDto getData(String num) {
		
		AjaxboardDto dto=new AjaxboardDto();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from ajaxboard where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setPfimg(rs.getString("pfimg"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return dto;
	}
	
}
