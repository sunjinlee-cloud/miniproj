package com.pet.board.model;

import java.util.ArrayList;
import java.util.List;

import com.pet.apply.model.ApplyDTO;
import com.pet.pet.model.PetDTO;
import com.pet.users.model.UsersDTO;

public interface MainBoardMapper {

	int write(BoardDTO dto);
	
	//유저정보
	UsersDTO getMemberInfo(String memNum);
	
	
	//모든 동물 정보
	List<PetDTO> getPetName(String memNum);
	
	//메인 글 화면
	BoardDTO getBoard(String boardNum);
	PetDTO getBoardPet(String petNum);
	UsersDTO getBoardUser(String memNum);
	
	//댓글보기
	ArrayList <ApplyDTO> getApply(String boardNum);
	
	//댓글 쓰기
	void setApply(ApplyDTO dto);
	
	
	//메인 글 리스트
	ArrayList<BoardDTO> getBoardList();
	ArrayList<PetDTO> getBoardListPet(String petNum);
	
	//메인 글 삭제
	void deleteBoard(String boardNum);
	
	//메인 글 수정
	void updateBoard(BoardDTO dto);
}
