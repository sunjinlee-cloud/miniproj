package com.pet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

			
				
				if(command.equals("/mainboard/write.main")) { //연결할곳에서 요청을 받아서
					
					//해당 페이지로 넘긴다.
					service.mainboardGetView(request, response);
					request.getRequestDispatcher("/mainboard/mainboard_write.jsp").forward(request, response);
					 
				} else if(command.equals("/mainboard/list.main")) { //연결할곳에서 요청을 받아서
					
					
					//해당 페이지로 넘긴다.

					service.mainboardWrite(request, response);
					request.getRequestDispatcher("/mainboard/mainboard_list.html").forward(request, response);
					
				}
	
	
	
	
	
	
	}
	
	

}
