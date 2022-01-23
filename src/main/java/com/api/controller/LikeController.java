package com.api.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.service.LikeService;

@Controller
@RequestMapping(value = "/like")
public class LikeController {
	
	@Autowired
	private LikeService service;
	@Autowired
	private HttpSession session;
	

	@RequestMapping("/count.do")
	@ResponseBody
	public int count(int post_no) throws Exception {
		int count = service.count(post_no);
		return count;
	}
	
	@RequestMapping("/plus.do")
	@ResponseBody
	public String plus(String user_id, int post_no) throws Exception{
		if(service.plus(user_id, post_no) ==1) {
			return "available";
		}else {
			return "unavailable";
		}
		
	}
	@RequestMapping("/minus.do")
	@ResponseBody
	public String minus(String user_id, int post_no) throws Exception{
		if(service.minus(user_id, post_no) ==1) {
			return "available";
		}else {
			return "unavailable";
		}
		
	}
	@RequestMapping("/selectLike.do")
	@ResponseBody
	public String selectLike(String user_id, int post_no) throws Exception{
		if(service.selectLike(user_id, post_no) ==1) {
			return "available";
		}else {
			return "unavailable";
		}
		
	}
}
