package com.spoon.loststations.service;

import java.util.Map;

import com.spoon.loststations.vo.Like;

public interface LikesService {
	
	public int likeUpdate(Like like);
	
	public Map<String, Object> likeUpdate(Like like, String clickType);

}
