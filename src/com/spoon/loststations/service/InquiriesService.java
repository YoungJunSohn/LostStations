package com.spoon.loststations.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.spoon.loststations.vo.Inquiry;

@Service
public interface InquiriesService {
	/******************************* 손영준 start **************************************/
	//0706 inquiryModifyForm - 번호 가져오기
		public Inquiry getInquiry(int no);
		//update구문
		public int modifyInquiry(Inquiry inquiry);
		
		//write 구문
		public int write(Inquiry inquiry);
	/******************************* 손영준 end **************************************/
	
	//BC
	
	public Map<String, Object> getPageList(int page);
	public Map<String, Object> SearchKeyWordList(int page, String selectOption, String searchKeyWord);
	
	//
	
	//김재현 시작
		public Inquiry getInquiryDetail(int no);
		public boolean inquiryDelete(int no);
		//김재현 끝

}
