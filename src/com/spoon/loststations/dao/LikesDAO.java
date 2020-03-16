package com.spoon.loststations.dao;

import com.spoon.loststations.vo.Like;

public interface LikesDAO {

	public Like selectOne(Like like);
	public int selectCount(Like like);
	public int delete(Like like);
	public int insert(Like like);

}
