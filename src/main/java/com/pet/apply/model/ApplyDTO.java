package com.pet.apply.model;

import java.sql.Timestamp;

public class ApplyDTO {

	private String applyNum;
	private String memNum;
	private String applyContent;
	private String applyPrice;
	private Timestamp applyDate;
	private String applyYn;
	private String boardNum;
	
	public ApplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public ApplyDTO(String applyNum, String memNum, String applyContent, String applyPrice, Timestamp applyDate,
			String applyYn, String boardNum) {
		super();
		this.applyNum = applyNum;
		this.memNum = memNum;
		this.applyContent = applyContent;
		this.applyPrice = applyPrice;
		this.applyDate = applyDate;
		this.applyYn = applyYn;
		this.boardNum = boardNum;
	}

	public String getApplyNum() {
		return applyNum;
	}

	public void setApplyNum(String applyNum) {
		this.applyNum = applyNum;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getApplyContent() {
		return applyContent;
	}

	public void setApplyContent(String applyContent) {
		this.applyContent = applyContent;
	}

	public String getApplyPrice() {
		return applyPrice;
	}

	public void setApplyPrice(String applyPrice) {
		this.applyPrice = applyPrice;
	}

	public Timestamp getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Timestamp applyDate) {
		this.applyDate = applyDate;
	}

	public String getApplyYn() {
		return applyYn;
	}

	public void setApplyYn(String applyYn) {
		this.applyYn = applyYn;
	}

	public String getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	
	
}
