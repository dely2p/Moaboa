package com.moaboa.dto;

public class WebToonDTO {
	// Member Variable
	private String wName; // 웹툰 이름
	private String wImage; // 웹툰 대표 이미지
	private String webSite; // 웹툰 사이트 명
	private int recentlyNo; // 최근화
	private String wGenre; // 웹툰 장르
	private String imageUrl; // 웹툰 각화에 대한 이미지
	private String contentUrl; // 실제 웹툰 내용의 접근 url
	private String week; // 웹툰 업데이트 화
	private int titleId; // 웹툰 고유 번호

	// Constructor
	public WebToonDTO(){}
	public WebToonDTO(String wName, String wImage, String webSite, int recentlyNo, String wGenre, String imageUrl,
			String contentUrl, String week, int titleId) {
		super();
		this.wName = wName;
		this.wImage = wImage;
		this.webSite = webSite;
		this.recentlyNo = recentlyNo;
		this.wGenre = wGenre;
		this.imageUrl = imageUrl;
		this.contentUrl = contentUrl;
		this.week = week;
		this.titleId = titleId;
	}

	// Get/Set Method
	public String getwName(){return wName;}
	public void setwName(String wName){this.wName = wName;}
	public String getwImage(){return wImage;}
	public void setwImage(String wImage){this.wImage = wImage;}
	public String getWebSite(){return webSite;}
	public void setWebSite(String webSite){this.webSite = webSite;}
	public int getRecentlyNo(){return recentlyNo;}
	public void setRecentlyNo(int recentlyNo){this.recentlyNo = recentlyNo;}
	public String getwGenre(){return wGenre;}
	public void setwGenre(String wGenre){this.wGenre = wGenre;}
	public String getImageUrl(){return imageUrl;}
	public void setImageUrl(String imageUrl){this.imageUrl = imageUrl;}
	public String getContentUrl(){return contentUrl;}
	public void setContentUrl(String contentUrl){this.contentUrl = contentUrl;}
	public String getWeek(){return week;}
	public void setWeek(String week){this.week = week;}
	public int getTitleId(){return titleId;}
	public void setTitleId(int titleId){this.titleId = titleId;}
}
