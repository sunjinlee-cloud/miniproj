package com.pet.qna.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pet.qna.model.QnaDTO;
import com.pet.qna.model.QnaMapper;
import com.pet.util.mybatis.MybatisUtil;

public class QnaServiceImpl implements QnaService {

	//sqlSessionFactory
	private  SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

	@Override
	public void insertQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SqlSession sql = null;

		try {
			String qnaTitle = request.getParameter("qnaTitle");
			String qnaContent = request.getParameter("qnaContent");
			String memNum = request.getParameter("memNum");
			String qnaType = request.getParameter("qnaType");

			System.out.println(qnaTitle);
			System.out.println(qnaContent);
			System.out.println(memNum);
			System.out.println(qnaType);

			sql = sqlSessionFactory.openSession(true);
			QnaMapper qna = sql.getMapper(QnaMapper.class);

			QnaDTO dto = new QnaDTO();
			dto.setQnaTitle(qnaTitle);
			dto.setQnaContent(qnaContent);
			dto.setMemNum(memNum);
			dto.setQnaType(qnaType);

			int result = qna.insertQna(dto);

			if (result > 0) {
				System.out.println("QNA 등록 성공!");
			} else {
				System.out.println("QNA 등록 실패!");
			}

			//response.sendRedirect("support/qna_list.qna");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "QNA 등록 중 오류 발생");
		} finally {
			if (sql != null) sql.close();
		}
	}



	@Override
	public void getQnaDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SqlSession sql = null;

		try {
			int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));

			sql = sqlSessionFactory.openSession(true);
			QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);

			QnaDTO dto = qnaMapper.getQnaDetail(qnaNum);
			request.setAttribute("dto", dto);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "QNA 상세보기 중 오류 발생");
		} finally {
			if (sql != null) sql.close();
		}
	}

	@Override
	public void updateQna(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SqlSession sql = null;

		try {
			int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
			String qnaTitle = request.getParameter("qnaTitle");
			String qnaContent = request.getParameter("qnaContent");
			String qnaType = request.getParameter("qnaType");

			sql = sqlSessionFactory.openSession(true);
			QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);

			QnaDTO dto = new QnaDTO();
			dto.setQnaNum(qnaNum);
			dto.setQnaTitle(qnaTitle);
			dto.setQnaContent(qnaContent);
			dto.setQnaType(qnaType);

			int result = qnaMapper.updateQna(dto);

			if (result > 0) {
				System.out.println("QNA 수정 성공!");
			} else {
				System.out.println("QNA 수정 실패!");
			}

			response.sendRedirect("detail.qna?qnaNum=" + qnaNum);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "QNA 수정 중 오류 발생");
		} finally {
			if (sql != null) sql.close();
		}
	}

	@Override
	public void deleteQna(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SqlSession sql = null;

		try {
			int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));

			sql = sqlSessionFactory.openSession(true);
			QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);

			int result = qnaMapper.deleteQna(qnaNum);

			if (result > 0) {
				System.out.println("QNA 삭제 성공!");
			} else {
				System.out.println("QNA 삭제 실패!");
			}

			response.sendRedirect(request.getContextPath() + "/support/qna_list.qna");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "QNA 삭제 중 오류 발생");
		} finally {
			if (sql != null) sql.close();
		}
	}

	@Override
	public void getQnaList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		SqlSession sql = null;

		try {
			sql = sqlSessionFactory.openSession(true);
			QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);

			List<QnaDTO> qnaList = qnaMapper.getQnaList();
			request.setAttribute("qnaList", qnaList);

			//request.getRequestDispatcher("/support/support_qna_list.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "QNA 리스트 조회 중 오류 발생");
		} finally {
			if (sql != null) sql.close();
		}
	}

}