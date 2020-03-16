package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class PlayLog {
	
	private int no;
	private int gameNo;
	private int qiNo;
	private int sendUserNo;
	private int receiveUserNo;
	private String acCheck;
	private Timestamp regdate;
	
	public PlayLog() {
		// TODO Auto-generated constructor stub
	}

	public PlayLog(int no, String acCheck) {
		this.no = no;
		this.acCheck = acCheck;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGameNo() {
		return gameNo;
	}

	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
	}

	public int getQiNo() {
		return qiNo;
	}

	public void setQiNo(int qiNo) {
		this.qiNo = qiNo;
	}

	public int getSendUserNo() {
		return sendUserNo;
	}

	public void setSendUserNo(int sendUserNo) {
		this.sendUserNo = sendUserNo;
	}

	public int getReceiveUserNo() {
		return receiveUserNo;
	}

	public void setReceiveUserNo(int receiveUserNo) {
		this.receiveUserNo = receiveUserNo;
	}

	public String getAcCheck() {
		return acCheck;
	}

	public void setAcCheck(String acCheck) {
		this.acCheck = acCheck;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}
