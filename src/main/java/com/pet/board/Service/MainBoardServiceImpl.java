package com.pet.board.Service;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pet.apply.model.ApplyDTO;
import com.pet.board.model.BoardDTO;
import com.pet.board.model.MainBoardMapper;
import com.pet.pet.model.PetDTO;
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class MainBoardServiceImpl implements MainBoardService {
	
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	//글 작성
	@Override 
	public void mainboardWrite(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		HttpSession session = request.getSession();
		UsersDTO mem = (UsersDTO)session.getAttribute("UsersDTO"); 
		String memNum = mem.getMemNum();
		
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String pay = request.getParameter("pay");
		//주소와 상세주소를 합침
		String boardAddress = request.getParameter("address")+" "+request.getParameter("addressDetail");
		String boardType = request.getParameter("boardType");
		
		

		//petNum의 유무에 따라 null 지정
		String petNum = request.getParameter("petNum").equals("null") ? null : request.getParameter("petNum");
		
		BoardDTO dto = new BoardDTO();
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper board = sql.getMapper(MainBoardMapper.class);
		
		
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);
		dto.setPay(pay);
		dto.setBoardAddress(boardAddress);
		dto.setBoardType(boardType);
		dto.setMemNum(memNum);
		dto.setPetNum(petNum);
		
		int result = board.write(dto);
		
	}

	//글 작성 화면 띄워주기
	@Override 	
	public void mainboardGetView(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		//로그인 아이디 세션 조회
		HttpSession session = request.getSession();
		UsersDTO memNum = (UsersDTO)session.getAttribute("UsersDTO"); 
		
		UsersDTO dto = member.getMemberInfo(memNum.getMemNum());

		List <PetDTO> petName = member.getPetName(memNum.getMemNum());

			
		
		//mapper로 조회된 petdto가 생성되는지 확인
		if(petName != null) {
			for(PetDTO pet : petName) {
			System.out.println(pet.getPetNum());


			//M, W 한글변환
			if(pet.getPetGender()!=null){
				if(pet.getPetGender().equals('M')) {
					pet.setPetGender("남");
				}else {
					pet.setPetGender("여");
				}
			}

			}
			
			request.setAttribute("pet", petName);
			
		}else {//null일 경우 빈 dto생성
			PetDTO pet = new PetDTO();
			System.out.println(pet.getPetNum());
			request.setAttribute("pet", pet);
		}

		


		System.out.println(dto.getMemAddress());
		request.setAttribute("dto", dto);
		request.setAttribute("petName", petName);
		
	}

	@Override
	public void mainboard(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		//글정보 얻는 변수
		String boardNum = request.getParameter("boardNum");
		String petNum = request.getParameter("petNum");
		String memNum = request.getParameter("memNum");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		//글정보 얻기
		BoardDTO board = member.getBoard(boardNum);
		PetDTO pet = member.getBoardPet(petNum);
		UsersDTO mem = member.getBoardUser(memNum);
		
		System.out.println(board.getBoardNum());
		//M, W 한글변환
		if(pet.getPetGender()!=null){
			if(pet.getPetGender().equals('M')) {
				pet.setPetGender("남");
			}else {
				pet.setPetGender("여");
			}
		}
		
		
	    HttpSession session = request.getSession();
		UsersDTO lo = (UsersDTO)session.getAttribute("UsersDTO"); 
		
	    request.setAttribute("lo", lo);
		request.setAttribute("board", board);
		request.setAttribute("pet", pet);
		request.setAttribute("mem", mem);
		
		//댓글 얻기
		ArrayList <ApplyDTO> apply = member.getApply(boardNum);
		request.setAttribute("apply", apply);

	}

	@Override
	public void mainboardList(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		ArrayList<BoardDTO> list = member.getBoardList();

		for(BoardDTO li : list) {
			String petNum = li.getPetNum();
			if(li.getBoardType().equals("U")){
				li.setBoardType("구인중");
			}else {
				li.setBoardType("구직중");
			}
		}

		request.setAttribute("list", list );
	}

	@Override
	public void mainboardApply(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		
		HttpSession session = request.getSession();
		UsersDTO mem = (UsersDTO)session.getAttribute("UsersDTO"); 
		String memNum = mem.getMemNum();
		String applyContent = request.getParameter("applyContent");
		String boardNum = request.getParameter("boardNum");
		
		ApplyDTO dto = new ApplyDTO();
		
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		dto.setApplyContent(applyContent);
		dto.setBoardNum(boardNum);
		dto.setMemNum(memNum);
			
		member.setApply(dto);
	}


	@Override
	public void mainboardApplyDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		String applyNum = request.getParameter("applyNum");
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		member.applyDelete(applyNum);
		
	}
	
	@Override
	public void mainboardDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		// TODO Auto-generated method stub
		String boardNum = request.getParameter("boardNum");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		member.deleteBoard(boardNum);
	}
	
	
	@Override
	public void mainboardModify(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		// TODO Auto-generated method stub
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		String boardNum = request.getParameter("boardNum");
		BoardDTO dto = member.getBoard(boardNum);
		
		request.setAttribute("dto", dto);
	}
	
	public void mainboardUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServerException, IOException {
		// TODO Auto-generated method stub
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		MainBoardMapper member = sql.getMapper(MainBoardMapper.class);
		
		String boardNum = request.getParameter("boardNum");
		String boardTitle = request.getParameter("title");
		String boardContent = request.getParameter("content");
		String pay = request.getParameter("pay");
		BoardDTO dto = new BoardDTO();
		dto.setBoardNum(boardNum);
		dto.setBoardTitle(boardTitle);
		dto.setBoardContent(boardContent);
		dto.setPay(pay);
		
		member.updateBoard(dto);
	}


	
	

}
