package com.spoon.loststations.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.AnswersService;
import com.spoon.loststations.service.InquiriesService;
import com.spoon.loststations.vo.Answer;
import com.spoon.loststations.vo.Inquiry;

@Controller
public class InquiryController {
	private InquiriesService inquiriesService;
	//재현
	private AnswersService answersService;
	
	public void setInquiriesService(InquiriesService inquiriesService) {
		this.inquiriesService = inquiriesService;
	}//setter 주입
	
	//재현
	public void setAnswersService(AnswersService answersService) {
		this.answersService = answersService;
	}
	
	/******************************* 손영준 start **************************************/
	//QnA 작성폼으로 이동 (inquiryNo 유무에 따라 수정/삭제폼으로 보이게)
		@RequestMapping(value="/inquiry/write", method=RequestMethod.GET)
		public String writeForm() {
			
			return "inquiryForm";
		}
		//QnA 작성 버튼을 누를 때(작성되는 문의번호를 받아 디테일페이지로 이동)
		@RequestMapping(value="/inquiry", method=RequestMethod.POST)
		public String write(Inquiry inquiry) {
			
			inquiriesService.write(inquiry);
			System.out.println("작성 메서드로 들어왔따!");
			System.out.println("번호 :"+inquiry.getUserNo());
			System.out.println("제목 :"+inquiry.getTitle());
			System.out.println("글내용 :"+inquiry.getContent()+"작성 완료!");
			System.out.println();
			
			return "redirect:/inquiry/"+inquiry.getNo();
		}
		
		
		//QnA 수정폼(GET방식)
		@RequestMapping(value="/inquiry/{no}/modify", method=RequestMethod.GET)
		public String modifyForm(@PathVariable int no, Model model) {

				Inquiry inquiry = inquiriesService.getInquiry(no);
				model.addAttribute("inquiry",inquiry);

			return "inquiryForm";
		}
		
		//QnA 수정 버튼을 누를 때(PUT방식)
			@RequestMapping(value="/inquiry", method=RequestMethod.PUT)
			public String modify(Inquiry inquiry) {

				int result = inquiriesService.modifyInquiry(inquiry);
				System.out.println(inquiry.getNo());
				System.out.println("갱신 "+result+"개 완료!");
				
				return "redirect:/inquiry/"+inquiry.getNo();
			}
	/******************************* 손영준 end **************************************/
	
	///// BC
		@RequestMapping(value = "/inquiry/page/{page}", method=RequestMethod.GET)
		public String inquiryList(Model model, @PathVariable int page) {
			
			System.out.println("page"+page);
			
			model.addAllAttributes(inquiriesService.getPageList(page));

			
			
			return "inquiryList";
			
		}
		
		@RequestMapping(value="/inquiry/option/{selectOption}/keyWord/{searchKeyWord}/page/{page}", method=RequestMethod.GET)
		public String searchKeyWord(Model model, @PathVariable int page, @PathVariable String selectOption, @PathVariable String searchKeyWord) {
			
			System.out.println("page"+page);
			System.out.println(selectOption);
			System.out.println(searchKeyWord);
	
			model.addAllAttributes(inquiriesService.SearchKeyWordList(page,selectOption,searchKeyWord));
			
			return "inquiryList";
		}
		
		
		
		/////
		//김재현 시작
		@RequestMapping(value="/inquiry/{no}", method=RequestMethod.GET)
		public String inquiryDetail(@PathVariable int no, Model model) {
			
			model.addAttribute("inquiry", inquiriesService.getInquiryDetail(no));
			
			return "inquiryDetail";
		}
		
		@RequestMapping(value="/inquiry", method=RequestMethod.DELETE)
		public String inquiryDelete(int no) {
			
			inquiriesService.inquiryDelete(no);
			
			return "/redirect:/inquiryList/page/1";
		}
		
		@RequestMapping(value="/answer", method=RequestMethod.POST)
		public String inquiryInsert(Answer answer) {
			
			answersService.registerReply(answer);
			return "redirect:/inquiry/"+answer.getiNo();
		}
		//김재현 끝
		
		
		
}//controller end
