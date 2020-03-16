package com.spoon.loststations.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.GamesService;
import com.spoon.loststations.vo.GameUser;

@Controller
public class GameController {
	private GamesService service;
	
	public void setService(GamesService service) {
		this.service = service;
	}
	
	
	@RequestMapping(value="/game",method=RequestMethod.GET)
	public String game() {
		return "game";
	}
	
	@RequestMapping(value="/result/game/{no}/user/{userNo}",method=RequestMethod.GET)
	public String result(Model model,@PathVariable int no,@PathVariable int userNo) {
		model.addAllAttributes(service.getResult(new GameUser(no, userNo)));
		
		return "result";
	}
	
}//GameController end