package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class Report {
	
	private int no;
	private int userNo;
	private String contentType;
	private int contentNo;
	private String reasonType;
	private Timestamp regdate;
	
	
	public Report() {
		// TODO Auto-generated constructor stub
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getContentType() {
		return contentType;
	}


	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


	public int getContentNo() {
		return contentNo;
	}


	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}


	public String getReasonType() {
		return reasonType;
	}


	public void setReasonType(String reasonType) {
		this.reasonType = reasonType;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}
