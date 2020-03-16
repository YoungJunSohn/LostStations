package com.spoon.loststations.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.EMsService;

@Controller
public class ErrorCommentController {

	private EMsService emsService;
	
	public void setEmsService(EMsService emsService) {
		this.emsService = emsService;
	}
	
	//오류채택
	@RequestMapping(value="/quiz/{no}",method=RequestMethod.PUT)
	public String quizInfoGetOne(@PathVariable int qiNo, int emNo) {
		
		System.out.println("PUT /quiz/{no}");
		
		emsService.adoptErrorComment(qiNo, emNo);

		return "redirect:/quiz/"+qiNo+"/answer/-5";
	}
	
}
