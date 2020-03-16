package com.spoon.loststations.dao;

import com.spoon.loststations.vo.QuizExp;

public interface QuizExpsDAO {

	public int insert(QuizExp quizExp);
	public QuizExp selectOne(int qeNo);

}
