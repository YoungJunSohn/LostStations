package com.spoon.loststations.vo;

public class PlayData {
	private int userNo;
	private int correctNum;
	private int totalQuiz;
	
	private int rank1Count;
	private int rankSum;
	private int survivalTimeSum;
	private int totalGame;
	
	private int category;
	private int total;
	
	
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getCorrectNum() {
		return correctNum;
	}

	public void setCorrectNum(int correctNum) {
		this.correctNum = correctNum;
	}

	public int getTotalQuiz() {
		return totalQuiz;
	}

	public void setTotalQuiz(int totalQuiz) {
		this.totalQuiz = totalQuiz;
	}

	public int getTotalGame() {
		return totalGame;
	}

	public void setTotalGame(int totalGame) {
		this.totalGame = totalGame;
	}

	public int getRank1Count() {
		return rank1Count;
	}

	public void setRank1Count(int rank1Count) {
		this.rank1Count = rank1Count;
	}

	public int getRankSum() {
		return rankSum;
	}

	public void setRankSum(int rankSum) {
		this.rankSum = rankSum;
	}

	public int getSurvivalTimeSum() {
		return survivalTimeSum;
	}

	public void setSurvivalTimeSum(int survivalTimeSum) {
		this.survivalTimeSum = survivalTimeSum;
	}

	public PlayData() {
		// TODO Auto-generated constructor stub
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

}
