package com.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.dto.CartDTO;
import com.api.service.CartService;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Autowired
	private CartService service;
	
	@RequestMapping(value="/insertCart.do")
	@ResponseBody
	public int insertCart(CartDTO dto) throws Exception {
		return service.insertCart(dto);	
	
	}
	
	@RequestMapping(value="/selectCart.do")
	public String selectCart(String user_id, Model model) throws Exception{
		
		List<Object> list = service.selectCart(user_id);
		model.addAttribute("list", list);
		return "cart";
	}
	
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(String name) throws Exception{
		service.deleteCart(name);
		return "redirect:/cart/selectCart.do?user_id=ddd111";
	}
}
