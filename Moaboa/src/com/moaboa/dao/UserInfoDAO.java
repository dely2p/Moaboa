package com.moaboa.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import com.moaboa.dto.UserInfoDTO;

public class UserInfoDAO implements Dao{
	
	
	SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	
	@Override
	public void insertOne(Object dto) {
		dto = (UserInfoDTO)dto;
		ss.insert("com.moaboa.dao.insertUser", dto);
	}
	
	public UserInfoDTO selectOneUser(String userId){
		
		return ss.selectOne("com.moaboa.dao.selectOneUser", userId);
		
	}
	
	public UserInfoDTO idConfirm(String userId){
		
		return ss.selectOne("com.moaboa.dao.idConfirm", userId);
	}
	
}
