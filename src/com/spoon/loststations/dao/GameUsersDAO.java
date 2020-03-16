package com.spoon.loststations.dao;

import com.spoon.loststations.vo.GameUser;
import com.spoon.loststations.vo.PlayData;

public interface GameUsersDAO {

	public PlayData selectUserNo(int userNo);
	public int insert(GameUser gameUser);
	public GameUser getOne(GameUser gameUser);

}
