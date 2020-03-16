package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Report;

@Repository
public class ReportsDAOImpl implements ReportsDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Report report) {
		return session.insert("reports.insert", report);
	} // insert() end

	@Override
	public int selectOne(Report report) {
		return session.selectOne("reports.selectOne", report);
	}// Quiz selectOne() end
	
}// ReportsDAO end
