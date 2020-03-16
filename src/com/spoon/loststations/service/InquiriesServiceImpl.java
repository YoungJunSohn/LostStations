package com.spoon.loststations.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.spoon.loststations.dao.AnswersDAO;
import com.spoon.loststations.dao.InquiriesDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.vo.Inquiry;
import com.spoon.loststations.vo.PageVO;

public class InquiriesServiceImpl implements InquiriesService {

	private InquiriesDAO inquiriesDAO;

	private PaginateUtil paginateUtil;
	
	//김재현 시작
	private AnswersDAO answersDAO;
	//김재현 끝
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	public void setInquiriesDAO(InquiriesDAO inquiriesDAO) {
		this.inquiriesDAO = inquiriesDAO;
	}
	
	//김재현 시작
	public void setAnswersDAO(AnswersDAO answersDAO) {
		this.answersDAO = answersDAO;
	}
	//김재현 끝

	/******************************* 손영준 **************************************/
	//0706
		@Override
		public Inquiry getInquiry(int no) {
			// TODO Auto-generated method stub
			return inquiriesDAO.selectInquiryOne(no);
		}
		//update
		@Override
		public int modifyInquiry(Inquiry inquiry) {
			// TODO Auto-generated method stub
			return inquiriesDAO.updateInquiryOne(inquiry);
		}
		
		//insert
		@Override
		public int write(Inquiry inquiry) {
			// TODO Auto-generated method stub
			return inquiriesDAO.insertInquiry(inquiry);
		}
	/******************************* 손영준 **************************************/

	/// BC

	@Override
	public Map<String, Object> getPageList(int page) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 3;
		int total = inquiriesDAO.selectTotal();
		PageVO pageVO = new PageVO(page, numPage);

		map.put("inquiryList", inquiriesDAO.selectList(pageVO));
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, 5, "/inquiryList"));

		return map;
	}
	
	
	@Override
	public Map<String, Object> SearchKeyWordList(int page, String selectOption, String searchKeyWord) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		int numPage = 3;

		PageVO pageVO = new PageVO();
		
		pageVO.setEnd(page * numPage);
		pageVO.setStart(pageVO.getEnd() - (numPage - 1));
		
		if (searchKeyWord != null && searchKeyWord != "") {
			pageVO.setSearchKeyWord("%" + searchKeyWord + "%");
		} // if end	
		
		pageVO.setSelectOption(selectOption);
		
		
		int total = 3;
		int numBlock = 5;
		map.put("inquiryList",inquiriesDAO.selectSearchKeyWord(pageVO));
		map.put("paginate", paginateUtil.getPaginate(page, total, numPage, numBlock, "/inquiryList/selectOption/"+selectOption+"/searchKeyWord/"+searchKeyWord));
		
		
		return map;
	}
	
	
	
	//
	
	//김재현 시작
	@Override
	public Inquiry getInquiryDetail(int no) {
		// TODO Auto-generated method stub
		return inquiriesDAO.selectOneInquiryDetail(no);
	}
	
	@Override
	public boolean inquiryDelete(int no) {
		// TODO Auto-generated method stub
		answersDAO.answersDelete(no);
		inquiriesDAO.inquiryDelete(no);
		return true;
	}
	//김재현 끝

}
