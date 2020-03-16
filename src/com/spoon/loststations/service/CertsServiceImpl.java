package com.spoon.loststations.service;

import com.spoon.loststations.dao.CertsDAO;
import com.spoon.loststations.vo.Cert;

public class CertsServiceImpl implements CertsService {

	
	public CertsDAO certdao;
	
	public void setCertdao(CertsDAO certdao) {
		this.certdao = certdao;
	}
	
	@Override
	public int insert(Cert cert) {
		// TODO Auto-generated method stub
		return certdao.insert(cert);
	}
	@Override
	public int delete(int userNo) {
		// TODO Auto-generated method stub
		return certdao.delete(userNo);
	}
}
