package kr.co.test.upload;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileUploadController {
	@Autowired
	// setter 없어도 method를 알고 있음
	FileValidator fileValidator;

	@RequestMapping(value="/upload/upload.do",method=RequestMethod.GET)
	public String uploadForm(){
		return "upload/form";
	}
/*	@RequestMapping(value="/upload/upload.do", method=RequestMethod.POST)
	public ModelAndView uploading(
		@ModelAttribute("uploadFile")UploadFile uploadfile, HttpServletRequest req, BindingResult result){
		//@ModelAttribute("dto")MemberDTO dto : 이 객체를 참조값에 담아라는 뜻으로 두개 다 같은 표현
		// 업로드한 파일 객체 가져오기
		// 내부적으로 임의의 경로에 파일을 보관해둔다.
		MultipartFile file = uploadfile.getFile();
		System.out.println("file : "+file);
		
		// 파일 유효성 검사 후 성공하면 작업 계속
		// 실패하면 중단
		fileValidator.validate(uploadfile, result);
		if(result.hasErrors()){
			// 다시 돌아가..
			return new ModelAndView("/upload/form");
		}
		
		
		// 어디에 저장? 경로
		HttpSession hs = req.getSession();
		ServletContext application = hs.getServletContext();
		String filepath = application.getRealPath("/WEB-INF/data");
		System.out.println("진짜 파일이 저장 될 os경로 : "+filepath);
		// 파일의 원본이름
		String fileName = file.getOriginalFilename();
		File f = new File(filepath+"/"+fileName);
		// 임시저장소에 보관한 파일을 저장하고자 하는
		// 경로에 복사
		
		try {
			file.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new ModelAndView("upload/uploadFile","fileName",f.getName());
	}*/
	
	// @ResponseBody
	// 웹애플리케이션의 모델층에서 리턴한 결과물을 
	// 보통 JSP(뷰)로 포워딩하여 출력한다.
	// 이때 뷰페이지를 통하지 않고 바로 출력스트림으로
	// 보내는 것
	
	@RequestMapping(value="/upload/transferOk.do",method=RequestMethod.GET)
	public String transfer(){
		return "upload/transferOk";
	}
	
	@RequestMapping("/index.do")
	public String index(){
		return "upload/index";
	}
	
	@RequestMapping(value="upload/download.do")
	@ResponseBody
	public byte[] download(HttpServletResponse resp, HttpServletRequest req, @RequestParam("filename")String fileName) throws IOException{
		
		// 파일의 절대경로 구하기
		// /WEB-INF/data 절대경로
		String filePath = req.getSession().getServletContext().getRealPath("/WEB-INF/data");
		/*HttpSession session = req.getSession();
		ServletContext application = session.getServletContext();
		application.getRealPath("/WEB-INF/data");*/
		
		// 파일의 절대경로
		String absFilePath = filePath + "/" +fileName;
		// c:\\~~\~~\\파일명
		
		File f = new File(absFilePath);
		
		// 파일을 byte형태로 변형 시키기
		
		byte[] b = FileCopyUtils.copyToByteArray(f);
		// 브라우저가 지금 보내는 내용을 이해할 수 있도록
		// 헤더를 추가
		
		// 파일의 이름
		String fn = new String(f.getName().getBytes(),"iso_8859_1");
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
		// 파일의 길이
		resp.setContentLength(b.length);
		
		// 파일의 종류
		resp.setContentType("image/jpeg");
		
		// viewResolver가 리턴한 String을 가지고
		// 찾아가야 할 뷰를 결정

		return b;
		
		
	}
	
}
