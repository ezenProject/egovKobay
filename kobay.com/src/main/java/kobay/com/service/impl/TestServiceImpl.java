package kobay.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import kobay.com.service.TestService;
import kobay.com.service.TestVO;

@Repository(value="testSERVICE")
public class TestServiceImpl implements TestService {

	@Resource(name="testDAO")
	private TestDAO testDao;
	
	@Override
	public TestVO getDept(int deptno) throws Exception {
		// TODO Auto-generated method stub
		return testDao.getDept(deptno);
	}

}
