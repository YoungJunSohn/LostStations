package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.Choice;

public interface ChoicesDAO {

	public List<Choice> select4ChoiceList(int choice);
	public int insert(Choice choice);
	public List<Choice> selectChoiceList(int choice);

}
