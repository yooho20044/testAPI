package com.api.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {

	@Autowired
	private SqlSession session;
	
	public int count(int post_no) throws Exception{
		return session.selectOne("likeMapper.count", post_no);
		
	}
	public int plus(String user_id, int post_no) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("post_no", post_no);
		return session.update("likeMapper.plus", map);
	}
	public int minus(String user_id, int post_no) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("post_no", post_no);
		return session.update("likeMapper.minus", map);
	}
	
	public int selectLike(String user_id, int post_no) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("post_no", post_no);
		return session.selectOne("likeMapper.selectLike", map);
	}
}
