package kobay.com.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.KobayVO;

@Repository("kobayDAO")
public class KobayDAO extends EgovAbstractDAO {
	
	public String insertWrite(KobayVO vo){
		return (String) insert("kobayDAO.insertWrite",vo);
	}
	
}
