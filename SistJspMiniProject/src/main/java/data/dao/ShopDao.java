package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.CartDto;
import data.dto.ShopDto;
import mysql.db.DbConnect;

public class ShopDao {
	DbConnect db=new DbConnect();

	// 상품 데이터 추가
	public void insertItem(ShopDto dto) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into shop values(null, ?, ?, ?, ?, ?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
		
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getItem());
			pstmt.setString(3, dto.getPhoto());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getIday());
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	// 전체 상품 데이터 가져오기
	public List<ShopDto> getAllItems() {
		
		List<ShopDto> list = new ArrayList<ShopDto>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from shop order by snum desc";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShopDto dto = new ShopDto();

				dto.setSnum(rs.getString("snum"));
				dto.setCategory(rs.getString("category"));
				dto.setItem(rs.getString("item"));
				dto.setPhoto(rs.getString("photo"));
				dto.setPrice(rs.getInt("price"));
				dto.setIday(rs.getString("iday"));

				list.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

	// 단일 상품 데이터 가져오기
	public ShopDto getItem(String num) {
		ShopDto dto = new ShopDto();

		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from shop where snum=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto.setSnum(rs.getString("snum"));
				dto.setItem(rs.getString("item"));
				dto.setPhoto(rs.getString("photo"));
				dto.setCategory(rs.getString("category"));
				dto.setIday(rs.getString("iday"));
				dto.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}

		return dto;
	}

	// 장바구니(cart)에 item 추가
	public void insertCart(CartDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into cart values (null,?,?,?,now())";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getSnum());
			pstmt.setString(2, dto.getNum());
			pstmt.setInt(3, dto.getCnt());

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}

	}

	// 장바구니 출력(Join)
	// idx, 상품명, 상품번호, 사진, 가격, 수량, 카트에 담은 날짜(id)
	public List<HashMap<String, String>> getCartList(String id) {
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select c.idx, s.item, s.snum, s.photo, s.price, c.cnt, c.cartday from cart c,"
				+ "shop s,member m where c.snum=s.snum and c.num=m.num and m.id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("idx", rs.getString("idx"));
				map.put("item", rs.getString("item"));
				map.put("snum", rs.getString("snum"));
				map.put("photo", rs.getString("photo"));
				map.put("price", rs.getString("price"));
				map.put("cnt", rs.getString("cnt"));
				map.put("cday", rs.getString("cday"));

				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}

}