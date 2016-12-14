package com.moaboa.dto;

public class StartEnd {
	private int startNo;
	private int endNo;
	private int mno;
	public StartEnd(){}

	public StartEnd(int startNo, int endNo, int mno) {
		super();
		this.startNo = startNo;
		this.endNo = endNo;
		this.mno = mno;
	}
	public int getMno(){
		return mno;
	}
	
	public void setMno(int mno){
		this.mno = mno;
	}
	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	
}
