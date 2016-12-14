package com.moaboa.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;

import com.moaboa.dto.MovieDTO;

public class MovieDAO{
	SqlSession ss;
	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	public void insertOne(MovieDTO dto) {
		ss.insert("com.moaboa.dao.insertMovieInfo", dto);
	}
	
	public MovieDTO selectOne(int mno){
		return ss.selectOne("com.moaboa.dao.selectMovieInfo", mno);
	}
	
	public int selectMovieNum(String mName){
		System.out.println(ss);
		return ss.selectOne("com.moaboa.dao.selectMovieNumber", mName);
	}
	
	public List<MovieDTO> selectMovieAll(){
		return ss.selectList("com.moaboa.dao.selectMovieAll");
	}
	
	public List<MovieDTO> selectMovieRandom(){
		ArrayList<MovieDTO> mDTO = new ArrayList<MovieDTO>();
		ArrayList mnoList = new ArrayList<>();
		Random rnd = new Random();
		for(int i=0;i<10;i++){
			int mno = rnd.nextInt(28)+77;
			if(!mnoList.contains(mno)){
				mnoList.add(mno);
				mDTO.add(ss.selectOne("com.moaboa.dao.selectMovieInfo", mno));
			}else{
				i--;
			}
		}
		return mDTO;
	}
}
