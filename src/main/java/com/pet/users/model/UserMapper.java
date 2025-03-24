package com.pet.users.model;

import java.util.ArrayList;
import java.util.Map;

import com.pet.pet.model.PetDTO;

public interface UserMapper {
	
	
	//마이바티스의 매개변수는 기본이 1개임. 여러 개의 매개변수를 전달하려면 dto나 map 타입을 써야 됨
	
	int idDuplicationCheck(String memNum);
	
	int phoneDuplicationCheck(String phone);
	
	int join(UsersDTO dto);
		
	UsersDTO login(UsersDTO dto);
	
	UsersDTO profile1(String memNum);
	ProfileDTO profile2(String memNum);
	
	ArrayList worklist(String memNum); //맡은 건 내역
	ArrayList writelist(String memNum);//글 쓴 내역

	int modify(UsersDTO dto);
	
	int addpet(PetDTO dto);
	
	Integer delete(String memNum);

	int changetype(String memNum);
	
	

}
