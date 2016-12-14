package com.moaboa.parse;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.moaboa.dao.WebToonDAO;
import com.moaboa.dto.WebToonDTO;



public class ParsingNaver {
	
	public Document getDocument(String url){
		// Web Page의 Document 객체를 반환하는 Method
		Document doc = null;
		try {
			doc = Jsoup.connect(url).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return doc;
	}
	
	public Elements getWebToonElements(Document doc){
		// 해당 Document 객체 내의 웹툰 Elements 객체를 반환하는 Method
		return doc.select("ul.img_list dl dt a");
	}
	
	public String getTitle(Element webToon){
		// 웹툰의 제목을 얻어내는 Method
		return webToon.toString().split("title=\"")[1].split("\">")[0];
	}
	
	public String getURL(Element el){
		// Elements 객체에 대한 하이퍼링크를 반환하는 Method
		return "http://comic.naver.com/" + el.attr("href");
	}
	
	public String getRecentlyToon(Document doc){
		// 해당 웹툰의 최신화 수를 추출하는 Method
		Element el = doc.select("td.title a").get(0);
		String detailUrl = getURL(el);
		String recentlyToon = detailUrl.split("no=")[1].split("&")[0];
		return recentlyToon;
	}
	
	public String getWImage(Element webToon){
		return webToon.parent().parent().parent().select("div.thumb img").attr("src");
	}
	
	public static void main(String[] args) {
		String[] week = {"mon", "tue", "wed", "thu", "fri", "sat", "sun"};
		String url = "http://comic.naver.com/webtoon/weekdayList.nhn?week=" + week[6];
		ParsingNaver naverToon = new ParsingNaver();

		// Naver WebToon Page에 대한 Document 객체를 반환받고 그 객체를 이용하여 해당 요일의 웹툰 리스트를 반환 받음
		Elements webToonList = naverToon.getWebToonElements(naverToon.getDocument(url));
		WebToonDTO dto;
		WebToonDAO dao = new WebToonDAO();
		int webToonCount = 0;
		// 반환 받은 각 웹툰에 대한 title, titleId, 최근 화 저장, 대표 이미지, 각 화의 썸네일 url
		for(Element webToon : webToonList){
			String wName =  naverToon.getTitle(webToon);
			int titleId = Integer.parseInt(naverToon.getURL(webToon).split("titleId=")[1].split("&weekday")[0]);
			int recentlyNo = Integer.parseInt(naverToon.getRecentlyToon(naverToon.getDocument(naverToon.getURL(webToon))));
			String webSite = "naver";
			String wImage = naverToon.getWImage(webToon);
			String wGenre = "";
			String imageUrl = wImage;
			String contentUrl = "http://comic.naver.com/webtoon/detail.nhn?titleId=" + titleId + "&no=" + recentlyNo;
/*			dto = new WebToonDTO(wName, wImage, webSite, recentlyNo, wGenre, imageUrl, contentUrl, week[0], titleId);
			dao.insertOne(dto);*/
			
			System.out.println("INSERT INTO webtoon(wname, wimage, titleid, website, recentlyno, wgenre, imageurl, contenturl, week)");
			System.out.println("VALUES('" + wName + "', '" + wImage + "', " + titleId + ", '" + webSite + "', " + recentlyNo + ", '장르', '" + imageUrl +  "', '" + contentUrl + "', '" + week[6] + "');");
			System.out.println();
			
		}	
	}
	

}
