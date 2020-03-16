package com.spoon.loststations.service;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.spoon.loststations.dao.ChoicesDAO;
import com.spoon.loststations.dao.CorrectsDAO;
import com.spoon.loststations.dao.QuizExpsDAO;
import com.spoon.loststations.dao.QuizInfosDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.vo.Choice;
import com.spoon.loststations.vo.Correct;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.QuizExp;
import com.spoon.loststations.vo.QuizInfo;

@Service
public class QuizInfosServiceImpl implements QuizInfosService {

	private QuizInfosDAO quizInfosDAO;
	private ChoicesDAO choicesDAO;
	private PaginateUtil paginateUtil;
	private QuizExpsDAO quizExpsDAO;
	private CorrectsDAO correctsDAO;
	
	
	
	public void setCorrectsDAO(CorrectsDAO correctsDAO) {
		this.correctsDAO = correctsDAO;
	}
	
	public void setQuizExpsDAO(QuizExpsDAO quizExpsDAO) {
		this.quizExpsDAO = quizExpsDAO;
	}
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	public void setChoicesDAO(ChoicesDAO choicesDAO) {
		this.choicesDAO = choicesDAO;
	}
	
	public void setQuizInfosDAO(QuizInfosDAO quizInfosDAO) {
		this.quizInfosDAO = quizInfosDAO;
	}
	//******************** 영준 start **********************

		@Override
		public Map<String, Object> getVerifingList(int no, int verifiPageNoInteger, int userNo, int sort) {
			
			//페이지번호(기본값 1페이지)
					int verifiPageNo = 1;
					
					int numPage = 4; //페이지에 보여질 게시물 수
					
					
					PageVO pageVO = new PageVO(verifiPageNo,numPage,sort,userNo);
					
					List<QuizInfo> quizInfos = quizInfosDAO.selectVerifiQuizList(pageVO);
						
					//페이지에 보여질 블록수
					int numBlock = 5;
					
					int total = quizInfosDAO.selectVerifiQuizListTotal(userNo);
						
					String paginate = paginateUtil.getPaginate(verifiPageNo, total, numPage, numBlock, "");
					
					Map<String, Object> map = new ConcurrentHashMap<String, Object>();
					
					map.put("quizList", quizInfos);
					map.put("paginate", paginate);
			
			return map;
		}
		
	//******************** 영준 end **********************
	
	//************************ 수정 **************************

	//퀴즈 정보 가져오기
	@Override
	public Map<String, Object> getOneByQiNo(int no) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		QuizInfo quizDetailInfo = quizInfosDAO.selectQuizByNo(no);
		
		
		map.put("quizInfo",quizInfosDAO.selectOne(no));
		map.put("quizDetailInfo",quizDetailInfo);
		
		//보기가져오기
		map.put("choiceList",choicesDAO.select4ChoiceList(quizDetailInfo.getCrNo()));
		
		return map;
	}
	
	//조회수 증가
	@Override
	public int updateViews(int no, Set<Integer> quizNos,
			HttpSession session) {
		if(quizNos==null) {
			quizNos = new HashSet<Integer>();
			session.setAttribute("quizNos",quizNos);
		}
		if(!quizNos.contains(no)) {
			quizInfosDAO.updateViews(no);
			quizNos.add(no);
			return 1;
		}//if end
		return 0;
	}
	
	//main에서 보기 체크했을 때
	public Map<String, Object> answerCheck(
			String answerStr, Integer qiNo) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int answer = -5;
		
		if (answerStr!=null) {
			answer = Integer.parseInt(answerStr);
		} //if end
		
		int no = 1;
		if (qiNo!=null) {
			no = qiNo;
		} //if end
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//************************* 수정 *******************************
	
	

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	@Override // 퀴즈 등록
	public int write(QuizInfo quizInfo, QuizExp quizExp, int chNo, String exp, String choice1, String choice2,
			String choice3, String choice4) {

		quizInfosDAO.insert(quizInfo);
		int qiNo = quizInfo.getNo();
		int userNo = quizInfo.getUserNo();

		quizExp.setQiNo(qiNo);
		quizExp.setType("Q");

		quizExpsDAO.insert(quizExp);
		int qNo = quizExp.getNo();

		quizExp.setType("E");
		quizExp.setContent(exp);
		quizExpsDAO.insert(quizExp);
		int eNo = quizExp.getNo();

		if (quizInfo.getType().equals("OX")) {
			Correct correct = new Correct(qiNo, chNo, userNo);
			correctsDAO.insertOX(correct);

			quizInfo.update(qNo, eNo, correct.getNo());
			return quizInfosDAO.update(quizInfo);

		} else {
			Correct correct = new Correct(qiNo, userNo);
			correctsDAO.insert(correct);
			int crNo = correct.getNo();

			Choice choice = new Choice(crNo, userNo, choice1);
			choicesDAO.insert(choice);
			int ch1No = choice.getNo();

			choice.setContent(choice2);
			choicesDAO.insert(choice);

			choice.setContent(choice3);
			choicesDAO.insert(choice);

			choice.setContent(choice4);
			choicesDAO.insert(choice);

			int realChNo = ch1No + crNo - 1;

			correct.update(qiNo, realChNo);
			correctsDAO.update(correct);

			quizInfo.update(qNo, eNo, crNo);
			return quizInfosDAO.update(quizInfo);
		} // if~else end
	}// write() end

	@Override // 퀴즈리스트 가져오기
	public Map<String, Object> getList(int pageNo, PageVO pageVO) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		int numPage = 4;
		pageVO.setEnd(pageNo * numPage);
		pageVO.setStart(pageVO.getEnd() - (numPage - 1));

		String searchContent = pageVO.getSearchContent();

		if (searchContent != null && searchContent != "") {
			pageVO.setSearchContent("%" + searchContent + "%");
		} // if end

		map.put("quizList", quizInfosDAO.selectQuizList(pageVO));

		int numBlock = 5;
		int total = quizInfosDAO.selectQuizListTotal(pageVO);

		map.put("paginate", paginateUtil.getPaginate(pageNo, total, numPage, numBlock, "/quiz"));

		return map;
	}// getList() end

	@Override // 메인 - 랜덤 퀴즈 하나 가져오기
	public Map<String, Object> getRandomQuiz() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		QuizInfo quiz = quizInfosDAO.selectRandomOne();
		List<Choice> choiceList = choicesDAO.select4ChoiceList(quiz.getCrNo());

		quiz.setChoices(choiceList);

		map.put("quiz", quiz);
		return map;
	}// getRandomQuiz() end
		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
}
