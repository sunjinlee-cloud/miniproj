package com.pet.users.model;

import java.sql.Timestamp;

public class UsersDTO {
	
	private String memNum;
	private String memPw;
	private String memPhoto;
	private String memNick;
	private String memType;
	private String memAddress;
	private String memPhone;
	private String memGender;
	private String memIntro;
	
	
	public UsersDTO() {
	}


	public UsersDTO(String memNum, String memPw, String memPhoto, String memNick, String memType, String memAddress,
			String memPhone, String memGender, String memIntro) {
		super();
		this.memNum = memNum;
		this.memPw = memPw;
		this.memPhoto = memPhoto;
		this.memNick = memNick;
		this.memType = memType;
		this.memAddress = memAddress;
		this.memPhone = memPhone;
		this.memGender = memGender;
		this.memIntro = memIntro;
	}


	public String getMemNum() {
		return memNum;
	}


	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}


	public String getMemPw() {
		return memPw;
	}


	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}


	public String getMemPhoto() {
		return memPhoto;
	}


	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}


	public String getMemNick() {
		return memNick;
	}


	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}


	public String getMemType() {
		return memType;
	}


	public void setMemType(String memType) {
		this.memType = memType;
	}


	public String getMemAddress() {
		return memAddress;
	}


	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}


	public String getMemPhone() {
		return memPhone;
	}


	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}


	public String getMemGender() {
		return memGender;
	}


	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}


	public String getMemIntro() {
		return memIntro;
	}


	public void setMemIntro(String memIntro) {
		this.memIntro = memIntro;
	}


	

	

	
	
	
}

