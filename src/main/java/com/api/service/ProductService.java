package com.api.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.api.dao.ProductDAO;
import com.api.dto.ProductDTO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;
	
	public List<ProductDTO> selectAll() throws Exception{
		return dao.selectAll();
	}
}
