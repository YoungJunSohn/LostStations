package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.CommentData;
import com.spoon.loststations.vo.EM;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.User;

@Repository
public class EMsDAOImpl implements EMsDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	// 0701 검증한 문제 수
	@Override
	public int countQuizList(int userNo) {
		return session.selectOne("ems.countQuizList", userNo);
	}// countQuizList end

	// 0624 검증문제 채택 수
	@Override
	public int countVerifiedQuiz(int userNo) {
		return session.selectOne("ems.countVerifiedQuiz", userNo);
	}// selectUserListTotal end

	// 0624 오류 채택 수
	@Override
	public int selectErrorCount(int userNo) {
		return session.selectOne("ems.selectErrorCount", userNo);
	}// selectUserListTotal end

	// 0624 verifyranking 페이지 유저 수
	@Override
	public int selectUserListTotal() {
		return session.selectOne("users.selectUserListTotal");
	}// selectUserListTotal end

	// 0624 검증 랭킹 페이지
	@Override
	public List<User> quizVerifyRankng(PageVO pageVO) {
		return session.selectList("ems.selectVerifyRankingList", pageVO);
	}// quizVerifyRankng end
	
	@Override
	public CommentData selectUserNo(int userNo) {
		return session.selectOne("ems.selectUserNo", userNo);
	}// selectUserNo() end
	
	@Override
	public List<EM> selectList(PageVO pageVO) {
		return session.selectList("ems.selectList", pageVO);
	} // selectList() end
	
	@Override
	public int selectListTotal(int qiNo) {
		return session.selectOne("ems.selectListTotal", qiNo);
	} // selectListTotal() end
	
	@Override
	public int insert(EM em) {
		return session.insert("ems.insert", em);
	} // insert() end
	
	@Override
	public int update(int no) {
		return session.update("ems.update", no);
	}
	@Override
	public EM selectOne(int no) {
		return session.selectOne("ems.selectOne", no);
	} // selectOne() end
	
	@Override
	public int adoptUpdate(int no) {
		return session.update("ems.adoptUpdate", no);
	}// 채택여부 update구문
	
	@Override
	public int likeUpdate(EM em) {
		return session.update("ems.likeUpdate", em);
	}// 좋아요, 싫어요 update구문

}// EmsDAO end
