package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class Choice {
	private int no;
	private int crNo;
	private int userNo;
	private String content;
	private Timestamp regdate;
	
	
	
	
	// 기본생성자
	public Choice() {
		// TODO Auto-generated constructor stub
	}
	
	public Choice(int crNo, int userNo, String content) {
		super();
		this.crNo = crNo;
		this.userNo = userNo;
		this.content = content;
	}


	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCrNo() {
		return crNo;
	}

	public void setCrNo(int crNo) {
		this.crNo = crNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

}//Choice end
