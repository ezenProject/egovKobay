package kobay.com.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import kobay.com.service.TestVO;

@Repository(value="testDAO")
public class TestDAO extends EgovAbstractDAO {
	public TestVO getDept(int deptno) throws Exception {
		return (TestVO) select("test.getDept", deptno);
		
	}
}
