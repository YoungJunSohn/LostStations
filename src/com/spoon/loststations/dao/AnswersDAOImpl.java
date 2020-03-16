package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;

import com.spoon.loststations.vo.Answer;

public class AnswersDAOImpl implements AnswersDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public int answersDelete(int no) {
		// TODO Auto-generated method stub
		return session.delete("answers.answersDelete", no);
	}
	
	@Override
	public Answer answerSelectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("answers.answerSelectOne", no);
	}
	
	@Override
	public int answerInsert(Answer answer) {
		// TODO Auto-generated method stub
		return session.insert("answers.answerInsert", answer);
	}
}
