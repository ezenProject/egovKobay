package kobay.com.web;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import kobay.com.service.KobayService;
import kobay.com.service.KobayVO;

@Controller
public class KobayController {
	@Resource(name = "kobayService")
	private KobayService kobayService;
	
	@RequestMapping(value = "/uploadFileSave")
	@ResponseBody
	public Map<String, String> multipartProcess(final MultipartHttpServletRequest multiRequest,
			HttpServletResponse response, KobayVO vo, Model model) throws Exception {
		MultipartFile file;
		String filePath = "";
		int cnt = 0;

		Map<String, String> map = new HashMap<String, String>();
		Map<String, MultipartFile> files = multiRequest.getFileMap();
		
		
		String uploadPath = "c:/upload";
//		String uploadPath = egovMessageSource.getMessage("file.upload.path");

		System.out.println("title : " + vo.getTitle());
		System.out.println("path : " + uploadPath);

		// 폴더의 존재 유무 및 생성

		File saveFolder = new File(uploadPath);
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}

		Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();

		/*
		 * 
		 * MultipartFile 의 주요 메소드는 String getName()파라미터 이름을 구한다. String
		 * getOriginalFilename()업로드 한 파일의 실제!! 이름을 구한다. boolean isEmpty()업로드 한
		 * 파일이 존재하지 않는 경우 true를 리턴 한다. long getSize()업로드한 파일의 크기를 구한다. byte[]
		 * getBytes() throws IOException업로드 한 파일 데이터를 구한다. --> 이걸로 파일 쓰면된다.
		 * InputStream getInputStream()InputStrem을 구한다. void transferTo(File
		 * dest)업로드 한 파일 데이터를 지정한 파일에 저장한다. --> 요고도 파일쓰는거다.
		 */
		
		String image = "";
		
		while (itr.hasNext()) {
			Entry<String, MultipartFile> entry = itr.next();
			file = entry.getValue();
			if (!"".equals(file.getOriginalFilename())) {
				filePath = uploadPath + "" + file.getOriginalFilename();
				file.transferTo(new File(filePath));
				
				image += file.getOriginalFilename() + "／";
				
				cnt++;
			}
		}
		
		vo.setImage(image);
		
		System.out.println("filePath : " + filePath);
		
		String result="";
		result = kobayService.insertWrite(vo);
		
		if(result==null){
			cnt = cnt+1;
		}
		
		map.put("cnt", Integer.toString(cnt));
		System.out.println("cnt -> " + cnt);
		return map;
	}
	
}
