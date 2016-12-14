package com.moaboa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.moaboa.dto.TheaterDTO;

public class TheaterDAO{
	SqlSession ss;
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}
	
	public void insertTheater(TheaterDTO tDto){
		ss.insert("com.moaboa.dao.insertTheater", tDto);
	}

	public List<TheaterDTO> selectTheaterAll(){
		return ss.selectList("com.moaboa.dao.selectTheaterAll");
	}
}
