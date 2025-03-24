package com.pet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.board.Service.MainBoardService;
import com.pet.board.Service.MainBoardServiceImpl;


@WebServlet("*.main")
public class MainBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MainBoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				//한글처리
				request.setCharacterEncoding("utf-8");
				
				String uri = request.getRequestURI();
				String conPath = request.getContextPath();
				String command = uri.substring( conPath.length() );
				
				
				
				System.out.println("요청경로:" + command);
		

				MainBoardService service = new MainBoardServiceImpl();
				HttpSession session = request.getSession();
				
				//로그인 여부 확인
				if(session.getAttribute("UsersDTO")==null) {
					response.sendRedirect("../users/login.jsp");
					return;
				}	

				
				
				if(command.equals("/mainboard/write.main")) {
					
					//해당 페이지로 넘긴다.
					service.mainboardGetView(request, response);
					request.getRequestDispatcher("/mainboard/mainboard_write.jsp").forward(request, response);
					 
				} else if(command.equals("/mainboard/regist.main")) { //글등록
					
					
					service.mainboardWrite(request, response);
					response.sendRedirect("list.main");
				} else if(command.equals("/mainboard/list.main")){// 글 목록
					
					service.mainboardList(request, response);
					request.getRequestDispatcher("/mainboard/mainboard_list.jsp").forward(request, response);
				} else if(command.equals("/mainboard/board.main")) { //글 상세
					
					service.mainboard(request, response);
					request.getRequestDispatcher("/mainboard/mainboard.jsp").forward(request,response);
				} else if(command.equals("/mainboard/boardregist.main")) { //댓글 등록
					
					service.mainboardApply(request, response);
					response.sendRedirect("list.main");
				} else if(command.equals("/mainboard/delete.main")) { //글삭제
					service.mainboardDelete(request, response);
					response.sendRedirect("list.main");
				} else if(command.equals("/mainboard/modify.main")) { //글 수정페이지로
					
					service.mainboardModify(request, response);
					request.getRequestDispatcher("/mainboard/mainboard_modify.jsp").forward(request, response);
				} else if(command.equals("/mainboard/update.main")) { //글 수정
					service.mainboardUpdate(request, response);
					response.sendRedirect("list.main");
				} else if(command.equals("/mainboard/applydelete.main")) { //댓글삭제
					
					service.mainboardApplyDelete(request, response);
					response.sendRedirect("list.main");
				}
			
				
	
	
	
	
	
	}
	
	

}
