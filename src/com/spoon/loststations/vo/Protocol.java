package com.spoon.loststations.vo;

import java.util.List;

public class Protocol {
	private int cmd, gameNo, li, logNo;
	private String acCheck;
	private User user;
	private List<User> users;
	private QuizInfo quizInfo;
	private List<QuizInfo> quizs;
	private GameUser gameUser;
	
	public Protocol() {
		// TODO Auto-generated constructor stub
	}

	public Protocol(int cmd, int gameNo) {
		this.cmd = cmd;
		this.gameNo = gameNo;
	}

	public Protocol(int cmd, QuizInfo quizInfo) {
		this.cmd = cmd;
		this.quizInfo = quizInfo;
	}
	
	public Protocol(int cmd, int gameNo, List<User> users) {
		this.cmd = cmd;
		this.gameNo = gameNo;
		this.users = users;
	}

	public GameUser getGameUser() {
		return gameUser;
	}

	public void setGameUser(GameUser gameUser) {
		this.gameUser = gameUser;
	}

	public String getAcCheck() {
		return acCheck;
	}

	public void setAcCheck(String acCheck) {
		this.acCheck = acCheck;
	}

	public int getLogNo() {
		return logNo;
	}

	public void setLogNo(int logNo) {
		this.logNo = logNo;
	}

	public int getLi() {
		return li;
	}

	public void setLi(int li) {
		this.li = li;
	}

	public List<QuizInfo> getQuizs() {
		return quizs;
	}
	
	public void setQuizs(List<QuizInfo> quizs) {
		this.quizs = quizs;
	}

	public QuizInfo getQuizInfo() {
		return quizInfo;
	}

	public void setQuizInfo(QuizInfo quizInfo) {
		this.quizInfo = quizInfo;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public Protocol(int cmd) {
		this.cmd = cmd;
	}

	public int getGameNo() {
		return gameNo;
	}

	public void setGameNo(int gameNo) {
		this.gameNo = gameNo;
	}

	public int getCmd() {
		return cmd;
	}

	public void setCmd(int cmd) {
		this.cmd = cmd;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}