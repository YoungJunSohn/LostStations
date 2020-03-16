package com.spoon.loststations.service;

import java.util.Map;


public interface ChoicesService {

	public Map<String, Object> getList(int userNo, int adoptPageNo, int qiNo);

	public Map<String, Object> getDetail(int qiNo);
}
