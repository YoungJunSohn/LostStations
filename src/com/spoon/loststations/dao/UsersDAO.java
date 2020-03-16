package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.User;

public interface UsersDAO {

	public double selectOtherUserCorrectRate(int userNo);
	public double selectPercentageOfVerification(int userNo);
	public int selectCountVerifiedQuiz(int userNo);
	public int selectUserListTotal();
	/////////////////////재현//////////////////////////
	public List<User> quizRegisterRankng(PageVO pageVO);
	public int selectVerifyQuizCount(int userNo); //검증한 문제수
	public int selectVerifyQuizAdoptCount(int userNo);
	/////////////////////재현//////////////////////////
	public User selectOne(int no);
	public int updateProfileImage(User user);
	public User selectUserPlayRank(int userNo);
	public User selectUserRegistrationRank(int userNo);
	public User selectUserverificationRank(int userNo);
	public int insert(User user);
	public int selectCheckId(String id);
	public int selectCheckNickname(String nickname);
	public User selectByNo(int no);
	public User selectLogin(User user);
	public int selectCheckNameId(User user);
	public User selectUserInfo(User user);
	public int updatePassword(User user);
	public User selectPlayTop();
	public User selectRegisterTop();
	public User selectVerifiTop();
	
}
