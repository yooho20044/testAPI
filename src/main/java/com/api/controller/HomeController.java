package com.api.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/")
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value="/toReply.do")
	public String toReply() {
		return "toReply";
	}
	
	@RequestMapping(value="/toMakeReply.do")
	public String toMakeReply() {
		return "toMakeReply";
	}
	@RequestMapping(value="/toLike.do")
	public String toLike() {
		return "toLike";
	}
	@RequestMapping(value="/toProduct.do")
	public String toProduct() {
		return "toProduct";
	}
}
