package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.EMCont;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.QuizData;
import com.spoon.loststations.vo.QuizInfo;

public interface QuizInfosDAO {

	public int updateViews(int no);
	public int updateLikes(int contentNo);
	public int updateDislikes(int contentNo);
	
	public QuizInfo selectOne(int qiNo);
	public QuizInfo selectQuizByNo(int no);
	
	public QuizInfo selectRandomOne();
	public int insert(QuizInfo quizInfo);
	public int update(QuizInfo quizInfo);
	public int selectQuizListTotal(PageVO pageVO);
	public List<QuizInfo> selectQuizList(PageVO page);
	public QuizData selectUserAdoptInfo(int userNo);
	public int selectUserAdoptQuizListTotal(int userNo);
	public List<QuizInfo> selectUserAdoptQuizList(PageVO page);
	public int selectVerifiQuizListTotal(int userNo);
	public List<QuizInfo> selectVerifiQuizList(PageVO page);
	public int updateQNo(EMCont emCont);
	public int updateENo(EMCont emCont);
	public int updateCrNo(EMCont emCont);
	public int updateCateNo(EMCont emCont);
	
	public QuizInfo selectAdoptQuiz();
	public QuizInfo selectQuizOne(int qiNo);
	List<QuizInfo> selectAdopt6List();

}
