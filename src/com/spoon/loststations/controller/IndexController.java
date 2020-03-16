package com.spoon.loststations.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spoon.loststations.service.CertsService;
import com.spoon.loststations.service.UsersService;
import com.spoon.loststations.vo.User;

@Controller
public class IndexController {

	private UsersService userService;
	
	public void setUserService(UsersService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String index(HttpSession session, User user) {
		session.getAttribute("cmd");

		User loginUser =(User)session.getAttribute("loginUser");
		if (loginUser != null) {
			
			System.out.println("test");
			return "main";

		} 
		
		else {
			System.out.println("test22");
			return "index";
		}
	}
	
}
