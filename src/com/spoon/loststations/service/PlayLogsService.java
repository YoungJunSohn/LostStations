package com.spoon.loststations.service;

import java.util.Map;

import com.spoon.loststations.vo.PlayLog;

public interface PlayLogsService {
	
/******************************* 영준 start ******************************/	
	public Map<String, Object> getPlayLogs(int no);
/******************************* 영준 end ******************************/
	public Map<String, Object> getPlayRanking(int page);
	int registerAttack(PlayLog playlog);
	int registerTrash(PlayLog playlog);
	int updatePlayLog(PlayLog playlog);
}
