package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.EMCont;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.QuizData;
import com.spoon.loststations.vo.QuizInfo;

@Repository
public class QuizInfosDAOImpl implements QuizInfosDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<QuizInfo> selectAdopt6List() {
		return session.selectList("quiz-infos.selectAdopt6List");
	}// updateViews() end
	
	@Override
	public QuizInfo selectQuizOne(int qiNo) {
		System.out.println("selectQuizOne : "+qiNo);
		return session.selectOne("quiz-infos.selectQuizOne", qiNo);
	}
	
	@Override
	public QuizInfo selectAdoptQuiz() {
		return session.selectOne("quiz-infos.selectAdoptQuiz");
	}
	
	@Override
	public int updateViews(int no) {
		return session.update("quiz-infos.updateViews", no);
	}// updateViews() end
	@Override
	public int updateLikes(int contentNo) {
		return session.update("quiz-infos.updateLikes", contentNo);
	}// updateLikes() end
	@Override
	public int updateDislikes(int contentNo) {
		return session.update("quiz-infos.updateDislikes", contentNo);
	}// updateDislikes() end
	@Override
	public QuizInfo selectOne(int qiNo) {
		return session.selectOne("quiz-infos.selectOne", qiNo);
	}// Quiz selectOne() end
	@Override
	public QuizInfo selectQuizByNo(int no) {
		return session.selectOne("quiz-infos.selectQuizByNo", no);
	}// selectQuizByNo() end

	// Quiz selectOne
	@Override
	public QuizInfo selectRandomOne() {
		return session.selectOne("quiz-infos.selectRandomOne");
	}// Quiz selectOne() end
	@Override
	public int insert(QuizInfo quizInfo) {
		return session.insert("quiz-infos.insert", quizInfo);
	}// insert() end
	@Override
	public int update(QuizInfo quizInfo) {
		return session.update("quiz-infos.update", quizInfo);
	}// update() end
	@Override
	public int selectQuizListTotal(PageVO pageVO) {
		return session.selectOne("quiz-infos.selectQuizListTotal", pageVO);
	}// selectQuizListLatestTotal() end
	@Override
	public List<QuizInfo> selectQuizList(PageVO page) {
		return session.selectList("quiz-infos.selectQuizList", page);
	}// selectQuizList() end
	@Override
	public QuizData selectUserAdoptInfo(int userNo) {
		return session.selectOne("quiz-infos.selectUserAdoptInfo", userNo);
	}// selectUserAdoptInfo() end
	@Override
	public int selectUserAdoptQuizListTotal(int userNo) {
		return session.selectOne("quiz-infos.selectUserAdoptQuizListTotal", userNo);
	}// selectAdoptQuizListTotal() end
	@Override
	public List<QuizInfo> selectUserAdoptQuizList(PageVO page) {
		return session.selectList("quiz-infos.selectUserAdoptQuizList", page);
	}// selectAdoptQuizList() end
	@Override
	public int selectVerifiQuizListTotal(int userNo) {
		return session.selectOne("quiz-infos.selectVerifiQuizListTotal", userNo);
	}// selectVerifiQuizListTotal() end
	@Override
	public List<QuizInfo> selectVerifiQuizList(PageVO page) {
		return session.selectList("quiz-infos.selectVerifiQuizList", page);
	}// selectVerifiQuizList() end
	@Override
	public int updateQNo(EMCont emCont) {
		return session.update("quiz-infos.updateQNo", emCont);
	}
	@Override
	public int updateENo(EMCont emCont) {
		return session.update("quiz-infos.updateENo", emCont);
	}
	@Override
	public int updateCrNo(EMCont emCont) {
		return session.update("quiz-infos.updateCrNo", emCont);
	}
	@Override
	public int updateCateNo(EMCont emCont) {
		return session.update("quiz-infos.updateCateNo", emCont);
	}

}// QuizInfosDAO end
