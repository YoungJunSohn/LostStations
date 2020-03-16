package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.Game;
import com.spoon.loststations.vo.QuizItem;

public interface GamesDAO {

	public int insert(Game game);
	public List<QuizItem> selectList();

}
