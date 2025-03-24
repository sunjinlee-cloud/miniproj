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
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO) session.getAttribute("UsersDTO");
		
		String memNum = dto.getMemNum();
		String memType = dto.getMemType();
		String petName = request.getParameter("petName");
		String petPhoto = "사진을 업로드해주세요";
		String petBreed = request.getParameter("petBreed");
		int petAge =  Integer.parseInt(request.getParameter("petAge"));
		int petWeight = Integer.parseInt(request.getParameter("petWeight"));
		String petGender = request.getParameter("petGender");
		String petIsmain = request.getParameter("petIsmain");
		String petIntro = request.getParameter("petIntro");
		
			
		PetMapper pet = sql.getMapper(PetMapper.class);
		PetDTO petdto = new PetDTO(null, petName, petPhoto, petBreed, petGender,petAge,petWeight,petIsmain,petIntro,memNum);
		int petResult = pet.registerpet(petdto);
		System.out.println("petResult는 : "+petResult);
		
		response.setContentType("application/x-www-form-urlencoded; charset=UTF-8");
		response.getWriter().write(petResult+"");
		

		sql.close();
	}

}
