package com.api.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.api.dto.CartDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSession session;
	
	public int insertCart(CartDTO dto) throws Exception{
		return session.update("cartMapper.insertCart", dto);
	}
	
	public List<Object> selectCart(String user_id) throws Exception{
		return session.selectList("cartMapper.selectCart", user_id);
	}
	
	public int deleteCart(String name) throws Exception{
		return session.update("cartMapper.deleteCart",name);
	}
}
