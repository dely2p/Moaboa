package com.moaboa.dto;

public class UserInfoDTO {
	
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String residence;
	private String wGenre;
	private String mGenre;
	private String roomNo;
	
	public UserInfoDTO() {}

	public UserInfoDTO(String userId, String password, String userName, String email, String residence, String wGenre,
			String mGenre, String roomNo) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.email = email;
		this.residence = residence;
		this.wGenre = wGenre;
		this.mGenre = mGenre;
		this.roomNo = roomNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getwGenre() {
		return wGenre;
	}

	public void setwGenre(String wGenre) {
		this.wGenre = wGenre;
	}

	public String getmGenre() {
		return mGenre;
	}

	public void setmGenre(String mGenre) {
		this.mGenre = mGenre;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	
	
	
	
	
	
}
