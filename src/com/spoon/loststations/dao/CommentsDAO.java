package com.spoon.loststations.dao;

import java.util.List;

import com.spoon.loststations.vo.Comment;
import com.spoon.loststations.vo.PageVO;

public interface CommentsDAO {

	public int selectListTotal(int qiNo);
	public List<Comment> selectQuizList(PageVO page);
	public int insert(Comment commnet);
	public int update(Comment comment);
	public List<Comment> selectList(PageVO pageVO);

}
