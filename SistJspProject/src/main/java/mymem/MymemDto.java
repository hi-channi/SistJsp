package mymem;

import java.sql.Timestamp;

public class MymemDto {
	
	private String num;
	private String name;
	private String id;
	private String pw;
	private String hp;
	private String email;
	private Timestamp mday;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getMday() {
		return mday;
	}
	public void setMday(Timestamp mday) {
		this.mday = mday;
	}
	
}
