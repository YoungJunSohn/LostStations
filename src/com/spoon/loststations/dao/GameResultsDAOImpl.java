package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.GameResult;

@Repository
public class GameResultsDAOImpl implements GameResultsDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// insert GameResult
	@Override
	public int insert(GameResult gameResult) {
		return session.insert("play-logs.insertGameResult", gameResult);

	}// insert ()end

}// GameResultsDAO end
