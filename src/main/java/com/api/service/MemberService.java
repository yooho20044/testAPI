package com.api.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.api.dao.MemberDAO;
import com.api.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	
	public boolean isLoginOk(String user_id, String password) throws Exception{
		if(dao.isLoginOk(user_id, password) == 1) {
			return true;
		}else {
			return false;
		}
	}
	
	public MemberDTO getMember(String user_id) throws Exception{
		return dao.getMember(user_id);
	}
}
