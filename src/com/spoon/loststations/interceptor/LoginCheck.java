package com.spoon.loststations.interceptor;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spoon.loststations.dao.UsersDAO;
import com.spoon.loststations.vo.User;

public class LoginCheck implements HandlerInterceptor{

	//후처리(컨트롤러 갔다 온 후)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
//		System.out.println("후처리");
//		Map<String, Object> map = modelAndView.getModel();
//		
//		Set<String> keys = map.keySet();
//		
//		for( String key : keys ) {
//			
//			Object obj = map.get(key);
//			
//			System.out.println("key : "+key);
//			System.out.println("attribute : "+obj);
//			
//		}//for end
		
		
		
		
	}

	
	//전처리(컨트롤러 가기 전)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		/*
		 * 여기에서 리턴이 true면 -> Controller로 이동
		 * 여기에서 리턴이 false면 -> Controller로 가지 않음
		 */
		HttpSession session = request.getSession();
		
		Object loginUser = session.getAttribute(User.LOGIN_USER);
		
		if(loginUser==null) {
			response.sendRedirect("/index");
			return false;
		}else {
			return true;
		}//if~else end
		
	}//preHandle() end
}
