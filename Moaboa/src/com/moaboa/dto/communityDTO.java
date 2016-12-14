package com.moaboa.dto;

public class communityDTO {
	// 함께 보기 게시판에 대한 DTO
	
	/*Member Variable*/
	private int cno; // 게시물 번호
	private int attCount; // 참석 인원
	private String time; // 영화 시간대
	private int roomNo; // 채팅방 번호
	private int mno; // 영화 번호

	
	/*Constructor*/
	public communityDTO(){}
	public communityDTO(int cno, int attCount, String time, int roomNo, int mno) {
		super();
		this.cno = cno;
		this.attCount = attCount;
		this.time = time;
		this.roomNo = roomNo;
		this.mno = mno;
	}
	
	/*Get/Set Method*/
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getAttCount() {
		return attCount;
	}
	public void setAttCount(int attCount) {
		this.attCount = attCount;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
}
