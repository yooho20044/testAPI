package com.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.api.dao.NoticeDAO;
import com.api.dto.NoticeDTO;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO dao;
	
	public int insert(NoticeDTO dto) throws Exception{
		return dao.insert(dto);
	}
}
