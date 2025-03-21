package com.pet.pet.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pet.pet.model.PetDTO;
import com.pet.pet.model.PetMapper;
import com.pet.users.model.UserMapper;
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class PetServiceImpl implements PetService {

	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	@Override
	public void registerPet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("들어옴?");
		SqlSession sql = sqlSessionFactory.openSession(true);
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO");
		
		String memNum = dto.getMemNum();
		System.out.println("DTO제대로 가져옴? 유저이메일 :"+memNum);
		String memType = dto.getMemType();
		String petName = request.getParameter("petName");
		System.out.println("파라미터 제대로 받음? petName : "+petName);
		String petPhoto = "사진을 업로드해주세요";
		String petBreed = request.getParameter("petType");
		int petAge =  Integer.parseInt(request.getParameter("petAge"));
		int petWeight = Integer.parseInt(request.getParameter("petWeight"));
		String petGender = request.getParameter("gender");
		String petIsmain = request.getParameter("petIsmain");
		String petIntro = request.getParameter("petIntro");
		
		if (memType == "P") {
			UserMapper user = sql.getMapper(UserMapper.class);
			user.userTypeChange(memNum);
		}
			
		PetMapper pet = sql.getMapper(PetMapper.class);
		PetDTO petdto = new PetDTO(null, petName, petPhoto, petBreed, petGender,petAge,petWeight,petIsmain,petIntro,memNum);
		int petResult = pet.registerpet(petdto);
		System.out.println("petResult는 : "+petResult);
		
		if (petResult == 1) {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('성공적으로 추가되었습니다.')");
			out.println("</script>");
		} else {
			response.setContentType("text/html; charSet=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('오류로 인하여 추가에 실패하였습니다.')");
			out.println("</script>");
		}
		sql.close();
	}

}
