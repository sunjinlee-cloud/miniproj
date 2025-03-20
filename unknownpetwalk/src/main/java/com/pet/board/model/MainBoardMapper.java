package com.pet.board.model;

import java.util.List;

import com.pet.pet.model.PetDTO;
import com.pet.users.model.UsersDTO;

public interface MainBoardMapper {

	int write(BoardDTO dto);
	
	//대표 동물정보
	UsersDTO getMemberInfo(String memNum);
	
	PetDTO getPetInfo(String memNum);
	
	//대표가 아닌 동물들의 모든 이름
	List<PetDTO> getPetName(String memNum);
}
