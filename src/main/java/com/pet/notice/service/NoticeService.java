package com.pet.notice.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface NoticeService {
	void insertNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getNoticeDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void updateNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void deleteNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	void getNoticeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}