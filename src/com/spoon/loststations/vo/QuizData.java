package com.spoon.loststations.vo;

public class QuizData {
    private int userNo;
    private int adoptNum;
    private int adoptTotal;

    private int correctNum;
    private int dropNum;
    private int crCheckTotal;
    private int total;
    
    
    
    public QuizData() {
		// TODO Auto-generated constructor stub
	}
    
	public int getCrCheckTotal() {
		return crCheckTotal;
	}

	public void setCrCheckTotal(int crCheckTotal) {
		this.crCheckTotal = crCheckTotal;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCorrectNum() {
		return correctNum;
	}
	public void setCorrectNum(int correctNum) {
		this.correctNum = correctNum;
	}
	public int getDropNum() {
		return dropNum;
	}
	public void setDropNum(int dropNum) {
		this.dropNum = dropNum;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getAdoptNum() {
		return adoptNum;
	}
	public void setAdoptNum(int adoptNum) {
		this.adoptNum = adoptNum;
	}
	public int getAdoptTotal() {
		return adoptTotal;
	}
	public void setAdoptTotal(int adoptTotal) {
		this.adoptTotal = adoptTotal;
	}
    
}
