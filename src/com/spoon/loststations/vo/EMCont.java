package com.spoon.loststations.vo;

import java.sql.Date;

public class EMCont {
	private int no;
	private int emNo;
	private String type;
	private int typeNo;
	private Date regdate;
	private int qiNo;
	
	public int getQiNo() {
		return qiNo;
	}

	public void setQiNo(int qiNo) {
		this.qiNo = qiNo;
	}

	public EMCont() {
		// TODO Auto-generated constructor stub
	}

	public EMCont(int emNo, String type, int typeNo) {
		// TODO Auto-generated constructor stub
		this.emNo = emNo;
		this.type = type;
		this.typeNo = typeNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getEmNo() {
		return emNo;
	}

	public void setEmNo(int emNo) {
		this.emNo = emNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
