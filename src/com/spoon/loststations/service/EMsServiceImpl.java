package com.spoon.loststations.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.spoon.loststations.dao.ChoicesDAO;
import com.spoon.loststations.dao.CorrectsDAO;
import com.spoon.loststations.dao.EMContsDAO;
import com.spoon.loststations.dao.EMsDAO;
import com.spoon.loststations.dao.LikesDAO;
import com.spoon.loststations.dao.QuizExpsDAO;
import com.spoon.loststations.dao.QuizInfosDAO;
import com.spoon.loststations.dao.UsersDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.vo.Choice;
import com.spoon.loststations.vo.Correct;
import com.spoon.loststations.vo.EM;
import com.spoon.loststations.vo.EMCont;
import com.spoon.loststations.vo.Like;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.QuizExp;
import com.spoon.loststations.vo.QuizInfo;
import com.spoon.loststations.vo.User;

@Service
public class EMsServiceImpl implements EMsService {
	
	//*********************** 수정 ******************************
	
	private EMsDAO emsDAO;
	private QuizExpsDAO quizExpsDAO;
	private EMContsDAO emContsDAO;
	private CorrectsDAO correctsDAO;
	private ChoicesDAO choicesDAO;
	private QuizInfosDAO quizInfosDAO;
	private LikesDAO likesDAO;
	
	public void setEmsDAO(EMsDAO emsDAO) {
		this.emsDAO = emsDAO;
	}
	
	public void setQuizExpsDAO(QuizExpsDAO quizExpsDAO) {
		this.quizExpsDAO = quizExpsDAO;
	}
	
	public void setEmContsDAO(EMContsDAO emContsDAO) {
		this.emContsDAO = emContsDAO;
	}
	
	public void setCorrectsDAO(CorrectsDAO correctsDAO) {
		this.correctsDAO = correctsDAO;
	}
	
	public void setChoicesDAO(ChoicesDAO choicesDAO) {
		this.choicesDAO = choicesDAO;
	}
	
	public void setQuizInfosDAO(QuizInfosDAO quizInfosDAO) {
		this.quizInfosDAO = quizInfosDAO;
	}
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	private UsersDAO usersDAO;
	private PaginateUtil paginateUtil;
	
	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	//오류등록
	@Override
	public boolean register(int qiNo, int userNo, String type, String category, String question,
			String explanationQ, int mcAnswer, String[] mcChoice, String mcErrorExplanation, String quizType,
			int oxAnswer, String oxErrorExplanation, String explanationE) {
		
		EM em = new EM(qiNo,userNo);
		
		emsDAO.insert(em);
		
		int emNo = em.getNo();
		
		switch(type) {
			case "Q" :
				QuizExp quizExpQ = new QuizExp(qiNo, userNo, question, "Q");
				quizExpsDAO.insert(quizExpQ);
				EMCont emContQ = new EMCont(emNo, "Q", quizExpQ.getNo());
				emContsDAO.insert(emContQ);
				QuizExp quizExpE = new QuizExp(qiNo, userNo, explanationQ, "E");
				quizExpsDAO.insert(quizExpE);
				EMCont emContE = new EMCont(emNo, "E", quizExpE.getNo());
				emContsDAO.insert(emContE);
			break;
		
			case "C":
				int categoryInt = Integer.parseInt(category);
				EMCont emContC = new EMCont(emNo, "C", categoryInt);
				emContsDAO.insert(emContC); 
			break;
			
			case "A":
				if(quizType.equals("MC")) {
					Correct mcCorrect = new Correct(qiNo, userNo);
					correctsDAO.insert(mcCorrect); //1
					Choice choice=new Choice();
					for (int i = 0; i < mcChoice.length; i++) {
						
						choice = new Choice(mcCorrect.getNo(), userNo, mcChoice[i]);
						choicesDAO.insert(choice); //1이 4개
						//System.out.println("test");
						
						if(mcAnswer==i) {
							mcCorrect.setChNo(choice.getNo());
							correctsDAO.updateAnswer(mcCorrect);
						}//if end
						
					}//mcChoice for() end
					
					EMCont emContMCChoice = new EMCont(emNo, "A", mcCorrect.getNo());
					emContsDAO.insert(emContMCChoice); 
					QuizExp quizExpMCAnswer = new QuizExp(qiNo, userNo, mcErrorExplanation, "E");
					quizExpsDAO.insert(quizExpMCAnswer); 
					EMCont emContMCAnswer = new EMCont(emNo, "E", quizExpMCAnswer.getNo());
					emContsDAO.insert(emContMCAnswer); 
					
				} else {
					
					Correct oxCorrect = new Correct(qiNo, oxAnswer, userNo);
					correctsDAO.insertOX(oxCorrect);
					EMCont emContMCChoice = new EMCont(emNo, "A", oxCorrect.getNo());
					
					emContsDAO.insert(emContMCChoice);
					QuizExp quizExpOXAnswer = new QuizExp(qiNo, userNo, oxErrorExplanation, "E");
					quizExpsDAO.insert(quizExpOXAnswer); 
					EMCont emContOXAnswer = new EMCont(emNo, "E", quizExpOXAnswer.getNo());
					emContsDAO.insert(emContOXAnswer); 
				}
			break;
				
			case "E":
				QuizExp quizExpEx = new QuizExp(qiNo, userNo, explanationE, "E");
				quizExpsDAO.insert(quizExpEx);
				EMCont emContEx = new EMCont(emNo, "E", quizExpEx.getNo());
				emContsDAO.insert(emContEx);
			break;
				
			};
		
		return true;
	}
	
	
	//오류리스트
	@Override
	public Map<String, Object> errorCommentList(int page, int qiNo, int userNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		int pageNo = 1;
		if(page!=0) {
			try {
				pageNo = page;
			}catch(Exception e) {
				System.out.println("숫자넣어!!");
			}//try~catch end
		}//if end
		int numPage = 5; //페이지에 보여질 게시물 수	
		int numBlock = 5; //페이지에 보여질 블록 수
		
		PageVO pageVO = new PageVO(pageNo,numPage);	
		pageVO.setQiNo(qiNo);
		
		String url = "quizDetailView.jsp";
		String param = "pageNo=";
		
		QuizInfo quizInfo = quizInfosDAO.selectOne(qiNo);
		String quizType = quizInfo.getType();
		List<EM> ems = emsDAO.selectList(pageVO);
		
		Like like = new Like();
		like.setUserNo(userNo);
		like.setContentType("E"); // 에러에 대한 타입
		
		for (EM em : ems) {
			
			like.setContentNo(em.getNo());
			Like likeOne = likesDAO.selectOne(like);
			
			if(likeOne!=null) { // 좋아요 누른게 있을 경우
				em.setLikeConfirm(likeOne.getType()); // 좋아요, 싫어요 타입을 얻은 후 세팅(L,D)
			} else { // 좋아요 누른게 없을 경우
				em.setLikeConfirm("N"); // 타입 세팅을 N으로
			}//if ~ else end
			
			List<EMCont> conts = emContsDAO.selectList(em.getNo());
			
			for (EMCont cont : conts) {
				switch (cont.getType()) {
				
				case "Q" : 
					QuizExp contentQ = quizExpsDAO.selectOne(cont.getTypeNo());
					em.setQuizContent(contentQ.getContent());
					System.out.println("Q");
					break;
					
				case "E" :
					QuizExp contentE = quizExpsDAO.selectOne(cont.getTypeNo());
					em.setExpContent(contentE.getContent());
					em.setCorrectContent(-2);
					break;
					
				case "A" :
					
					Correct correct = correctsDAO.selectOne(cont.getTypeNo());
					em.setCorrectContent(correct.getChNo());
					if (quizType.equals("MC")) {
						//사지선다
						List<Choice> choices =  choicesDAO.selectChoiceList(correct.getNo());
						System.out.println(choices);
						em.setChoiceContent(choices);
					}//if end 
					break;
					
				case "C" :
					em.setCategoryNo(cont.getTypeNo());
					break;
				}//switch end
			}// end
		}//for end
		int total = emsDAO.selectListTotal(qiNo);
		
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);
		
		map.put("list", ems);
		map.put("paginate", paginate);
		
		return map;
	}
	
	//오류채택
	@Override
	public int adoptErrorComment(int qiNo, int emNo) {
		int result = 0;
		
		emsDAO.adoptUpdate(emNo);
		
		
		
		
		
		
		
		
		
		return result;
	}
	
	
	
	//*********************** 수정 ******************************
	
	
	
	///////////////////////ㅈㅎ///////////////////////////
	@Override
	public Map<String, Object> getVerifyRanking(int page) {
	
	int numPage = 10; //페이지에 보여질 게시물 수
	PageVO pageVO = new PageVO();
	
	pageVO.setEnd(page*numPage+3);
	
	pageVO.setStart(pageVO.getEnd() - (numPage-1));
	
	if(page > 1){
	numPage = 20;
	pageVO.setEnd(page*numPage-7);
	pageVO.setStart(pageVO.getEnd() - (numPage-1));
	}
	
	Map<String, Object> map = new ConcurrentHashMap<String, Object>();
	
	int total = emsDAO.selectUserListTotal()+7;
	
	List<User> topVerifiers = new ArrayList<User>();
	List<User> otherVerifiers =  emsDAO.quizVerifyRankng(pageVO);
	
	if (page==1) {
	topVerifiers = emsDAO.quizVerifyRankng(new PageVO(1,3));
	for(User user : topVerifiers) {
	
	user.setErrorCount(emsDAO.selectErrorCount(user.getNo()));
	user.setVerifyQuizAdoptCount(usersDAO.selectVerifyQuizAdoptCount(user.getNo()));
	user.setVerifyQuizCount(usersDAO.selectVerifyQuizCount(user.getNo()));
	}
	}
	
	for(User user : otherVerifiers) {
	user.setCountVerifiedQuiz(emsDAO.selectErrorCount(user.getNo()));
	}
	
	map.put("verifiers", otherVerifiers);
	map.put("top3List", topVerifiers);
	map.put("paginate", paginateUtil.getPaginate(page, total, numPage, 5, "/user/ranking/verify"));
	
	return map;
	}
	///////////////////////ㅈㅎ///////////////////////////


}
