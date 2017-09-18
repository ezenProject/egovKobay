package kobay.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;

@Service("kobayService")
public class KobayServiceImpl extends EgovAbstractServiceImpl implements KobayService {
	
	@Resource(name="kobayDAO")
	private KobayDAO kobayDAO;

	@Override
	public String insertWrite(KobayVO vo) throws Exception {
		
		return kobayDAO.insertWrite(vo);
	}

}
