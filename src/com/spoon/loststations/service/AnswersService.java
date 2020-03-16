package com.spoon.loststations.service;

import java.util.Map;

import com.spoon.loststations.vo.Answer;

public interface AnswersService {
	
	//재현
	public Map<String, Object> getReply(int no);
	public int registerReply(Answer answer);
	//재현
	
}//AnswersService end
