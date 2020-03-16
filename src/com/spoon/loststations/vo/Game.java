package com.spoon.loststations.vo;

import java.sql.Timestamp;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.WebSocketSession;

public class Game {
	
	private int no;
	private int tier;
	private Map<WebSocketSession, User> users;
	private Timestamp regdate;
	private boolean status;//true : 게임시작됨, false : 대기중
	
	public Game() {
		users = new ConcurrentHashMap<WebSocketSession, User>();
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getTier() {
		return tier;
	}

	public void setTier(int tier) {
		this.tier = tier;
	}

	public Map<WebSocketSession, User> getUsers() {
		return users;
	}

	public void setUsers(Map<WebSocketSession, User> users) {
		this.users = users;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	
	
}