package com.spoon.loststations.service;

import java.util.List;
import java.util.Map;

import com.spoon.loststations.vo.Choice;
import com.spoon.loststations.vo.Game;
import com.spoon.loststations.vo.GameUser;
import com.spoon.loststations.vo.QuizInfo;

public interface GamesService {
	public int register(Game game);
	public List<QuizInfo> get6Quizs();
	public List<Choice> getchoices(int crNo);
	public QuizInfo getQuiz();
	public QuizInfo searchQuiz(int quizNo);
	public int register(GameUser gameUser);
	public Map<String, Object> getResult(GameUser gameUser);
	
}
