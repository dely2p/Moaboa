package com.moaboa.dto;

public class TheaterDTO {
	/*Member Variable*/
	private String theaterName; // 영화관 이름
	private String localName; // 지역 구분
	private String location; // 영화관 위치

	/*Constructor*/
	public TheaterDTO(){}
	public TheaterDTO(String theaterName, String localName, String location) {
		super();
		this.theaterName = theaterName;
		this.localName = localName;
		this.location = location;
	}
	
	/*Get/Set Method*/
	public String getTheaterName() {
		return theaterName;
	}
	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}
	public String getLocalName() {
		return localName;
	}
	public void setLocalName(String localName) {
		this.localName = localName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
