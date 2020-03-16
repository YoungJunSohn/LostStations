package com.spoon.loststations.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spoon.loststations.vo.Comment;
import com.spoon.loststations.vo.PageVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO{
	private SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}
	@Override
	public int selectListTotal(int qiNo) {
		return session.selectOne("comments.selectListTotal", qiNo);
	}// selectListTotal() end
	
	@Override
	public List<Comment> selectQuizList(PageVO page) {
		return session.selectList("comments.selectQuizList", page);
	}// selectQuizList() end
	
	@Override
	public List<Comment> selectList(PageVO pageVO) {
		return session.selectList("comments.selectList", pageVO);
	} // selectList() end
	
	@Override
	public int insert(Comment commnet) {
		return session.insert("comments.insert", commnet);
	} // insert() end
	
	@Override
	public int update(Comment comment) {
		return session.update("comments.update", comment);
	} // insert() end

}// CommentsDAO
