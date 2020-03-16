package com.spoon.loststations.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.spoon.loststations.dao.AnswersDAO;
import com.spoon.loststations.vo.Answer;

@Service
public class AnswersServiceImpl implements AnswersService{

	private AnswersDAO answersDAO;
	
	public void setAnswersDAO(AnswersDAO answersDAO) {
		this.answersDAO = answersDAO;
	}
	
	@Override
	public Map<String, Object> getReply(int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		System.out.println(no);
		
		Answer answer = answersDAO.answerSelectOne(no);
		
		if(answer!=null) {
			
			map.put("reply", answer);
			
		}		
		
		return map;
	}
	
	@Override
	public int registerReply(Answer answer) {
		// TODO Auto-generated method stub
		System.out.println("서비스 iNo:"+answer.getiNo());
		System.out.println("서비스 content:"+answer.getContent());
		
		return answersDAO.answerInsert(answer);
	}
	
}//AnswersServiceImpl end
