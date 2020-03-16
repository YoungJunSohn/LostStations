package com.spoon.loststations.dao;

import com.spoon.loststations.vo.Report;

public interface ReportsDAO {

	public int insert(Report report);
	public int selectOne(Report report);

}
