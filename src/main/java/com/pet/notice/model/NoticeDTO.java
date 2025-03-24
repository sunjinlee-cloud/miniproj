package com.pet.notice.model;

import java.sql.Date;

public class NoticeDTO {
    
	//테이블의 컬럼을 변수로 선언	
	private int noticeNum;
	private String noticeTitle;
    private String noticeContent;
    private Date noticeDate;
    private String memNum;
    
    //기본 생성자 생성
    public NoticeDTO() {}
    
    //전체 필드 생성자 생성
    public NoticeDTO(int noticeNum, String noticeTitle, String noticeContent, Date noticeDate, String memNum) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.memNum = memNum;
	}
    
    // Getter & Setter 

	public int getNoticeNum() {
		return noticeNum;
	}

	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
    

      
	
}