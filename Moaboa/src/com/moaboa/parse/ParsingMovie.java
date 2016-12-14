package com.moaboa.parse;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;

import com.moaboa.dao.MovieDAO;
import com.moaboa.dto.MovieDTO;
import com.moaboa.dto.ShowTimeDTO;
import com.moaboa.dto.TheaterDTO;

public class ParsingMovie {
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
	
	public Elements getMovies(Document doc){
		return doc.select("div.theater");	
	}
	
	public String getTitle(Element movie){
		
		return movie.select("").text();
	}
	
	public String getTheater(Element theater){
		return theater.select("div.desc h2.name").text();
	}
	
	public String getlocation(Element theater){
		return theater.select("div.desc div.info").text();
	}
	
	public Elements getLeftMovieInfoName(Element movie){
		return movie.select("div.show_left div.movie");
	}
	
	public Elements getRightMovieInfoName(Element movie){
		return movie.select("div.show_Right div.movie");
	}
	
	public String getMovieName(Element movie){
		return movie.select("div.name").text();
	}


	
	public static void main(String[] args) {
		
		String localName = "강남";
		String url = "http://www.google.co.kr/movies?near=" + localName + "&date=1";
		ArrayList<String> mNameList = new ArrayList<String>();
		ParsingMovie pm = new ParsingMovie();
		Elements els = pm.getMovies(pm.getDocument(url));
		
		// 영화관 정보
		for(Element el : els){
			// Extract info for inserting Theater Table
			String theaterName = pm.getTheater(el); // 영화관 이름
			String location = pm.getlocation(el); // 영화관 위치
			
			TheaterDTO tDto = new TheaterDTO(theaterName, localName, location);
			//System.out.println("INSERT INTO theater(theatername, localname, location) VALUES('"+theaterName+"', '"+localName+"','"+location+"');");
			// Extract info for inserting showTime Table
			Elements movieElsLeftSide = pm.getLeftMovieInfoName(el);
			Elements movieElsRightSide = pm.getRightMovieInfoName(el);

			for(Element movieInfoLeft : movieElsLeftSide){
				// Extract info for inserting Movie Table
				MovieDAO mDao = new MovieDAO();
				String mName = pm.getMovieName(movieInfoLeft); // 영화 이름

				/*if(!mNameList.contains(mName)){
					mNameList.add(mName);
				if(mDao.selectMovieNum(mName)==0){
					// Daum API
					Document daumMovieDoc = null;
					try {
						daumMovieDoc = Jsoup.connect("https://apis.daum.net/contents/movie").data("apikey", "0ee3547b9f09f3ea282ee99a040e8866").data("q", mName).parser(Parser.xmlParser()).timeout(3000).get();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
					String mImage = daumMovieDoc.select("item thumbnail content").text() + "###" + daumMovieDoc.select("photo1 content").text() + "###" + daumMovieDoc.select("photo2 content").text() + daumMovieDoc.select("photo3 content").text(); // 영화 이미지 url
					String preView = daumMovieDoc.select("trailer link").text(); // 영화 예고편 url
					String director = daumMovieDoc.select("director content").text(); // 영화 감독 이름
					String actor = ""; // 영화 출연진
					for(Element actorEl : daumMovieDoc.select("actor content")){
						actor += actorEl.text() + "###";
					}
				
					String mGenre = "";
					for(Element genreEl : daumMovieDoc.select("genre content")){
						mGenre += genreEl.text() + "/";
					}
					String movieGrade = ""; // 영화 상영 등급
					String mDate = daumMovieDoc.select("audience_date content").text(); // 영화 개봉 일자
				
					MovieDTO mDto = new MovieDTO(mName, mImage, preView, mGenre, director, actor, mDate);
					System.out.println("INSERT INTO movie(mno, mname, mimage, preview, mgenre, director, actor, mdate) VALUES(movie_mno_seq.nextval, '" + mName + "', '" + mImage + "', '" +  preView + "', '" + mGenre + "', '" + director + "', '" + actor + "', '" + mDate+"');");
					System.out.println();*/
				
					/*mDao.insertOne(mDto);*/
					String sTime = "";
					String interpark = "";
					for(Element movieTimeLink : movieInfoLeft.select("div.times")){
						if(!movieTimeLink.select("span a").isEmpty()){
							sTime += movieTimeLink.select("span a").text();
							interpark += ("http://www.google.co.kr" + movieTimeLink.select("span a").attr("href"));
						}else{
							interpark += "invalid";
						}
					}
					System.out.println("INSERT INTO showtime(sno, mno, stime, interpark, theatername) VALUES(showtime_sno_seq.nextval, "+mName+",'"+sTime+"','"+interpark+"', '"+theaterName+"');");
					/*ShowTimeDTO sTimeDto = new ShowTimeDTO(mDao.selectMovieNum(mName), sTime, interpark, theaterName);*/
				//}
			}
			
			
			for(Element movieInfoRight : movieElsRightSide){
				// Extract info for inserting Movie Table
				MovieDAO mDao = new MovieDAO();
				String mName = pm.getMovieName(movieInfoRight); // 영화 이름

				/*if(!mNameList.contains(mName)){
					mNameList.add(mName);
				//if(mDao.selectMovieNum(mName)==0){
					// Daum API
					Document daumMovieDoc = null;
					try {
						daumMovieDoc = Jsoup.connect("https://apis.daum.net/contents/movie").data("apikey", "15d68b8c35c32f2562dafa47e124b4cf").data("q", mName).parser(Parser.xmlParser()).timeout(3000).get();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
					String mImage = daumMovieDoc.select("item thumbnail content").text() + "###" + daumMovieDoc.select("photo1 content").text() + "###" + daumMovieDoc.select("photo2 content").text() + daumMovieDoc.select("photo3 content").text(); // 영화 이미지 url
					String preView = daumMovieDoc.select("trailer link").text(); // 영화 예고편 url
					String director = daumMovieDoc.select("director content").text(); // 영화 감독 이름
					String actor = ""; // 영화 출연진
					for(Element actorEl : daumMovieDoc.select("actor content")){
						actor += actorEl.text() + "###";
					}
				
					String mGenre = "";
					for(Element genreEl : daumMovieDoc.select("genre content")){
						mGenre += genreEl.text() + "/";
					}
					String movieGrade = ""; // 영화 상영 등급
					String mDate = daumMovieDoc.select("audience_date content").text(); // 영화 개봉 일자
				
					MovieDTO mDto = new MovieDTO(mName, mImage, preView, mGenre, director, actor, mDate);
					System.out.println("INSERT INTO movie(mno, mname, mimage, preview, mgenre, director, actor, mdate) VALUES(movie_mno_seq.nextval, '" + mName + "', '" + mImage + "', '" +  preView + "', '" + mGenre + "', '" + director + "', '" + actor + "', '" + mDate+"');");
					System.out.println();
				 	*/
					//mDao.insertOne(mDto);
					String sTime = "";
					String interpark = "";
					for(Element movieTimeLink : movieInfoRight.select("div.times")){
						if(!movieTimeLink.select("span a").isEmpty()){
							sTime += movieTimeLink.select("span a").text();
							interpark += ("http://www.google.co.kr" + movieTimeLink.select("span a").attr("href"));
						}else{
							interpark += "invalid";
						}
					}
					System.out.println("INSERT INTO showtime(sno, mno, stime, interpark, theatername) VALUES(showtime_sno_seq.nextval, "+mName+",'"+sTime+"','"+interpark+"', '"+theaterName+"');");
					/*ShowTimeDTO sTimeDto = new ShowTimeDTO(mDao.selectMovieNum(mName), sTime, interpark, theaterName);*/

				//}

			}
		}
	}
}

