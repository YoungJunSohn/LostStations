package com.spoon.loststations.vo;

import java.sql.Timestamp;

public class QuizExp {
	
	private int no;
	private int qiNo;
	private String type;
	private String content;
	private int userNo;
	private Timestamp regdate;
	private String question;
	private String explain;

	public QuizExp() {
		// TODO Auto-generated constructor stub
	}

	public QuizExp(int qiNo, int userNo, String content, String type) {
		// TODO Auto-generated constructor stub]
		this.qiNo = qiNo;
		this.userNo = userNo;
		this.content = content;
		this.type = type;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
}
