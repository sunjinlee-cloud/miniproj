package com.pet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.qna.service.QnaService;
import com.pet.qna.service.QnaServiceImpl;

@WebServlet("*.qna")
public class QnaController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public QnaController() {
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

		// 한글 처리
		request.setCharacterEncoding("utf-8");

		// 요청 경로 파악
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());

		System.out.println("요청 경로: " + command);

		// 서비스 객체 생성
		QnaService qnaService = new QnaServiceImpl();

		// 1. QNA 목록 보기 (첫화면)
		if (command.equals("/support/qna_list.qna")) {
			qnaService.getQnaList(request, response);
			request.getRequestDispatcher("/support/support_qna_list.html").forward(request, response);

			// 2. QNA 글쓰기 페이지 이동
		} else if (command.equals("/support/qna_insertForm.qna")) {
			request.getRequestDispatcher("/support/support_qna_write.html").forward(request, response);

			// 3. QNA 글 등록 (작성 후 저장)
		} else if (command.equals("/support/qna_insert.qna")) {
			qnaService.insertQna(request, response);
			response.sendRedirect("qna_list.qna");

			// 4. QNA 글 상세 보기
		} else if (command.equals("/support/qna_view.qna")) {
			qnaService.getQnaDetail(request, response);
			request.getRequestDispatcher("/support/support_qna_view.html").forward(request, response);

			// 5. QNA 글 수정 (작성 후 저장)
		} else if (command.equals("/support/qna_update.qna")) {
			qnaService.updateQna(request, response);
			response.sendRedirect("qna_list.qna");

			// 6. QNA 글 삭제
		} else if (command.equals("/support/qna_delete.qna")) {
			qnaService.deleteQna(request, response);
			response.sendRedirect("qna_list.qna");
		}

	}
}