package com.pet.qna.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface QnaService {
	void insertQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getQnaDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void updateQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void deleteQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getQnaList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}