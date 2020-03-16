package com.spoon.loststations.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Inquiry;
import com.spoon.loststations.vo.PageVO;

@Repository
public interface InquiriesDAO {
	/******************************* 손영준 **************************************/
	//0706 select inquiry
		public Inquiry selectInquiryOne(int no);
		//0708 update inquiry
		public int updateInquiryOne(Inquiry inquiry);
		
		//insert
		public int insertInquiry(Inquiry inquiry);
	/******************************* 손영준 **************************************/
	///BC
	
	public List<Inquiry> selectList(PageVO pageVO);
	public List<Inquiry> selectSearchKeyWord(PageVO pageVO);
	
	//
	
	public int selectTotal();
	//김재현 시작
	public Inquiry selectOneInquiryDetail(int no);
	public int inquiryDelete(int no);
	
	//김재현 끝

}
