package com.spoon.loststations.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.EMsService;
import com.spoon.loststations.service.PlayLogsService;
import com.spoon.loststations.service.UsersService;


@Controller
public class RankingController {
	
	private PlayLogsService playLogsService; //플레이
	private UsersService usersService; //출제
	private EMsService emsService; //검증
	
	public void setPlayLogsService(PlayLogsService playLogsService) {
		this.playLogsService = playLogsService;
	}
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	
	public void setEmsService(EMsService emsService) {
		this.emsService = emsService;
	}

	//플레이 랭킹으로 이동
	@RequestMapping(value="/user/ranking/play/page/{page}", method=RequestMethod.GET)
	public String playRanking(Model model, @PathVariable int page) {
		
		model.addAttribute("type", "play"); //type에 play를 넣어줌
		model.addAllAttributes(playLogsService.getPlayRanking(page));
		
		return "ranking";
	}
	
	//출제 랭킹으로 이동
	@RequestMapping(value="/user/ranking/register/page/{page}", method=RequestMethod.GET)
	public String registerRanking(Model model, @PathVariable int page) {
		
		model.addAttribute("type", "register"); //type에 register를 넣어줌
		model.addAllAttributes(usersService.getRegisterRanking(page));
		
		return "ranking";
	}
	
	//검증 랭킹으로 이동
	@RequestMapping(value="/user/ranking/verify/page/{page}", method=RequestMethod.GET)
	public String verifyRanking(Model model, @PathVariable int page) {
		
		model.addAttribute("type", "verify"); //type에 verify를 넣어줌
		model.addAllAttributes(emsService.getVerifyRanking(page));
		
		return "ranking";
	}
	
}
