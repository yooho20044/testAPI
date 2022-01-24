package com.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.api.dto.ProductDTO;
import com.api.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/selectAll.do")
	public String selectAll(Model model) throws Exception{
		List<ProductDTO> list = service.selectAll();
		model.addAttribute("list", list);
		return "toProduct";
	}
	
}
