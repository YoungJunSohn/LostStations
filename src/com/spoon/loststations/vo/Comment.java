package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class Comment {
	
	private int no;
	private int qiNo;
	private String content;
	private int userNo;
	private int likes;
	private int dislikes;
	private Timestamp regdate;
	private String nickname;
	private String profileImage;
	private int count;//코멘트 수 합산
	private String likeConfirm; // 좋아요 체크 여부 - 좋아요: L, 싫어요: D, 아무것도 아니면: N
	
	
	public String getLikeConfirm() {
		return likeConfirm;
	}

	public void setLikeConfirm(String likeConfirm) {
		this.likeConfirm = likeConfirm;
	}

	// 기본생성자
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	// 인자 3개짜리 생성자
	public Comment(int qiNo, String content, int userNo) {
		// TODO Auto-generated constructor stub
		this.qiNo = qiNo;
		this.content = content;
		this.userNo = userNo;
	}
	// getter, setter
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
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

}
