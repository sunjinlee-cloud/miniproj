package com.pet.users.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pet.board.model.BoardDTO;
import com.pet.pet.model.PetDTO;
import com.pet.pet.model.PetMapper;
import com.pet.users.model.ProfileDTO;
import com.pet.users.model.UserMapper;
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class UserServiceImpl implements UsersService{
	
	// sqlSessionFactory 객체 생성
		private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
		
		
	@Override
	public void idcheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("id").toLowerCase();
//		System.out.println("받아온 이메일: "+email);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		int result = user.idDuplicationCheck(email);
//		System.out.println("result : "+result);
		
		if (result == 1) {
			response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			response.getWriter().write(result+"");
		} else {
			response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			response.getWriter().write(result+"");
			
		}
		sql.close();
		
	}
	
	@Override
	public void phonecheck(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String phone = request.getParameter("phone");
		System.out.println("받아온 폰번호: "+phone);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		int result = user.phoneDuplicationCheck(phone);
		System.out.println("result : "+result);
		
		if (result == 1) {
			response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			response.getWriter().write(result+"");
		} else {
			response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
			response.getWriter().write(result+"");
			
		}
		sql.close();
		
	}

	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailPrev = request.getParameter("id").toLowerCase();
		String emailNext = request.getParameter("mailDomain").toLowerCase();
		String memNum = emailPrev+"@"+emailNext;
		String memPw = request.getParameter("memPw");
		String memPhoto = "사진을 업로드해주세요";
		String memNick = request.getParameter("memNick");
		String memType = "P";
		String memAddress = request.getParameter("sample6_address");
		//String address2 = request.getParameter("sample6_detailAddress");
		String memPhone = request.getParameter("memPhone");
		String memGender = request.getParameter("gender");	
		//String memAddress = address1+ " "+address2;
		String memIntro = request.getParameter("userIntro");
		if (memIntro == null || memIntro == "") memIntro = "자기소개가 없습니다";
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		UsersDTO dto = new UsersDTO(memNum, memPw, memPhoto, memNick, memType, memAddress, memPhone, memGender, memIntro);

		int result = user.idDuplicationCheck(memNum);
		System.out.println(result);
		
		if (result == 1) {
			//입력한 메일이 중복일 때의 처리 : 사용자에게 이메일 주소가 중복된다는 것을 알려줘야 함.
			request.setAttribute("msg", "이미 가입된 메일주소입니다.");
			request.getRequestDispatcher("join.jsp").forward(request, response);
		} else {
			user.join(dto);
			System.out.println(5);
			response.sendRedirect("login.jsp");
		}
		sql.close();
	}

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNum = request.getParameter("email");
		String memPw = request.getParameter("pw");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		UsersDTO loginDTO = new UsersDTO(memNum, memPw, null, null, null, null, null, null, null);
		UsersDTO dto = user.login(loginDTO);
		
//		Map<String, String> map = new HashMap<>(); 
//		map.put("mem_num", mem_num);
//		map.put("mem_pw", mem_pw);
//		UsersDTO dto = user.login(map);
		
		if (dto == null) {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 확인하세요')");
			out.println("</script>");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
//			request.setAttribute("mem_num", memNum);
			session.setAttribute("UsersDTO", dto);
			response.sendRedirect("/unknownpetwalk/mainboard/list.main");
//			request.getRequestDispatcher("/mainboard/mainboard_list.jsp").forward(request, response);
//			UsersDTO dtoo = (UsersDTO) session.getAttribute("UsersDTO");
//			System.out.println(dtoo.getMemNum());
		}
		sql.close();
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO"); 
		
		String memNum = dto.getMemNum();
		String memPw = request.getParameter("password");
		String memNick = request.getParameter("nickname");
		String memAddress = request.getParameter("sample6_address");
		//String add2 = request.getParameter("sample6_detailAddress");
		//String newAddress=add1+" "+add2;
		String memPhone = request.getParameter("phone");
		String memIntro = request.getParameter("intro");
		
		dto = new UsersDTO(memNum, memPw, null, memNick, null, memAddress, memPhone, null, memIntro);
		
		int userResult = user.modify(dto);

		if (userResult == 1) {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('성공적으로 수정되었습니다.')");
			out.println("location.href='../mainboard/mainboard_list.jsp';");
			out.println("</script>");
		} else {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 중 오류가 발생하였습니다.')");
			out.println("</script>");
			response.sendRedirect("users/mypage.jsp");
		}
		sql.close();

	}
	
	

//	@Override
//	public void addpet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		SqlSession sql = sqlSessionFactory.openSession(true);
//		HttpSession session = request.getSession();
//		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO"); 
//		
//		String memNum = dto.getMemNum();
//		String memType = dto.getMemType();
//		String petName = request.getParameter("petName");
//		String petPhoto = "사진을 업로드해주세요";
//		String petBreed = request.getParameter("petType");
//		int petAge =  Integer.parseInt(request.getParameter("petAge"));
//		int petWeight = Integer.parseInt(request.getParameter("petWeight"));
//		String petGender = request.getParameter("gender");
//		String petIsmain = request.getParameter("petIsmain");
//		String petIntro = request.getParameter("petIntro");
//		
//		if (memType == "P") {
//			UserMapper user = sql.getMapper(UserMapper.class);
//			user.userTypeChange(memNum);
//		}
//			
//		PetMapper pet = sql.getMapper(PetMapper.class);
//		PetDTO petdto = new PetDTO(null, petName, petPhoto, petBreed, petGender,petAge,petWeight,petIsmain,petIntro,memNum);
//		int petResult = pet.registerpet(petdto);
//		
//		if (petResult == 1) {
//			response.setContentType("text/html; charSet=UTF-8;");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('성공적으로 추가되었습니다.')");
//			out.println("</script>");
//		} else {
//			response.setContentType("text/html; charSet=UTF-8;");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('오류로 인하여 추가에 실패하였습니다.')");
//			out.println("</script>");
//		}
//		sql.close();
//	}
//	



	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO");
		String memNum = dto.getMemNum();
		System.out.println("memNum은 "+memNum);
		
		Integer result = user.delete(memNum);
		System.out.println("result는 : "+result);
		if(result == 1) {
			session.removeAttribute("UsersDTO");
			response.sendRedirect("../Introduction.jsp");
		} else {
			response.sendRedirect("users/mypage.jsp");
		}
		
		sql.close();
	}

	@Override
	public void profile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String memNum = (String) request.getAttribute("mem_num");
//		System.out.println("받아온 파라미터 memnum: "+memNum);
		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO");
//		System.out.println("dto: "+dto);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		UsersDTO usersProfileDTO = user.profile1(memNum);
//		System.out.println("여기까지실행 : 1 "+usersProfileDTO.getMemNick());
		ProfileDTO profileDTO = user.profile2(memNum);
//		System.out.println("여기까지실행 : 2 "+profileDTO.getAvgPay());
		

		ArrayList<String> workList = user.worklist(memNum); //맡은 건 내역
		ArrayList<String> writeList = user.writelist(memNum);//글 쓴 내역
//		System.out.println("여기까지실행 : 3 "+workList);
//		for(int i = 0; i<workList.size(); i++) {
//			System.out.println("1번dto: "+workList.get(i));
//		}
//		System.out.println("여기까지실행 : 4 "+writeList);
		
		request.setAttribute("usersProfileDTO", usersProfileDTO);
		request.setAttribute("profileDTO", profileDTO);
		request.setAttribute("workList", workList);
		request.setAttribute("writeList", writeList);
		sql.close();
	}

	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("UsersDTO");
		//response.sendRedirect("unknownpetwalk/introduction.jsp");
		UsersDTO result = (UsersDTO)session.getAttribute("UsersDTO");
		
		if (result == null) {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('정상적으로 로그아웃 되었습니다.')");
			out.println("</script>");
			response.sendRedirect("login.jsp");
		} else {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그아웃 중 오류가 발생하였습니다.')");
			out.println("</script>");
			response.sendRedirect("users/mypage.jsp");
		}
	}


	
//	@Override
//	public void addpet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		SqlSession sql = sqlSessionFactory.openSession(true);
//		HttpSession session = request.getSession();
//		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO"); 
//		
//		String memNum = dto.getMemNum();
//		String memType = dto.getMemType();
//		String petName = request.getParameter("petName");
//		String petPhoto = "사진을 업로드해주세요";
//		String petBreed = request.getParameter("petType");
//		int petAge =  Integer.parseInt(request.getParameter("petAge"));
//		int petWeight = Integer.parseInt(request.getParameter("petWeight"));
//		String petGender = request.getParameter("gender");
//		String petIsmain = request.getParameter("petIsmain");
//		String petIntro = request.getParameter("petIntro");
//		
//		if (memType == "P") {
//			UserMapper user = sql.getMapper(UserMapper.class);
//			user.userTypeChange(memNum);
//		}
//			
//		PetMapper pet = sql.getMapper(PetMapper.class);
//		PetDTO petdto = new PetDTO(null, petName, petPhoto, petBreed, petGender,petAge,petWeight,petIsmain,petIntro,memNum);
//		int petResult = pet.registerpet(petdto);
//		
//		if (petResult == 1) {
//			response.setContentType("text/html; charSet=UTF-8;");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('성공적으로 추가되었습니다.')");
//			out.println("</script>");
//		} else {
//			response.setContentType("text/html; charSet=UTF-8;");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('오류로 인하여 추가에 실패하였습니다.')");
//			out.println("</script>");
//		}
//		sql.close();
//	}

}
