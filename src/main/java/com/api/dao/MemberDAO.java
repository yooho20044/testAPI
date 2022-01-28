package com.api.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.api.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	public int isLoginOk(String user_id, String password) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("password", password);
		return session.selectOne("memberMapper.isLoginOk", map);
	}
	
	public MemberDTO getMember(String user_id) throws Exception{
		return session.selectOne("memberMapper.getMember", user_id);
	}
}
