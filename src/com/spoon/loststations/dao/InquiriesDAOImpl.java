package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.spoon.loststations.vo.Inquiry;
import com.spoon.loststations.vo.PageVO;

public class InquiriesDAOImpl implements InquiriesDAO {
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	/******************************* 손영준 **************************************/
	//0706 inquiryModifyForm - 문의사항 하나 가져옴
		@Override
		public Inquiry selectInquiryOne(int no) {
			// TODO Auto-generated method stub
			return session.selectOne("inquiries.selectOne",no);
		}
		
		@Override
		public int updateInquiryOne(Inquiry inquiry) {
			// TODO Auto-generated method stub
			return session.update("inquiries.update", inquiry);
		}
		
		//insert
		@Override
		public int insertInquiry(Inquiry inquiry) {
			// TODO Auto-generated method stub
			return session.insert("inquiries.insert",inquiry);
		}
	/******************************* 손영준 **************************************/

	//BC
	
	@Override
	public List<Inquiry> selectList(PageVO pageVO) {
		// TODO Auto-generated method stub
		return session.selectList("inquiries.selectList", pageVO);
	}
	
	
	@Override
	public int selectTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("inquiries.selectTotal");
	}
	
	@Override
	public List<Inquiry> selectSearchKeyWord(PageVO pageVO) {
		// TODO Auto-generated method stub
		System.out.println("DAO"+pageVO.getSearchKeyWord());
		System.out.println("DAO"+pageVO.getSelectOption());
		
		System.out.println("DAO"+pageVO.getStart());
		System.out.println("DAO"+pageVO.getEnd());
		System.out.println("DAO"+pageVO.getNo());
		return session.selectList("inquiries.selectKeyword", pageVO);
	}
	//
	
	//김재현 시작
	@Override
	public Inquiry selectOneInquiryDetail(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("inquiries.selectOneInquiryDetail", no);
	}
	
	@Override
	public int inquiryDelete(int no) {
		// TODO Auto-generated method stub
		return session.delete("inquiries.inquiryDelete", no);
	}
	
	
	//김재현 끝
}
