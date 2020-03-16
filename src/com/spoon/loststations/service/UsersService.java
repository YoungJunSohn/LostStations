package com.spoon.loststations.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.spoon.loststations.vo.Cert;
import com.spoon.loststations.vo.User;

public interface UsersService {

	public Map<String, Object> getTopRanking();
	
	/*********************** 영준 start ***********************/
	public Map<String, Object> uploadProfile(int no);
	public String setProfileDefault(HttpSession session);
	public String setProfile(int no,HttpServletRequest request, MultipartFile profile,HttpSession session);
	/*********************** 영준 end ***********************/

	///////BC
	public int insertUser(User user);

	public User login(User user);
	
	public int selectCheckId(String id);

	public int selectCheckNickname(String nickname);
	
	public User selectByNo(int no);

	public int selectCheckNameId(User user,HttpServletRequest req);
	
	public int updatePassword(User user);
	
	public User selectUserInfo(User user);
	
	////////////////////////ㅈㅎ////////////////////////////
	public Map<String, Object> getRegisterRanking(int page);
}
