package com.api.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if(service.isLoginOk(user_id, password)) {
			MemberDTO dto = service.getMember(user_id); 
			session.setAttribute("loginSession", dto);
			return "list";
		}else{
			return "";
		}
	}
	
}
