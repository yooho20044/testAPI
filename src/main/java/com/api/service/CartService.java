package com.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.api.dao.CartDAO;
import com.api.dto.CartDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO dao;
	
	public int insertCart(CartDTO dto) throws Exception{
		return dao.insertCart(dto);
	}
	
	public List<Object> selectCart(String user_id) throws Exception{
		return dao.selectCart(user_id);
	}
	
	public int deleteCart(String name) throws Exception{
		return dao.deleteCart(name);
	}
}
