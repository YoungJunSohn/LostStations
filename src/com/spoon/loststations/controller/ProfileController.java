package com.spoon.loststations.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.PlayLogsService;

@Controller
public class ProfileController {
	
	private PlayLogsService playLogsService;
	
	public void setPlayLogsService(PlayLogsService playLogsService) {
		this.playLogsService = playLogsService;
	}
	
	@RequestMapping(value="/user/{no}", method=RequestMethod.GET)
	public String profileView(@PathVariable int no, Model model) {
		Map<String, Object> profilePageData = playLogsService.getPlayLogs(no);
		
		model.addAllAttributes(profilePageData);
		return "profile";
	}
}
