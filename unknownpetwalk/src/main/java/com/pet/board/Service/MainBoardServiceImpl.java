package com.pet.board.Service;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pet.board.model.BoardDTO;
import com.pet.board.model.MainBoardMapper;
import com.pet.pet.model.PetDTO;
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class MainBoardServiceImpl implements MainBoardService {
	
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

	@Override //글 작성
	public void mainboardWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String pay = request.getParameter("pay");
		String boardAddress = request.getParameter("address");
		
		BoardDTO dto = new BoardDTO();
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper board = sql.getMapper(MainBoardMapper.class);
		
		
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);
		dto.setPay(pay);
		dto.setBoardAddress(boardAddress);
		
		int result = board.write(dto);
		
	}


	@Override 	//글 작성 기본 화면 띄워주기
	public void mainboardGetView(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		//로그인 아이디 세션 조회
		HttpSession session = request.getSession();
		
		String memNum = (String)session.getAttribute("login");
		System.out.println(memNum);
		
//		if(memNum==null) {
//			//로그인시 반환 해주기
//			return;
//		}
	
		
		UsersDTO dto = member.getMemberInfo(memNum);
		
		//mapper로 조회된 petdto가 생성되는지 확인
		if(member.getPetInfo(memNum)!= null) {
			PetDTO pet = member.getPetInfo(memNum);
			System.out.println(pet.getPetNum());
			request.setAttribute("pet", pet);
			
			//M, W 한글변환
			if(pet.getPetGender().equals('M')) {
				pet.setPetGender("남");
			}else {
				pet.setPetGender("여");
			}
			//null일 경우 빈 dto생성
		}else {
			PetDTO pet = new PetDTO();
			System.out.println(pet.getPetNum());
			request.setAttribute("pet", pet);
		}

		
		
		List <PetDTO> petName = member.getPetName(memNum);
		

		System.out.println(dto.getMemAddress());
		request.setAttribute("dto", dto);
		request.setAttribute("petName", petName);
		
	}

}
