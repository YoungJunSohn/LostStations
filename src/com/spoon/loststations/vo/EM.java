package com.spoon.loststations.vo;

import java.sql.Timestamp;
import java.util.List;

public class EM {
	private int no;
	private int qiNo;
	private int userNo;
	private String adoptCheck;
	private String likeConfirm;
	
	private int likes;
	private int dislikes;
	private Timestamp regdate;
	
	private String nickname;
	private String profileImage;
	
	private char type;
	private int categories;
	private String quiz;
	private String oxChoices;
	private String mcChoices;
	private String explanation;
	
	private int categoryNo;
	private String quizContent;
	private String expContent;
	private int correctContent;
	private List<Choice> choiceContent;
	
	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getQuizContent() {
		return quizContent;
	}

	public String getLikeConfirm() {
		return likeConfirm;
	}

	public void setLikeConfirm(String likeConfirm) {
		this.likeConfirm = likeConfirm;
	}
	public void setQuizContent(String quizContent) {
		this.quizContent = quizContent;
	}

	public String getExpContent() {
		return expContent;
	}

	public void setExpContent(String expContent) {
		this.expContent = expContent;
	}

	public int getCorrectContent() {
		return correctContent;
	}

	public void setCorrectContent(int correctContent) {
		this.correctContent = correctContent;
	}

	public List<Choice> getChoiceContent() {
		return choiceContent;
	}

	public void setChoiceContent(List<Choice> choiceContent) {
		this.choiceContent = choiceContent;
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

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	public int getCategories() {
		return categories;
	}

	public void setCategories(int categories) {
		this.categories = categories;
	}

	public String getQuiz() {
		return quiz;
	}

	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}

	public String getOxChoices() {
		return oxChoices;
	}

	public void setOxChoices(String oxChoices) {
		this.oxChoices = oxChoices;
	}

	public String getMcChoices() {
		return mcChoices;
	}

	public void setMcChoices(String mcChoices) {
		this.mcChoices = mcChoices;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}

	
	
	
	public EM() {
		// TODO Auto-generated constructor stub
	}

	public EM(int qiNo, int userNo) {
		// TODO Auto-generated constructor stub
		this.qiNo = qiNo;
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

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAdoptCheck() {
		return adoptCheck;
	}

	public void setAdoptCheck(String adoptCheck) {
		this.adoptCheck = adoptCheck;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getDislikes() {
		return dislikes;
	}

	public void setDislikes(int dislikes) {
		this.dislikes = dislikes;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}
