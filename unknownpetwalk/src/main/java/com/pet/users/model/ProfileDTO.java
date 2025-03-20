package com.pet.users.model;

public class ProfileDTO {
	
	private String worksDone;
	private double avgScore;
	private int avgPay;
	
	public ProfileDTO() {
		
	}
	
	public ProfileDTO(String worksDone, double avgScore, int avgPay) {
		super();
		this.worksDone = worksDone;
		this.avgScore = avgScore;
		this.avgPay = avgPay;
	}

	public String getWorksDone() {
		return worksDone;
	}

	public void setWorksDone(String worksDone) {
		this.worksDone = worksDone;
	}

	public double getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}

	public int getAvgPay() {
		return avgPay;
	}

	public void setAvgPay(int avgPay) {
		this.avgPay = avgPay;
	}
	
	
	
}
