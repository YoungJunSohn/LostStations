package com.spoon.loststations.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.spoon.loststations.dao.EMsDAO;
import com.spoon.loststations.dao.GameUsersDAO;
import com.spoon.loststations.dao.PlayLogsDAO;
import com.spoon.loststations.dao.QuizInfosDAO;
import com.spoon.loststations.dao.UsersDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.vo.CommentData;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.PlayData;
import com.spoon.loststations.vo.PlayLog;
import com.spoon.loststations.vo.QuizData;
import com.spoon.loststations.vo.User;

@Service
public class PlayLogsServiceImpl implements PlayLogsService{
	
	private PlayLogsDAO playLogsDAO;
	private PaginateUtil paginateUtil;
	
	public void setPlayLogsDAO(PlayLogsDAO playLogsDAO) {
		this.playLogsDAO = playLogsDAO;
	}
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	
	/*******************************영준 start**********************************/
	//메서드 선언 (캡슐화)
	private double divide(double a, double b) {
		
		try {
			return a/b;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}//divide(double a, double b) end
	
	
	
	private UsersDAO usersDAO;
	private GameUsersDAO gameUsersDAO;
	private QuizInfosDAO quizInfosDAO;
	private EMsDAO emsDAO;
	
	public void setEmsDAO(EMsDAO emsDAO) {
		this.emsDAO = emsDAO;
	}
	public void setQuizInfosDAO(QuizInfosDAO quizInfosDAO) {
		this.quizInfosDAO = quizInfosDAO;
	}
	public void setGameUsersDAO(GameUsersDAO gameUsersDAO) {
		this.gameUsersDAO = gameUsersDAO;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	@Override
	public Map<String, Object> getPlayLogs(int no) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		
		User user = usersDAO.selectOne(no);
		int userNo = user.getNo();
		PlayData playData1 = playLogsDAO.selectUserNo(userNo);
		PlayData playData2 = gameUsersDAO.selectUserNo(userNo);
		QuizData quizData3 = quizInfosDAO.selectUserAdoptInfo(userNo);
		QuizData quizData4 = playLogsDAO.selectUserAdoptInfo(userNo);
		CommentData commentData = emsDAO.selectUserNo(userNo);
		
		int totalQuiz = playData1.getTotalQuiz();
		int totalGameCnt = playData2.getTotalGame();
		
		
		int correctRate = (int)Math.floor(divide(playData1.getCorrectNum()*100,totalQuiz));
		
		int winRate = (int)Math.floor(divide(playData2.getRank1Count()*100,totalGameCnt));
		double avgPlayRank = divide(playData2.getRankSum(),totalGameCnt);
		
		int rank1Cnt = playData2.getRank1Count();
		int surviveMinute = (int)Math.floor(divide((playData2.getSurvivalTimeSum()),(playData2.getTotalGame()))/60);
		int surviveSecond = (int)Math.floor(divide(playData2.getSurvivalTimeSum(),playData2.getTotalGame()))%60;
		int adoptRate = (int)Math.floor(divide(quizData3.getAdoptNum()*100,quizData3.getAdoptTotal()));
		int crCheckRate = (int)Math.floor(divide(quizData4.getCorrectNum()*100,quizData4.getCrCheckTotal()));
		int dropRate = (int)Math.floor(divide(quizData4.getDropNum()*100,quizData4.getTotal()));

		
		int playRank = usersDAO.selectUserPlayRank(userNo).getRank();
		int registerRank = usersDAO.selectUserRegistrationRank(userNo).getRank();
		int verifyRank = usersDAO.selectUserverificationRank(userNo).getRank();
		
		//카테고리별 정답률 가져옴
		int[] categoryTotal = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		int[] categoryCorrectNum = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		int[] categories = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
		
		List<PlayData> total = playLogsDAO.selectUserCategoriesTotal(userNo);
		List<PlayData> correctNum = playLogsDAO.selectUserCategoriesCorrect(userNo);
		
		int i = 1;
		for(PlayData data : total) {
			i = data.getCategory();
			categoryTotal[i-1] = data.getTotal();
		}
		for(PlayData data : correctNum) {
			i = data.getCategory();
			categoryCorrectNum[i-1] = data.getCorrectNum();
		}
		String categoriesStr = "";
		for(i=0; i < 15;i++){
			if(categoryTotal[i] > 0){
		categories[i] = (categoryCorrectNum[i]*100/categoryTotal[i]);
			}//if end
			categoriesStr += categories[i]+",";
		}//for end
		categoriesStr = categoriesStr.substring(0, categoriesStr.length()-1);
		//System.out.println(categoriesStr);
		
		map.put("user", user);
		map.put("totalQuiz", totalQuiz);
		map.put("correctRate", correctRate);
		map.put("totalGameCnt", totalGameCnt);
		map.put("winRate", winRate);
		map.put("avgPlayRank", avgPlayRank);
		map.put("playRank", playRank);
		map.put("registerRank", registerRank);
		map.put("verifyRank", verifyRank);
		map.put("rank1Cnt",rank1Cnt);
		map.put("surviveMinute",surviveMinute);
		map.put("surviveSecond",surviveSecond);
		
		
		map.put("quizData3",quizData3);
		map.put("quizData4",quizData4);
		map.put("adoptedQuizCnt",quizData3.getAdoptNum());
		map.put("adoptRate",adoptRate);
		map.put("crCheckRate",crCheckRate);
		map.put("dropRate",dropRate);
		map.put("categoriesStr",categoriesStr);
		map.put("commentData",commentData);
		
		return map;
	}

	/******************************* 영준 end **********************************/
	
	
	@Override
	public int updatePlayLog(PlayLog playlog) {
		return playLogsDAO.update(playlog);
	}
	
	@Override
	public int registerAttack(PlayLog playlog) {
		return playLogsDAO.insertAttack(playlog);
	}
	
	@Override
	public int registerTrash(PlayLog playlog) {
		return playLogsDAO.insertTrash(playlog);
	}
	
	@Override
	public Map<String, Object> getPlayRanking(int page) {
		// TODO Auto-generated method stub
		
		int numPage = 10; //페이지에 보여질 게시물 수
    	PageVO pageVO = new PageVO();
    	
    	pageVO.setEnd(page*numPage+3);
    	
    	pageVO.setStart(pageVO.getEnd()-(numPage-1));
    	
    	if(page>1){
    		numPage = 20;
    		pageVO.setEnd(page*numPage-7);
    		pageVO.setStart(pageVO.getEnd()-(numPage-1));
    	}
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		int total = playLogsDAO.selectUserListTotal()+7;
		List<User> topUsers = new ArrayList<User>();
		List<User> otherUsers = playLogsDAO.selectUserList(pageVO);
		
		// 페이지가 1일때 top 1 ~ 3 유저
		if (page==1) {
			topUsers = playLogsDAO.selectUserList(new PageVO(1,3));
			for(User user : topUsers) {
				user.setWinRate(playLogsDAO.selectWinRate(user.getNo()));
				user.setCorrectRate(playLogsDAO.selectCorrectRate(user.getNo()));
				user.setAvgRank(playLogsDAO.selectAvgRank(user.getNo()));
			}
		}
		
		// 1 ~ 3 나머지 유저
		for(User user : otherUsers) {
			
			user.setWinRate(playLogsDAO.selectWinRate(user.getNo()));
		}
		map.put("playUsers", otherUsers);
		map.put("top3List", topUsers);
		
		
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, 5, "/user/ranking/play"));
		
		return map;
	}

}
