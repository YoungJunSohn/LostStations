package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class User {
	
	//로그인한 유저를 모두 알아볼 수 있도록
	public static final String LOGIN_USER = "loginUser";
	
	private int no;
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String profileImage;
	private int playScore;
	private int registrationScore;
	private int verificationScore;
	private Timestamp regdate;
	
	private int tier;
	private int receiveUserNo;
	private int rank;
	///////////////////////////wogus///////////////////////////////
	private double winRate;
	private double correctRate;
	private double avgRank;
	private int countVerifiedQuiz;
	private double percentageOfVerification;
	private double otherUserCorrectRate;
	private int errorCount, verifyQuizAdoptCount, verifyQuizCount;
	///////////////////////////wogus///////////////////////////////
	
	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public static String getLoginUser() {
		return LOGIN_USER;
	}

	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getTier() {
		return tier;
	}

	public void setTier(int tier) {
		this.tier = tier;
	}

	public int getReceiveUserNo() {
		return receiveUserNo;
	}

	public void setReceiveUserNo(int receiveUserNo) {
		this.receiveUserNo = receiveUserNo;
	}

	public User(int no, String profileImage) {
		this.no = no;
		this.profileImage = profileImage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public int getPlayScore() {
		return playScore;
	}

	public void setPlayScore(int playScore) {
		this.playScore = playScore;
	}

	public int getRegistrationScore() {
		return registrationScore;
	}

	public void setRegistrationScore(int registrationScore) {
		this.registrationScore = registrationScore;
	}

	public int getVerificationScore() {
		return verificationScore;
	}

	public void setVerificationScore(int verificationScore) {
		this.verificationScore = verificationScore;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getCountVerifiedQuiz() {
		return countVerifiedQuiz;
	}

	public void setCountVerifiedQuiz(int countVerifiedQuiz) {
		this.countVerifiedQuiz = countVerifiedQuiz;
	}

	public double getPercentageOfVerification() {
		return percentageOfVerification;
	}

	public void setPercentageOfVerification(double percentageOfVerification) {
		this.percentageOfVerification = percentageOfVerification;
	}

	public double getOtherUserCorrectRate() {
		return otherUserCorrectRate;
	}

	public void setOtherUserCorrectRate(double otherUserCorrectRate) {
		this.otherUserCorrectRate = otherUserCorrectRate;
	}

	public int getErrorCount() {
		return errorCount;
	}

	public void setErrorCount(int errorCount) {
		this.errorCount = errorCount;
	}

	public int getVerifyQuizAdoptCount() {
		return verifyQuizAdoptCount;
	}

	public void setVerifyQuizAdoptCount(int verifyQuizAdoptCount) {
		this.verifyQuizAdoptCount = verifyQuizAdoptCount;
	}

	public int getVerifyQuizCount() {
		return verifyQuizCount;
	}

	public void setVerifyQuizCount(int verifyQuizCount) {
		this.verifyQuizCount = verifyQuizCount;
	}
	
	public double getWinRate() {
		return winRate;
	}

	public void setWinRate(double winRate) {
		this.winRate = winRate;
	}

	public double getCorrectRate() {
		return correctRate;
	}

	public void setCorrectRate(double correctRate) {
		this.correctRate = correctRate;
	}

	public double getAvgRank() {
		return avgRank;
	}

	public void setAvgRank(double avgRank) {
		this.avgRank = avgRank;
	}

}
