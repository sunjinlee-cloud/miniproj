package com.pet.qna.model;

import java.sql.Date;

public class QnaDTO {
    
	//테이블의 컬럼을 변수로 선언	
	private int qnaNum;
	private String qnaTitle;
    private String qnaContent;
    private Date qnaDate;
    private String memNum;
    
    //기본 생성자 생성
    public QnaDTO() {}
    
    //전체 필드 생성자 생성
    public QnaDTO(int qnaNum, String qnaTitle, String qnaContent, Date qnaDate, String memNum) {
		super();
		this.qnaNum = qnaNum;
		this.qnaTitle = qnaTitle;
		this.qnaContent = qnaContent;
		this.qnaDate = qnaDate;
		this.memNum = memNum;
	}
    

    // Getter & Setter    
	public int getQnaNum() {
		return qnaNum;
	}


	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
	}

	
	public String getQnaTitle() {     	
    	return qnaTitle;   	
    }
    

	public void setQnaTitle(String qnaTitle) {    	
    	this.qnaTitle = qnaTitle;    	
    }

	
	public String getQnaContent() {    	
    	return qnaContent;    	
    }
    
	
	public void setQnaContent(String qnaContent) {    	
    	this.qnaContent = qnaContent;    	
    }
	
	
	public Date getQnaDate() {
		return qnaDate;
	}


	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}


	public String getMemNum() {
		return memNum;
	}


	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

}