package com.pet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.notice.service.NoticeService;
import com.pet.notice.service.NoticeServiceImpl;

@WebServlet("*.notice")
public class NoticeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public NoticeController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String uri = request.getRequestURI();
        String conPath = request.getContextPath();
        String command = uri.substring(conPath.length());
        System.out.println("요청 경로: " + command);

       
        NoticeService noticeService = new NoticeServiceImpl();

        if (command.equals("/support/notice_list.notice")) {
            
            noticeService.getNoticeList(request, response);
            request.getRequestDispatcher("/support/support_notice_list.jsp")
                   .forward(request, response);

        } else if (command.equals("/support/notice_insertForm.notice")) {
            
            request.getRequestDispatcher("/support/support_notice_write.jsp")
                   .forward(request, response);

        } else if (command.equals("/support/notice_insert.notice")) {
            
            noticeService.insertNotice(request, response);
            response.sendRedirect(request.getContextPath() + "/support/notice_list.notice");

        } else if (command.equals("/support/notice_view.notice")) {
            
            noticeService.getNoticeDetail(request, response);
            request.getRequestDispatcher("/support/support_notice_view.jsp")
                   .forward(request, response);

        } else if (command.equals("/support/notice_updateForm.notice")) {
            
            noticeService.getNoticeDetail(request, response);
            request.getRequestDispatcher("/support/support_notice_write.jsp")
                   .forward(request, response);

        } else if (command.equals("/support/notice_update.notice")) {
            
            noticeService.updateNotice(request, response);
            response.sendRedirect(request.getContextPath() + "/support/notice_list.notice");

        } else if (command.equals("/support/notice_delete.notice")) {
            
            noticeService.deleteNotice(request, response);
            response.sendRedirect(request.getContextPath() + "/support/notice_list.notice");
        }

	}
}