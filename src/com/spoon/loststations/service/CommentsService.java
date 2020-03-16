package com.spoon.loststations.service;

import java.util.Map;

import com.spoon.loststations.vo.Comment;
import com.spoon.loststations.vo.PageVO;

public interface CommentsService {
	
	public Map<String, Object> register(Comment comment);

	public Map<String, Object> commentList(int page, int qiNo, int userNo);
}
