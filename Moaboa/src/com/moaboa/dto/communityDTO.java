package com.moaboa.dto;

public class communityDTO {
	// �Բ� ���� �Խ��ǿ� ���� DTO
	
	/*Member Variable*/
	private int cno; // �Խù� ��ȣ
	private int attCount; // ���� �ο�
	private String time; // ��ȭ �ð���
	private int roomNo; // ä�ù� ��ȣ
	private int mno; // ��ȭ ��ȣ

	
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
