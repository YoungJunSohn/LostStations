package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.EMCont;

@Repository
public class EMContsDAOImpl implements EMContsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		 this.session = session;
	}
	
	@Override
	public   List<EMCont> selectList(int emNo) {
		return session.selectList("em-conts.selectList",emNo);
		
	} //selectList() end
	
	@Override
	public   int insert(EMCont emCont) {
		return session.insert("em-conts.insert", emCont);
		
	} //insert() end

}//Em_ContsDAO
