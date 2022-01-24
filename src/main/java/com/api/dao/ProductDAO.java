package com.api.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.api.dto.ProductDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession session;

	public List<ProductDTO> selectAll() throws Exception{
		return session.selectList("productMapper.selectAll");
	}
}
