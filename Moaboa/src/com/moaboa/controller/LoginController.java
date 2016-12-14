package com.moaboa.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.moaboa.dao.UserInfoDAO;
import com.moaboa.dto.UserInfoDTO;

@Controller
public class LoginController {
	@Autowired
	UserInfoDAO userDao;

	
	@RequestMapping("/login.do")
	public String login(){
		return "login/login";
	}
	@RequestMapping("/register.do")
	public String register(){
		return "login/register";
	}
	

	@RequestMapping("/registerOk.do")
	public String registerOk(@ModelAttribute("uDto")UserInfoDTO uDto){
		
		if(userDao.idConfirm(uDto.getUserId())==null){
			userDao.insertOne(uDto);
		}else{
			
		}
		return "redirect:/login.do";
	}
	
	@RequestMapping("/checkId.do")
	public String checkId(@RequestParam(value="userId")String userId){
		
		
		UserInfoDTO dto = userDao.idConfirm("userId");
		System.out.println("hello");
		
		return dto.getUserId();
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		
		session.removeAttribute("userId");
		
		return "redirect:/movie.do";
	}
	

	
	
	
	
	@RequestMapping(value="/loginOk.do",method=RequestMethod.GET)
	public String loginOk(@RequestParam(value="userId", defaultValue="")String userId, @RequestParam(value="password", defaultValue="")String password, HttpSession session){
		UserInfoDTO dto = userDao.selectOneUser(userId);
		if(userId.equals("") || password.equals("")){
			return "redirect:/login.do";
		}else{
			if(userId.equals(dto.getUserId()) && password.equals(dto.getPassword())){
				
				session.setAttribute("userId", dto.getUserId());
				session.setAttribute("mNo", dto.getRoomNo());
				
				return "redirect:/movie.do";
			}else{
				return "redirect:/login.do";
			}
		}
		
	}
	
}
