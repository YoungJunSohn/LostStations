package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.PlayData;
import com.spoon.loststations.vo.PlayLog;
import com.spoon.loststations.vo.QuizData;
import com.spoon.loststations.vo.User;

public interface PlayLogsDAO {

	public int selectUserListTotal();
	public double selectWinRate(int userNo);
	public double selectAvgRank(int userNo);
	public double selectCorrectRate(int receiveUserNo);
	public List<User> selectUserList(PageVO pageVO);
	public List<PlayData> selectUserCategoriesTotal(int userNo);
	public List<PlayData> selectUserCategoriesCorrect(int userNo);
	public PlayData selectUserNo(int userNo);
	public QuizData selectUserAdoptInfo(int userNo);
	public int insertAttack(PlayLog playlog);
	public int insertTrash(PlayLog playlog);
	public int update(PlayLog playlog);
	
}
