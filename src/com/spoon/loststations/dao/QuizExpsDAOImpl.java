package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.QuizExp;

@Repository
public class QuizExpsDAOImpl implements QuizExpsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(QuizExp quizExp) {

		return session.insert("quiz-exps.insert", quizExp);
		// System.out.println(result);

	} // insert() end
	@Override
	public QuizExp selectOne(int qeNo) {

		return session.selectOne("quiz-exps.selectOne", qeNo);

	} // selectOne() end
}// QuizExpsDAO end
