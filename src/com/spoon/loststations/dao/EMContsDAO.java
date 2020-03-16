package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.EMCont;

public interface EMContsDAO {

	public List<EMCont> selectList(int emNo);
	public int insert(EMCont emCont);

}
