package com.spoon.loststations.dao;

import com.spoon.loststations.vo.Cert;

public interface CertsDAO {

	public int insert(Cert cert);
	public int delete(int userNo);
	public int selectCheckNo(int userNo);
	
}
