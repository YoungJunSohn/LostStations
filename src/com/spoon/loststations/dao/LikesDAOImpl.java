package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Like;

@Repository
public class LikesDAOImpl implements LikesDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public Like selectOne(Like like) {
		return session.selectOne("likes.selectOne", like);
	} // selectOne() end
	
	@Override
	public int selectCount(Like like) {
		return session.selectOne("likes.selectCount", like);
	} // selectOne() end
	
	@Override
	public int delete(Like like) {
		return session.delete("likes.delete", like);
	}// delete() end
	
	@Override
	public int insert(Like like) {
		return session.insert("likes.insert", like);
	}// insert() end

}// LikesDAO end
