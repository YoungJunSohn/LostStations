package com.spoon.loststations.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.spoon.loststations.dao.ReportsDAO;
import com.spoon.loststations.vo.Report;

public class ReportsServiceImpl implements ReportsService{

	private ReportsDAO reportsDAO;
	
	public void setReportsDAO(ReportsDAO reportsDAO) {
		this.reportsDAO = reportsDAO;
	}
	
	@Override
	public Map<String, Object> getOne(Report report) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		int count = reportsDAO.selectOne(report);

		if(count > 0) {
			//이미 신고한것임
			int result = 0;
			map.put("result", 0);
			return map;
		} else {
			//처음 신고하는 것임
			int result = reportsDAO.insert(report);
			map.put("result", 1);
			return map;
		}
	}
	
	
}
