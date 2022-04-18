package data.dto;

import java.sql.Timestamp;

public class CartDto {
	private String idx;
	private String snum;
	private String num;
	private int cnt;
	private Timestamp cday;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getSnum() {
		return snum;
	}
	public void setSnum(String snum) {
		this.snum = snum;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Timestamp getCday() {
		return cday;
	}
	public void setCday(Timestamp cday) {
		this.cday = cday;
	}

}
