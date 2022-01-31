package com.api.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.api.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSession session;
	
	public int insert(NoticeDTO dto) throws Exception{
		return session.insert("noticeMapper.insert",dto);
	}
	
	public String countMessage(String to_id) throws Exception{
		return session.selectOne("noticeMapper.countMessage",to_id);
	}
}
