package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.GameUser;
import com.spoon.loststations.vo.PlayData;

@Repository
public class GameUsersDAOImpl implements GameUsersDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public GameUser getOne(GameUser gameUser) {
		return session.selectOne("game-users.selectOne", gameUser);
	}
	
	@Override
	public PlayData selectUserNo(int userNo) {
		return session.selectOne("game-users.selectUserNo", userNo);
	}// selectUserNo() end

	// insert GameUsers
	@Override
	public int insert(GameUser gameUser) {
		return session.insert("game-users.insert", gameUser);
	}// insert ()end

}// GameUsersDAO end
