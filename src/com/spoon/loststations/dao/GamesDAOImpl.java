package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Game;
import com.spoon.loststations.vo.QuizItem;

@Repository
public class GamesDAOImpl implements GamesDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// insert Games
	@Override
	public int insert(Game game) {
		return session.insert("games.insertGame", game);
	}// insert ()end
	
	@Override
	public List<QuizItem> selectList() {
		return session.selectList("games.selectList");
	}
	
}// GamesDAO end
