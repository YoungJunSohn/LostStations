package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.User;

@Repository
public class UsersDAOImpl implements UsersDAO {

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	@Override
	public User selectPlayTop() {
		return session.selectOne("users.selectPlayTop");
	}
	
	@Override
	public User selectRegisterTop() {
		return session.selectOne("users.selectRegisterTop");
	}
	
	@Override
	public User selectVerifiTop() {
		return session.selectOne("users.selectVerifiTop");
	}
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	//////////////////////////////////ㅈㅎ///////////////////////////////////
	@Override
	public List<User> quizRegisterRankng(PageVO pageVO) {
	return session.selectList("users.selectRegisterRankingList", pageVO);
	}// quizRegisterRankng end
	
	
	//검증 문제 채택 수
	@Override
	public int selectVerifyQuizAdoptCount(int userNo) {
	// TODO Auto-generated method stub
	return session.selectOne("users.selectVerifyQuizAdoptCount", userNo);
	}
	
	//검증한 문제 수
	@Override
	public int selectVerifyQuizCount(int userNo) {
	// TODO Auto-generated method stub
	return session.selectOne("users.selectVerifyQuizCount", userNo);
	}
	
	//////////////////////////////////ㅈㅎ///////////////////////////////////
	
	// 0622 출제랭킹페이지 정답률
	@Override
	public double selectOtherUserCorrectRate(int userNo) {
		return session.selectOne("users.selectOtherUserCorrectRate", userNo);
	}// selectCountVerifiedQuiz end

	// 0621 출제랭킹페이지의 채택률
	@Override
	public double selectPercentageOfVerification(int userNo) {
		return session.selectOne("users.selectPercentageOfVerification", userNo);
	}// selectCountVerifiedQuiz end

	// 0621 출제랭킹페이지의 검증된 문제 수
	@Override
	public int selectCountVerifiedQuiz(int userNo) {
		return session.selectOne("users.selectCountVerifiedQuiz", userNo);
	}// selectCountVerifiedQuiz end

	// 0620 랭킹페이지의 총 페이지 수
	@Override
	public int selectUserListTotal() {
		return session.selectOne("users.selectUserListTotal");
	}// selectUserListTotal end

	// 유저정보 하나 얻어오기
	@Override
	public User selectOne(int no) {
		return session.selectOne("users.selectOne", no);
	}// selectOne() end

	// 플레이 랭킹 얻어오기
	@Override
	public int updateProfileImage(User user) {
		return session.update("users.updateProfileImage", user);
	}// updateProfileImage() end

	// 플레이 랭킹 얻어오기
	@Override
	public User selectUserPlayRank(int userNo) {
		return session.selectOne("users.selectUserPlayRank", userNo);
	}// selectUserPlayRank() end

	// 출제 랭킹 얻어오기
	@Override
	public User selectUserRegistrationRank(int userNo) {
		return session.selectOne("users.selectUserRegistrationRank", userNo);
	}// selectUserRegistrationRank() end

	// 검증 랭킹 얻어오기
	@Override
	public User selectUserverificationRank(int userNo) {
		return session.selectOne("users.selectUserverificationRank", userNo);
	}// selectUserverificationRank() end
	@Override
	public int insert(User user) {
		return session.insert("users.insert", user);
	}// insert() end

	// 아이디 중복체크
	@Override
	public int selectCheckId(String id) {
		return session.selectOne("users.selectCheckId", id);
	}// selectCheckId() end

	// 닉네임 중복체크
	@Override
	public int selectCheckNickname(String nickname) {
		return session.selectOne("users.selectCheckNickname", nickname);
	}// selectCheckNickname() end
	@Override
	public User selectByNo(int no) {
		return session.selectOne("users.selectByNo", no);
	}// selectByNo() end

	// 로그인
	@Override
	public User selectLogin(User user) {
		return session.selectOne("users.selectLogin", user);
	}// selectLogin() end

	// 비밀번호 찾기 시 회원정보 체크
	@Override
	public int selectCheckNameId(User user) {
		return session.selectOne("users.selectCheckNameId", user);
	}// selectCheckId() end

	// 비밀번호 찾기 시 유저 번호 받아오기
	@Override
	public User selectUserInfo(User user) {
		return session.selectOne("users.selectUserInfo", user);
	}// selectUserInfo() end

	// 비밀번호 update
	@Override
	public int updatePassword(User user) {
		return session.update("users.updatePassword", user);
	}// selectCheckNickname() end

} // UsersDAO end
