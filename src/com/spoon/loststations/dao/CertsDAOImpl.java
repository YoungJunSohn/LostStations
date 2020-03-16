package com.spoon.loststations.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.spoon.loststations.vo.Cert;

@Repository
public class CertsDAOImpl implements CertsDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int insert(Cert cert) {
		 return session.insert("certs.insert",cert);
	}//insert() end
	
	@Override
	public int delete(int userNo) {
		return session.delete("certs.delete",userNo);
	}//delete() end
	
	@Override
	public int selectCheckNo(int userNo) {
		return session.selectOne("certs.selectCheckNo",userNo);
	}//selectCheckNo() end
	
}//CertsDAO end
