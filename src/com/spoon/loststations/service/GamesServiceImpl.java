package com.spoon.loststations.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.spoon.loststations.dao.ChoicesDAO;
import com.spoon.loststations.dao.GameUsersDAO;
import com.spoon.loststations.dao.GamesDAO;
import com.spoon.loststations.dao.QuizInfosDAO;
import com.spoon.loststations.vo.Choice;
import com.spoon.loststations.vo.Game;
import com.spoon.loststations.vo.GameUser;
import com.spoon.loststations.vo.QuizInfo;

public class GamesServiceImpl implements GamesService{
	private GamesDAO gamesDAO;
	private QuizInfosDAO quizInfosDAO;
	private ChoicesDAO choicesDAO;
	private GameUsersDAO gameUsersDAO;
	
	
	public GameUsersDAO getGameUsersDAO() {
		return gameUsersDAO;
	}

	public void setGameUsersDAO(GameUsersDAO gameUsersDAO) {
		this.gameUsersDAO = gameUsersDAO;
	}

	public GamesDAO getGamesDAO() {
		return gamesDAO;
	}

	public QuizInfosDAO getQuizInfosDAO() {
		return quizInfosDAO;
	}

	public ChoicesDAO getChoicesDAO() {
		return choicesDAO;
	}

	public void setChoicesDAO(ChoicesDAO choicesDAO) {
		this.choicesDAO = choicesDAO;
	}
	
	public void setQuizInfosDAO(QuizInfosDAO quizInfosDAO) {
		this.quizInfosDAO = quizInfosDAO;
	}
	
	public void setGamesDAO(GamesDAO gamesDAO) {
		this.gamesDAO = gamesDAO;
	}
	
	@Override
	public Map<String, Object> getResult(GameUser gameUser) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("gameUser", gameUsersDAO.getOne(gameUser));
		
		
		return map;
	}
	
	@Override
	public int register(GameUser gameUser) {
		return gameUsersDAO.insert(gameUser);
	}
	
	@Override
	public QuizInfo searchQuiz(int qiNo) {
		System.out.println("searchQuiz시작 : "+qiNo);
		return quizInfosDAO.selectQuizOne(qiNo);
	}
	
	@Override
	public QuizInfo getQuiz() {
		return quizInfosDAO.selectAdoptQuiz();
	}
	
	@Override
	public List<Choice> getchoices(int crNo) {
		return choicesDAO.selectChoiceList(crNo);
	}
	
	@Override
	public int register(Game game) {
		return gamesDAO.insert(game);
	}
	
	@Override
	public List<QuizInfo> get6Quizs() {
		return quizInfosDAO.selectAdopt6List();
	}
	
}
