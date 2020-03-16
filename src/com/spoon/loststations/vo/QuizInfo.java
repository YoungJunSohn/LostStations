package com.spoon.loststations.vo;

import java.sql.Timestamp;
import java.util.List;

public class QuizInfo {
	
	//SQL구문을 사용하기 위해 추가함
	private int no;
	private String type;
	private int category;
	private int qNo;
	private int eNo;
	private int crNo;
	private int chNo; //정답보기 정보
	private int userNo;
	private int likes;
	private int dislikes;
	private int views;
	private Timestamp regdate;
	private String nickname;//user 테이블의 nickname
	private String content;//QE 테이블의 content
	private List<Choice> choices; //4지선다 정보를 리스트로 가져옴
	private List<Choice> oxChoices;// ox퀴즈 정보를 리스트로 가져옴
	private String profileImage;//프로필사진
	private int emCount;//오류 댓글 수
	private int commentCount;//의견 댓글 수
	private String quizContent;
	private String expContent;

	
	
	public String getQuizContent() {
		return quizContent;
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
	public QuizInfo(String type, int category, int userNo) {
		super();
		this.type = type;
		this.category = category;
		this.userNo = userNo;
	}
	public QuizInfo update(int qNo,int eNo,int crNo) {
		this.qNo = qNo;
		this.eNo = eNo;
		this.crNo = crNo;
		
		return this;
	}//update() end
	
	public String getProfileImage() {
		return profileImage;
	}


	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}


	public int getEmCount() {
		return emCount;
	}


	public void setEmCount(int emCount) {
		this.emCount = emCount;
	}


	public int getCommentCount() {
		return commentCount;
	}


	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}


	public int getChNo() {
		return chNo;
	}


	public void setChNo(int chNo) {
		this.chNo = chNo;
	}


	public List<Choice> getOxChoices() {
		return oxChoices;
	}


	public void setOxChoices(List<Choice> oxChoices) {
		this.oxChoices = oxChoices;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public QuizInfo() {
		// TODO Auto-generated constructor stub
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getCategory() {
		return category;
	}


	public void setCategory(int category) {
		this.category = category;
	}


	public int getqNo() {
		return qNo;
	}


	public void setqNo(int qNo) {
		this.qNo = qNo;
	}


	public int geteNo() {
		return eNo;
	}


	public void seteNo(int eNo) {
		this.eNo = eNo;
	}


	public int getCrNo() {
		return crNo;
	}


	public void setCrNo(int crNo) {
		this.crNo = crNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
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


	public int getViews() {
		return views;
	}


	public void setViews(int views) {
		this.views = views;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public List<Choice> getChoices() {
		return choices;
	}


	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}

	
}
