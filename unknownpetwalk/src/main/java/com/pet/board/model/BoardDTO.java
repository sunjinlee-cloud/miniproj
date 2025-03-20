package com.pet.board.model;

import java.sql.Timestamp;

public class BoardDTO {

	private String boardNum;
	private String boardType;
	private String boardTitle;
	private Timestamp regdate;
	private String boardContent;
	private String pay;
	private String jobTaker;
	private String petNum;
	private String reviewContent;
	private int reviewScore;
	private String boardImage;
	private String memNum;
	private String boardAddress;
	
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}


	public BoardDTO(String boardNum, String boardType, String boardTitle, Timestamp regdate, String boardContent,
			String pay, String jobTaker, String petNum, String reviewContent, int reviewScore, String boardImage,
			String memNum, String boardAddress) {
		super();
		this.boardNum = boardNum;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.regdate = regdate;
		this.boardContent = boardContent;
		this.pay = pay;
		this.jobTaker = jobTaker;
		this.petNum = petNum;
		this.reviewContent = reviewContent;
		this.reviewScore = reviewScore;
		this.boardImage = boardImage;
		this.memNum = memNum;
		this.boardAddress = boardAddress;
	}


	public String getBoardNum() {
		return boardNum;
	}


	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}


	public String getBoardType() {
		return boardType;
	}


	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public Timestamp getRegdate() {
		return regdate;
	}


	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public String getPay() {
		return pay;
	}


	public void setPay(String pay) {
		this.pay = pay;
	}


	public String getJobTaker() {
		return jobTaker;
	}


	public void setJobTaker(String jobTaker) {
		this.jobTaker = jobTaker;
	}


	public String getPetNum() {
		return petNum;
	}


	public void setPetNum(String petNum) {
		this.petNum = petNum;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public int getReviewScore() {
		return reviewScore;
	}


	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}


	public String getBoardImage() {
		return boardImage;
	}


	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}


	public String getMemNum() {
		return memNum;
	}


	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}


	public String getBoardAddress() {
		return boardAddress;
	}


	public void setBoardAddress(String boardAddress) {
		this.boardAddress = boardAddress;
	}
	
	
}
