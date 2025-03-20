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
import com.pet.users.model.ProfileDTO;
import com.pet.users.model.UserMapper;
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class UserServiceImpl implements UsersService{
	
	// sqlSessionFactory 객체 생성
		private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailPrev = request.getParameter("id");
		String emailNext = request.getParameter("mailDomain");
		String memNum = emailPrev+"@"+emailNext;
		String memPw = request.getParameter("memPw");
		String memPhoto = "사진을 업로드해주세요";
		String memNick = request.getParameter("memNick");
		String memType = "P";
		String address1 = request.getParameter("sample6_address");
		String address2 = request.getParameter("sample6_detailAddress");
		String memPhone = request.getParameter("memPhone");
		String memGender = request.getParameter("gender");	
		String memAddress = address1+ " "+address2;
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
			System.out.println("dto가 null임");
			request.setAttribute("msg", "아이디와 비밀번호를 확인하세요");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("UsersDTO", dto);
			response.sendRedirect("../mainboard/mainboard_list.jsp");
			UsersDTO dtoo = (UsersDTO) session.getAttribute("UsersDTO");
			System.out.println(dtoo.getMemNum());
		}
		sql.close();
	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO) session.getAttribute("memNum");
		String memNum = dto.getMemNum();
		
		int result = user.delete(memNum);
		if(result == 1) {
			session.removeAttribute("UsersDTO");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('탈퇴되었습니다.')");
			out.println("location.href='unknownpetwalk/index.jsp';");
			out.println("</script>");
		} else {
			response.sendRedirect("users/mypage.jsp");
		}
		
		sql.close();
	}

	@Override
	public void profile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memNum = request.getParameter("mem_num");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		UserMapper user = sql.getMapper(UserMapper.class);
		UsersDTO usersProfileDTO = user.profile1(memNum);
		ProfileDTO profileDTO = user.profile2(memNum);
		
		ArrayList<BoardDTO> workList = user.worklist(memNum); //맡은 건 내역
		ArrayList<BoardDTO> writeList = user.writelist(memNum);//글 쓴 내역
		
		request.setAttribute("usersProfileDTO", usersProfileDTO);
		request.setAttribute("workList", workList);
		request.setAttribute("writeList", writeList);
		sql.close();
	}
	
	

}
