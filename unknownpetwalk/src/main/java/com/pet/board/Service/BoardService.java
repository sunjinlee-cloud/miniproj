package com.pet.board.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BoardService {
	default void register(HttpServletRequest request, HttpServletResponse response) {
	}
	
	
}
