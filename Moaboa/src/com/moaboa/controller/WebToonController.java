package com.moaboa.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.moaboa.dao.DubbingDAO;
import com.moaboa.dao.WebToonDAO;
import com.moaboa.dto.DubbingDTO;
import com.moaboa.dto.WebToonDTO;

@Controller
public class WebToonController {
	@Autowired
	WebToonDAO webToonDao;
	@Autowired
	DubbingDAO dubbingDao;
	@RequestMapping("/webToon.do")
	public ModelAndView WebToonMainView(@RequestParam(value="week", defaultValue="mon")String week, HttpServletRequest req){
		String[] weekC = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
	      String topWeek = "";
	      for(int i=0;i<weekC.length;i++){
	         if(week.equals("sat")){
	            topWeek = weekC[0];
	         }else if(week.equals("sun")){
	            topWeek = weekC[1];
	         }else if(week.equals(weekC[i])){
	            topWeek = weekC[i+2];
	         }
	      }
	      List<WebToonDTO> wDtoList = webToonDao.selectAll(topWeek);
	      List<WebToonDTO> topWDtoList = new ArrayList<WebToonDTO>();
	      int i = 0;
	      for(WebToonDTO wDto : wDtoList){
	         if(i<4){
	            topWDtoList.add(wDto);
	            i++;
	         }else{
	            break;
	         }
	      }
	      
	      req.setAttribute("topWebToonList", topWDtoList);
	      return new ModelAndView("webToonMainView", "webToonList", webToonDao.selectAll(week));
	}
	@RequestMapping("/webToonDetail.do")
	public ModelAndView WebToonDetail(@RequestParam(value="wname")String wName, @RequestParam(value="site")String site){
		return new ModelAndView("webToonDetail", "webToonDetail", webToonDao.selectWebToon(wName, site));
	}
	@RequestMapping(value="/transferOk.do",method=RequestMethod.GET)
	public String transfer(){
		return "transferOk";
	}
	
	@RequestMapping("/view/poprecorder.do")
	public String poprecoder(){
		
		System.out.println("poprecordersysout");
		return "poprecorder";
	}
	
	
	@RequestMapping("/moaboaDBoard.do")
	public ModelAndView MoaboaDBoard(){
			return new ModelAndView("moaboaDBoard","webSiteList",webToonDao.selectWebSite());
	}
	
	@RequestMapping("/moaboaDBoardDetail.do")
	public ModelAndView MoaboaDBoardDetail(){
		List<WebToonDTO> list = dubbingDao.selectListAll();
		Set<String> set = new HashSet<>();
		for(WebToonDTO dto : list)
			set.add(dto.getwName());
		List<String> dropList = new ArrayList<>();
		Iterator<String> iter = set.iterator();
		while(iter.hasNext())
			dropList.add(iter.next());
		
		HashMap<String, Object> hs = new HashMap<>();
		hs.put("webToonList", list);
		hs.put("dropList", dropList);
		return new ModelAndView("moaboaDBoard","resultObject", hs);
	}
	
	@RequestMapping("/moaboaWebToonDetail.do")
	public ModelAndView MoaboaWebToonDetail(@RequestParam(value="wname")String wname){
		Map<String, Object> map = new HashMap<>();
		map.put("webToonDetail", dubbingDao.selectOne(wname));
		map.put("webToonList", dubbingDao.selectListAll());
		ModelAndView mav = new ModelAndView("moaboaDBoard", map );
		return mav;
	}
	
	
	@RequestMapping("/view/dubbingplayer.do")
	public String dubbingplayer(){
		
		return "dubbingplayer";
	}
	@RequestMapping("/webtoonlist.do")
	public String webtoonlist(){
		
		return "webtoonlist";
	}
	
	@RequestMapping("/view/insertOk.do")
	public String insertdata(HttpServletRequest req, HttpServletResponse resp){
		DubbingDTO dubbingdto = new DubbingDTO();
		
		String filename="", imgurl="", wno="", cnt="";
		
	    // 쿠키값 가져오기
	    Cookie[] cookies = req.getCookies() ;	     
	    if(cookies != null){	         
	        for(int i=0; i < cookies.length; i++){
	            Cookie c = cookies[i] ;
	            // 저장된 쿠키 이름을 가져온다
	            String cName = c.getName();	             
	            // 쿠키값을 가져온다
	            String cValue = c.getValue();	   
	            
	            if(cName.equals("filename"))
	            	filename = cValue;
	            else if(cName.equals("imgurl"))
	            	imgurl = cValue;
	            else if(cName.equals("wno"))
	            	wno = cValue;
	            else if(cName.equals("cnt"))
	            	cnt = cValue;
	        }
	    }
		imgurl = imgurl.replace("%3A",":");
	    int wcnt = Integer.parseInt(cnt);
		System.out.println("filename : "+filename);
		System.out.println("imgurl : "+imgurl);
		System.out.println("wno : "+wno);
		System.out.println("cnt : "+cnt);
		
		
		dubbingdto.setdPath(filename);
		dubbingdto.setwName(dubbingDao.selectWName(Integer.parseInt(wno)));
//		dubbingdto.setwUrl(imgurl);
		dubbingdto.setwUrl(imgurl);
		dubbingdto.setHit(wcnt);
		
		dubbingDao.insertOne(dubbingdto);
		
		return "redirect:/view/poprecorder.do";
	
	}
}
