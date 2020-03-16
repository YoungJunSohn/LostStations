package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Correct;

@Repository
public class CorrectsDAOImpl implements CorrectsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public int insert(Correct correct) {
		return session.insert("corrects.insert", correct);
	} // insert() end
	@Override
	public int updateAnswer(Correct correct) {
		return session.insert("corrects.updateAnswer", correct);
	} // insert() end
	@Override
	public int update(Correct correct) {
		return session.update("corrects.update", correct);
	}// update() end
	@Override
	public int insertOX(Correct correct) {
		return session.insert("corrects.insertOX", correct);
	}// insertOX() end
	@Override
	public Correct selectOne(int crNo) {
		return session.selectOne("corrects.selectOne", crNo);
	} // selectOne() end

}// CorrectsDAO end
