package com.moaboa.dto;

public class ChatDTO {
	/*Member Variable*/
	private int roomNo; // 방번호
	private String contents; // 채팅 내용
	private String attList; // 참석자 명단 
	
	/*Constructor*/
	public ChatDTO(){}
	public ChatDTO(int roomNo, String contents, String attList) {
		super();
		this.roomNo = roomNo;
		this.contents = contents;
		this.attList = attList;
	}
	
	/*Get/Set Method*/
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getAttList() {
		return attList;
	}
	public void setAttList(String attList) {
		this.attList = attList;
	}		
}	
