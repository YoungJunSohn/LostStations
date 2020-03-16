package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class Correct {
	private int no;
	private int qiNo;
	private int chNo;
	private int userNo;
	private Timestamp regdate;
	
	
	
	public Correct update(int qiNo, int chNo) {
		this.qiNo = qiNo;
		this.chNo = chNo;
		
		return this;
	}//update() end
	
	
	public Correct() {
		// TODO Auto-generated constructor stub
	}

	public Correct(int qiNo, int userNo) {
		// TODO Auto-generated constructor stub
		this.qiNo = qiNo;
		this.userNo = userNo;
	}
	
	public Correct(int qiNo, int chNo, int userNo) {
		super();
		this.qiNo = qiNo;
		this.chNo = chNo;
		this.userNo = userNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getQiNo() {
		return qiNo;
	}

	public void setQiNo(int qiNo) {
		this.qiNo = qiNo;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
