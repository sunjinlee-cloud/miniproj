package com.pet.board.Service;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MainBoardService {

	
	void mainboardGetView(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException;
	void mainboardWrite(HttpServletRequest request, HttpServletResponse response) throws ServerException, IOException;
}
