package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class GameUser {
	
	private int no;
	private int gameNo;
	private int userNo;
	private int rank;
	private int survivalTime;
	private Timestamp regdate;
	
	public GameUser() {
		// TODO Auto-generated constructor stub
	}

	public GameUser(int gameNo, int userNo) {
		this.gameNo = gameNo;
		this.userNo = userNo;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getSurvivalTime() {
		return survivalTime;
	}

	public void setSurvivalTime(int survivalTime) {
		this.survivalTime = survivalTime;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}
