package com.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.dto.CartDTO;
import com.api.dto.TempOrderDTO;
import com.api.service.CartService;

@Controller
@RequestMapping(value="/cart")
public class CartController {

	@Autowired
	private CartService service;
	
	@RequestMapping(value="/insertCart.do")
	@ResponseBody
	public int insertCart(CartDTO dto) throws Exception {
		int check = service.selectById(dto.getUser_id(), dto.getProduct_no());
		if(check==1) {
			return -1;
		}else {
			return service.insertCart(dto);	
		}
	}
	
	@RequestMapping(value="/selectCart.do")
	public String selectCart(String user_id, Model model) throws Exception{
		
		List<TempOrderDTO> list = service.selectCart(user_id);
		model.addAttribute("list", list);
		return "cart";
	}
	
	@RequestMapping(value="/deleteCart.do")
	public String deleteCart(String name) throws Exception{
		service.deleteCart(name);
		return "redirect:/cart/selectCart.do?user_id=ddd111";
	}
	
	@RequestMapping(value="/updateQuantity.do")
	@ResponseBody
	public String updateQuantity(String name, int quantity) throws Exception{
		
		if(service.updateQuantity(name, quantity)==1) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value="/toOrder.do")
	public String toOrder(Model model, String user_id) throws Exception{
		List<TempOrderDTO> list = service.selectCart(user_id);
		model.addAttribute("cartList", list);
		return "order";
		
	}
}
