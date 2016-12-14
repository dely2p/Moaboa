package com.moaboa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.moaboa.dao.MovieDAO;
import com.moaboa.dao.ShowTimeDAO;
import com.moaboa.dao.TheaterDAO;
import com.moaboa.dto.ShowTimeDTO;

@Controller
public class MovieController {
	@Autowired
	ShowTimeDAO sDao;
	@Autowired
	MovieDAO mDao;
	@Autowired
	TheaterDAO tDao;

	@RequestMapping("/movie.do")
	public ModelAndView MovieMainView() {
		return new ModelAndView("movieMainView", "movieList", mDao.selectMovieRandom());
	}

	@RequestMapping("/movieInfo.do")
	public ModelAndView MovieInfoPage(@RequestParam("mno") int mno,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, HttpServletRequest req,
			Model model) {
		// paging
		int total = sDao.getTotal(mno); // 해당 영화 상영관 총 개수
		int startNo = (currentPage - 1) * 3 + 1; // 현재 페이지의 시작 번호
		int endNo = currentPage * 3; // 현재 페이지의 끝 번호
		int totalPage = (total % 3) == 0 ? total/3 : total/3 +1; // 총 페이지 번호 total / 3 = 0
		int startPage = (currentPage - 3 <= 0) ? 1 : currentPage - 3;
		int endPage = (startPage + 3 >= totalPage) ? totalPage : startPage + 3;

		model.addAttribute("total", total);
		model.addAttribute("startNo", startNo);
		model.addAttribute("endNo", endNo);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		req.setAttribute("totaltest", total);
		req.setAttribute("showTimePaging", sDao.selectShowTimePaging(startNo, endNo,mno));
		for (int i = 0; i < sDao.selectShowTimePaging(startNo, endNo,mno).size(); i++) {
			System.out.println(sDao.selectShowTimePaging(startNo, endNo,mno).get(i).getTheaterName());
		}
		req.setAttribute("showTimeList", sDao.selectShowTimeAll(mno));
		req.setAttribute("theaterNameList", tDao.selectTheaterAll());
		req.setAttribute("theaterLocation", sDao.selectTheaterLocationAll(mno));// 영화 상세보기에서 지도 마커 찍을때 필요한 영화관 위치정보

		return new ModelAndView("movieDetailView", "movieInfo", mDao.selectOne(mno));

	}

	@RequestMapping("/timeSearch.do")
	public ModelAndView movieTimeSearch(@RequestParam(value = "sTime", defaultValue = "00") String sTime,
			@RequestParam(value = "location", defaultValue = "강남") String location, HttpServletRequest req) {
		req.setAttribute("theaterNameList", tDao.selectTheaterAll());
		return new ModelAndView("movieTimeSearch", "movieSearchResult", sDao.selectTimeSearch(sTime, location));
	}

}
