package com.spoon.loststations.service;

import com.spoon.loststations.vo.Cert;

public interface CertsService {
	public int insert(Cert cert);
	public int delete(int userNo);
}
