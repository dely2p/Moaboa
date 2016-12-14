package com.moaboa.dto;

public class DubbingDTO {
	private int dNo; // 더빙 게시물 번호
	private int hit; // 조회 수
	private String wUrl; // 웹툰 접근 URL
	private String dPath; // 더빙 파일 경로
	private String wName; // 웹툰 이름
	private String userId; // 사용자 계정

	public DubbingDTO() {
	}

	public DubbingDTO(int dNo, int hit, String wUrl, String dPath, String wName, String userId) {
		super();
		this.dNo = dNo;
		this.hit = hit;
		this.wUrl = wUrl;
		this.dPath = dPath;
		this.wName = wName;
		this.userId = userId;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getwUrl() {
		return wUrl;
	}

	public void setwUrl(String wUrl) {
		this.wUrl = wUrl;
	}

	public String getdPath() {
		return dPath;
	}

	public void setdPath(String dPath) {
		this.dPath = dPath;
	}

	public String getwName() {
		return wName;
	}

	public void setwName(String wName) {
		this.wName = wName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
