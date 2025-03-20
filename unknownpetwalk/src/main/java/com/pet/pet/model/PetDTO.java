package com.pet.pet.model;

public class PetDTO {

	private String petNum;
	private String petName;
	private String petPhoto;
	private String petBreed;
	private String petGender;
	private int petAge;
	private int petWeight;
	private String petIsmain;
	private String petIntro;
	private String memNum;
	
	public PetDTO() {
		// TODO Auto-generated constructor stub
	}

	public PetDTO(String petNum, String petName, String petPhoto, String petBreed, String petGender, int petAge,
			int petWeight, String petIsmain, String petIntro, String memNum) {
		super();
		this.petNum = petNum;
		this.petName = petName;
		this.petPhoto = petPhoto;
		this.petBreed = petBreed;
		this.petGender = petGender;
		this.petAge = petAge;
		this.petWeight = petWeight;
		this.petIsmain = petIsmain;
		this.petIntro = petIntro;
		this.memNum = memNum;
	}

	public String getPetNum() {
		return petNum;
	}

	public void setPetNum(String petNum) {
		this.petNum = petNum;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public String getPetPhoto() {
		return petPhoto;
	}

	public void setPetPhoto(String petPhoto) {
		this.petPhoto = petPhoto;
	}

	public String getPetBreed() {
		return petBreed;
	}

	public void setPetBreed(String petBreed) {
		this.petBreed = petBreed;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

	public int getPetAge() {
		return petAge;
	}

	public void setPetAge(int petAge) {
		this.petAge = petAge;
	}

	public int getPetWeight() {
		return petWeight;
	}

	public void setPetWeight(int petWeight) {
		this.petWeight = petWeight;
	}

	public String getPetIsmain() {
		return petIsmain;
	}

	public void setPetIsmain(String petIsmain) {
		this.petIsmain = petIsmain;
	}

	public String getPetIntro() {
		return petIntro;
	}

	public void setPetIntro(String petIntro) {
		this.petIntro = petIntro;
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}
	
	
	
}
