package com.spoon.loststations.dao;

import com.spoon.loststations.vo.Correct;

public interface CorrectsDAO {

	public int insert(Correct correct);
	public int updateAnswer(Correct correct);
	public int update(Correct correct);
	public int insertOX(Correct correct);
	public Correct selectOne(int crNo);

}
