package kobay.com.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kobay.com.service.TestService;
import kobay.com.service.TestVO;

@Controller
public class MainController {

	@RequestMapping (value="/main")
	public String mainView() {
		return "main/main";
	}

	/**
	 * Test Server
	 */
	@Resource(name="testSERVICE")
	TestService testService;
	
	@RequestMapping (value="/test")
	public String testView(@RequestParam("deptno") int deptno, Model model) throws Exception {
		TestVO dept = testService.getDept(deptno);
		model.addAttribute("dept", dept);
		
		return "main/test";
	}
}
