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

        // 요청 경로에 따라 분기
        if (command.equals("/support/qna_list.qna")) {
            qnaService.getQnaList(request, response);

        } else if (command.equals("/support/qna_view.qna")) {
            qnaService.getQnaDetail(request, response);
            request.getRequestDispatcher("/support/support_qna_view.jsp").forward(request, response);

        } else if (command.equals("/support/qna_insertForm.qna")) {
            
            request.getRequestDispatcher("/support/support_qna_write.jsp").forward(request, response);

        } else if (command.equals("/support/qna_insert.qna")) {
            qnaService.insertQna(request, response);
            response.sendRedirect("qna_list.qna");

        } else if (command.equals("/support/qna_update.qna")) {
            qnaService.updateQna(request, response);
            response.sendRedirect("qna_list.qna");

        } else if (command.equals("/support/qna_delete.qna")) {
            qnaService.deleteQna(request, response);
            response.sendRedirect("qna_list.qna");
        }

    }
}