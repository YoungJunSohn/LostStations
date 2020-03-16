package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.CommentData;
import com.spoon.loststations.vo.EM;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.User;

public interface EMsDAO {

	public int countQuizList(int userNo);
	public int countVerifiedQuiz(int userNo);
	public int selectErrorCount(int userNo);
	public int selectUserListTotal();
	public List<User> quizVerifyRankng(PageVO pageVO);
	public CommentData selectUserNo(int userNo);
	public List<EM> selectList(PageVO pageVO);
	public int selectListTotal(int qiNo);
	public int insert(EM em);
	public int update(int no);
	public EM selectOne(int no);
	public int adoptUpdate(int no);
	public int likeUpdate(EM em);

}
