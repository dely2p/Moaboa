package com.moaboa.dto;

public class ShowTimeDTO {
	/*Member Variable*/
	private int sno; // 사영시간 번호
	private int mno; // 영화 번호
	private String sTime; // 상영시간
	private String interpark; // 인터파크 url
	private String theaterName; // 극장명
	private String mName;
	private String location;
	/*Constructor*/
	public ShowTimeDTO(){}
	public ShowTimeDTO(int mno, String sTime, String interpark, String theaterName) {
		super();
		this.mno = mno;
		this.sTime = sTime;
		this.interpark = interpark;
		this.theaterName = theaterName;
	}
	public ShowTimeDTO(int mno, String sTime, String interpark, String theaterName, String mName) {
		super();
		this.mno = mno;
		this.sTime = sTime;
		this.interpark = interpark;
		this.theaterName = theaterName;
		this.mName = mName;
	}
	public ShowTimeDTO(String location, int mno, String sTime, String interpark, String theaterName) {
		super();
		this.mno = mno;
		this.sTime = sTime;
		this.interpark = interpark;
		this.theaterName = theaterName;
		this.location = location;
	}
		
	/*Get/Set Method*/
	public String getLocation(){
		return location;
	}
	public void setLocation(){
		this.location = location;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getMName() {
		return mName;
	}
	public void setMName(String mName) {
		this.mName = mName;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String getInterpark() {
		return interpark;
	}
	public void setInterpark(String interpark) {
		this.interpark = interpark;
	}
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
}
