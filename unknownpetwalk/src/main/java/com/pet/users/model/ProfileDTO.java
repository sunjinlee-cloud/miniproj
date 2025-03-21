package com.pet.users.model;

public class ProfileDTO {
	
	private int count;
	private double avgReviewScore;
	private int avgPay;
	
	public ProfileDTO() {
		
	}

	public ProfileDTO(int count, double avgReviewScore, int avgPay) {
		super();
		this.count = count;
		this.avgReviewScore = avgReviewScore;
		this.avgPay = avgPay;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getAvgReviewScore() {
		return avgReviewScore;
	}

	public void setAvgReviewScore(double avgReviewScore) {
		this.avgReviewScore = avgReviewScore;
	}

	public int getAvgPay() {
		return avgPay;
	}

	public void setAvgPay(int avgPay) {
		this.avgPay = avgPay;
	}

	
	
	
	
	
	
}
