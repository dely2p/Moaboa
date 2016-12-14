package com.moaboa.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.moaboa.dto.ShowTimeDTO;
import com.moaboa.dto.StartEnd;

public class ShowTimeDAO{
	SqlSession ss;
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	public void insertOne(ShowTimeDTO dto) {
		ss.insert("com.moaboa.dao.insertMovieInfo", dto);
	}
	
	public List<ShowTimeDTO> selectTimeSearch(String sTime, String location) {
		// 1. location을 사용하여 theaterName 알아오기
		List<String> theaterList = ss.selectList("com.moaboa.dao.getTheaterName", location);
		
		sTime = "%" + sTime + ":%";
		// 2. theaterName과 uTime을 이용하여 DTO 만들기
		ArrayList<ShowTimeDTO> showTimeList = new ArrayList<ShowTimeDTO>();
		for(String theaterName : theaterList){
			ShowTimeDTO sDto = new ShowTimeDTO();
			sDto.setTheaterName(theaterName);
			sDto.setsTime(sTime);
			List<ShowTimeDTO> showTimeResult = ss.selectList("com.moaboa.dao.getShowTimeResult", sDto);
			for(ShowTimeDTO stDto : showTimeResult){
				showTimeList.add(stDto);
			}	
		}
		// 3. 호출
		return showTimeList;
	}
	public List<ShowTimeDTO> selectShowTimeAll(int mno){
		
		return ss.selectList("com.moaboa.dao.selectShowTimeAll", mno);
	}
	
	public List<ShowTimeDTO> selectTheaterLocationAll(int mno){
		
		return ss.selectList("com.moaboa.dao.selectTheaterLocationAll", mno);
	}
	public int getTotal(int mno){
		return ss.selectOne("com.moaboa.dao.getTotal",mno);
	}
	
	public List<ShowTimeDTO> selectShowTimePaging(int startNo, int endNo, int mno) {
		StartEnd se = new StartEnd(startNo, endNo, mno);
		return ss.selectList("com.moaboa.dao.selectShowTimePaging", se);
	}
}
