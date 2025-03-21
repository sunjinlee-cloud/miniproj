package com.pet.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.pet.Service.PetService;
import com.pet.pet.Service.PetServiceImpl;


@WebServlet("*.pet")
public class PetController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    public PetController() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {				
	

		request.setCharacterEncoding("utf-8"); 
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = uri.substring(contextPath.length());
		
		//System.out.println(uri);
		//System.out.println(contextPath);
		System.out.println(command);
		
		PetService service = new PetServiceImpl();
		
		if(command.equals("/users/addPet.pet")) {
			service.registerPet(request, response);
			response.sendRedirect("mypage.jsp");
		} 
		
	}
}
