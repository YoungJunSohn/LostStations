package com.spoon.loststations.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.LikesService;
import com.spoon.loststations.vo.Like;


@Controller
public class LikeController {
	
	private LikesService likesService;
	
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	
	@RequestMapping(value="/like",method=RequestMethod.POST)
	public String likeUpdate(Like like) {

		likesService.likeUpdate(like);
		
		return "redirect:/quiz/"+like.getContentNo();
	}
	
	
}
