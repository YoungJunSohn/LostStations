package com.spoon.loststations.service;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.QuizExp;
import com.spoon.loststations.vo.QuizInfo;

public interface QuizInfosService {
	
	public Map<String, Object> getRandomQuiz();
	public Map<String, Object> getList(int pageNo, PageVO pageVO);
	public int write(QuizInfo quizInfo, QuizExp quizExp, int chNo, String exp, String choice1, String choice2, String choice3, String choice4);

	//******************** 수정 **********************
	public Map<String, Object> getOneByQiNo(int no);
	//조회수 증가
	public int updateViews(int no,Set<Integer> quizNos,HttpSession session);
	//************************************************
	
	
	// ******************** 영준 start **********************
		public Map<String, Object> getVerifingList(int no, int verifiPageNoInteger, int userNo, int sort);

	// ******************** 영준 end **********************
	
}
