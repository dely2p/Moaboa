package com.moaboa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.moaboa.dto.DubbingDTO;
import com.moaboa.dto.WebToonDTO;

public class DubbingDAO implements Dao {

	SqlSession ss;
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	@Override
	public void insertOne(Object dto) {
		dto = (DubbingDTO)dto;
		
		System.out.println("insertOne내용입니다");
		ss.insert("com.moaboa.dao.insertdubbing", dto);
	}
	
	public List<WebToonDTO> selectOne(String wname){
		return ss.selectList("com.moaboa.dao.selectOneWebToon" , wname);
	}
	
	public List<WebToonDTO> selectListAll(){
		return ss.selectList("com.moaboa.dao.selectListAll");
	}

	
	public List selectAll(String week) {
		return ss.selectList("com.moaboa.dao.selectDubbingAll", week);
	}

	public void deleteOne(Object dto) {
		
	}
	public String selectWName(int wno) {
		// TODO Auto-generated method stub
		return ss.selectOne("com.moaboa.dao.selectWName", wno);
	}

}
