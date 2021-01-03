package com.min.edu.dto;

import java.io.Serializable;

public class Member_Dto implements Serializable {

	private static final long serialVersionUID = 228485998177039642L;
	
	private String id;
	private String pw;
	private String name;
	private String auth;
	private String delflag;
	private String regdate;

	public Member_Dto() {
	}

	public Member_Dto(String id, String pw, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
	}

	@Override
	public String toString() {
		return "Member_DTO [id=" + id + ", pw=" + pw + ", name=" + name + ", auth=" + auth + ", delflag=" + delflag
				+ ", regdate=" + regdate + "]";
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
