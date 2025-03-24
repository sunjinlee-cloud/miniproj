package com.pet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.users.service.UserServiceImpl;
import com.pet.users.service.UsersService;

//1.url맵핑을 확장자 패턴으로 변경
//@WebServlet("/PetController")
@WebServlet("*.users") //앞에 뭐가오던 .example으로 끝나면 요청을 한다
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
        
    }

	//2.get, post요청을 action으로 하나로 묶음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
	
		//3.요청을 분기
		request.setCharacterEncoding("utf-8"); // 한글 처리 끝!
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring(contextPath.length());
		
		//System.out.println(uri);
		//System.out.println(contextPath);
		System.out.println(command);
		
		UsersService service = new UserServiceImpl();
		
		if(command.equals("/controller/join.example")) {
			System.out.println("회원 정보 수정");
		} else if (command.equals("/users/idCheck.users")) {
			service.idcheck(request, response);
		} else if (command.equals("/users/phoneCheck.users")) {
			service.phonecheck(request, response);
		} else if (command.equals("/users/joinForm.users")) {//회원가입 페이지에서 넘어온 요청
			service.join(request, response);
		} else if (command.equals("/users/loginForm.users")) {//로그인 페이지에서 넘어온 요청
			service.login(request, response);
		} else if (command.equals("/users/profilePage.users")) {//글 상세페이지 아래 지원칸의 프로필을 누르면 넘어오는 페이지
			service.profile(request, response);
			request.getRequestDispatcher("/users/profilepage.jsp").forward(request, response);
		} else if (command.equals("/users/modify.users")) {//회원정보 수정 페이지
			service.modify(request, response);
		} 
//		else if (command.equals("/users/addPet.users")) {
//			service.addpet(request, response);
//		} 
		else if (command.equals("/users/delete.users")) {//회원 탈퇴 페이지
			service.delete(request, response);
		} else if (command.equals("/users/logout.users")) {
			service.logout(request, response);
		} else if (command.equals("/users/changememtype.users")) {
			service.changeMemType(request, response);
		}
		
	}

}
