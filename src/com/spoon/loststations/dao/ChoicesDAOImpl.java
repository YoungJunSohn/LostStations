package com.spoon.loststations.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Choice;

@Repository
public class ChoicesDAOImpl implements ChoicesDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// select4ChoiceList (4지선다 보기 가져오기)
	@Override
	public List<Choice> select4ChoiceList(int choice) {
		return session.selectList("choices.select4ChoiceList", choice);
	}

	// 보기insert
	@Override
	public int insert(Choice choice) {
		return session.insert("choices.insert", choice);
	} // insert() end
	
	@Override
	public List<Choice> selectChoiceList(int choice) {
		return session.selectList("choices.selectChoiceList", choice);
	}

}// ChoicesDAO
