package com.spoon.loststations.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.PlayData;
import com.spoon.loststations.vo.PlayLog;
import com.spoon.loststations.vo.QuizData;
import com.spoon.loststations.vo.User;

@Repository
public class PlayLogsDAOImpl implements PlayLogsDAO{

	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int update(PlayLog playlog) {
		return session.update("play-logs.update", playlog);
	}
	
	@Override
	public int insertAttack(PlayLog playlog) {
		return session.insert("play-logs.insertAttack", playlog);
	}
	
	@Override
	public int insertTrash(PlayLog playlog) {
		return session.insert("play-logs.insertTrash", playlog);
	}
	
	@Override
	public int selectUserListTotal() {
		return session.selectOne("play-logs.selectUserListTotal");
	}// selectUserListTotal end
	
	@Override
	public double selectWinRate(int userNo) {
		return session.selectOne("play-logs.selectWinRate", userNo);
	}// selectUserNo() end
	
	@Override
	public double selectAvgRank(int userNo) {
		return session.selectOne("play-logs.selectAvgRank", userNo);
	}// selectUserNo() end

	// 0613 QuizPlayRanking.jsp > 승률 뽑는 방법
	@Override
	public double selectCorrectRate(int receiveUserNo) {
		return session.selectOne("play-logs.selectCorrectRate", receiveUserNo);
	}// selectUserNo() end

	// 0613 QuizPlayRanking.jsp > top3명 뽑는 방법
	@Override
	public List<User> selectUserList(PageVO pageVO) {
		return session.selectList("play-logs.selectUserList", pageVO);
	}// selectUserNo() end
	
	@Override
	public List<PlayData> selectUserCategoriesTotal(int userNo) {
		return session.selectList("play-logs.selectUserCategoriesTotal", userNo);
	}// selectUserCategoriesTotal() end
	
	@Override
	public List<PlayData> selectUserCategoriesCorrect(int userNo) {
		return session.selectList("play-logs.selectUserCategoriesCorrect", userNo);
	}// selectUserCategoriesCorrect() end
	
	@Override
	public PlayData selectUserNo(int userNo) {
		return session.selectOne("play-logs.selectUserNo", userNo);
	}// selectUserNo() end
	
	@Override
	public QuizData selectUserAdoptInfo(int userNo) {
		return session.selectOne("play-logs.selectUserAdoptInfo", userNo);
	}// selectUserAdoptInfo() end

}// PlayLogsDAO end
