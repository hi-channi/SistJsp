package memo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import mysql.db.DbConnect;

public class MemoDao {

	DbConnect db = new DbConnect();

	// 메모 추가 메서드
	public void insertMemo(MemoDto dto) {

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;

		String sql = "insert into memo values (null,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			// 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getAvatar());

			// 실행
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 전체 출력 메소드
	public List<MemoDto> getAllDatas() {

		List<MemoDto> list = new Vector<MemoDto>();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from memo order by num desc";

		try {
			pstmt = conn.prepareStatement(sql);

			// rs 얻기
			rs = pstmt.executeQuery();

			// db데이터를 읽어서 dto에 넣기
			while (rs.next()) {
				MemoDto dto = new MemoDto();
				dto.setNum(rs.getString("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
				dto.setAvatar(rs.getString("avatar"));
				dto.setWriteday(rs.getTimestamp("writeday"));

				// 다시 list에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return list;
	}

}