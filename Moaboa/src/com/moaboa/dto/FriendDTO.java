package com.moaboa.dto;

public class FriendDTO {
	/*Member Variable*/
	private int fNo; // 친구 번호
	private String userId; // 사용자 계정
	private String fUserId; // 친구 계정

	/*Constructor*/
	public FriendDTO(){}
	public FriendDTO(int fNo, String userId, String fUserId) {
		this.fNo = fNo;
		this.userId = userId;
		this.fUserId = fUserId;
	}
	
	/*Get/Set Method*/
	public int getfNo() {
		return fNo;
	}
	public void setfNo(int fNo) {
		this.fNo = fNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getfUserId() {
		return fUserId;
	}
	public void setfUserId(String fUserId) {
		this.fUserId = fUserId;
	}
}
