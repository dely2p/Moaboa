package com.moaboa.dto;

public class MovieDTO {
	/*Member Variable*/
	private int mno; // ��ȭ ��ȣ
	private String mName; // ��ȭ ����
	private String mImage; // ��ȭ ��ǥ �̹��� URL
	private String preView; // ������ URL
	private String mGenre; // ��ȭ �帣
	private String director; // ��ȭ ����
	private String actor; // �⿬ ���
	private String mDate; // ���� ����

	/*Constructor*/
	public MovieDTO(){}
	public MovieDTO(String mName, String mImage, String preView, String mGenre, String director, String actor,
			String mDate) {
		super();

		this.mName = mName;
		this.mImage = mImage;
		this.preView = preView;
		this.mGenre = mGenre;
		this.director = director;
		this.actor = actor;
		this.mDate = mDate;
	}
	
	/*Get/Set Method*/
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmImage() {
		return mImage;
	}
	public void setmImage(String mImage) {
		this.mImage = mImage;
	}
	public String getPreView() {
		return preView;
	}
	public void setPreView(String preView) {
		this.preView = preView;
	}
	public String getmGenre() {
		return mGenre;
	}
	public void setmGenre(String mGenre) {
		this.mGenre = mGenre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	
}
