package com.spoon.loststations.dao;

import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Answer;

@Repository
public interface AnswersDAO {

	//재현
	public int answersDelete(int no);
	public Answer answerSelectOne(int no);
	public int answerInsert(Answer answer);
}
