package com.api.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.dto.MemberDTO;
import com.api.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/login.do", produces="text/html;charset=UTF-8")
	public String login(String user_id, String password) throws Exception{
		System.out.println("접속완료");
		System.out.println(user_id + " : " + password);
		if(service.isLoginOk(user_id, password)) {
			MemberDTO dto = service.getMember(user_id); 
			session.setAttribute("loginSession", dto);
			session.setAttribute("loginID", dto.getUser_id());
			System.out.println(dto);
			return "list";
		}else{
			return "";
		}
	}
	
}
