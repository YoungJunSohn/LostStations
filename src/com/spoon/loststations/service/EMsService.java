package com.spoon.loststations.service;

import java.util.Map;

import com.spoon.loststations.vo.EM;


public interface EMsService {
	
	public boolean register(int qiNo,int userNo,
			String type,  String category, String question,
			String explanationQ, int mcAnswer, String[] mcChoice,
			String mcErrorExplanation, String quizType,int oxAnswer,
			String oxErrorExplanation,String explanationE);
	
	public Map<String, Object> errorCommentList(int page, int qiNo, int userNo);
	
	//오류채택
	public int adoptErrorComment(int qiNo, int emNo);

	
	////////////////////////ㅈㅎ////////////////////////////
	public Map<String, Object> getVerifyRanking(int page);

}
