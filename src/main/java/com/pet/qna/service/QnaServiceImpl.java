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
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class QnaServiceImpl implements QnaService {
    private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

    @Override  // 문의글 등록 (Create)
    public void insertQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            
            String qnaTitle = request.getParameter("qnaTitle");
            String qnaContent = request.getParameter("qnaContent");
            
            UsersDTO user = (UsersDTO) request.getSession().getAttribute("UsersDTO");
            String memNum = (user != null) ? user.getMemNum() : null;
            if (memNum == null) {
                
                throw new Exception("로그인이 필요한 서비스 입니다.");
            }

            sql = sqlSessionFactory.openSession(true);
            QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);
           
            QnaDTO dto = new QnaDTO();
            dto.setQnaTitle(qnaTitle);
            dto.setQnaContent(qnaContent);
            dto.setMemNum(memNum);
            int result = qnaMapper.insertQna(dto);

            if (result > 0) {
                System.out.println("QNA 등록 성공!");
            } else {
                System.out.println("QNA 등록 실패!");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "QNA 등록 중 오류 발생: " + e.getMessage());
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 상세보기 (detail)
    public void getQnaDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
            sql = sqlSessionFactory.openSession(true);
            QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);
            QnaDTO dto = qnaMapper.getQnaDetail(qnaNum);
            request.setAttribute("qna", dto);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "QNA 상세보기 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 수정 (Update)
    public void updateQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
            String qnaTitle = request.getParameter("qnaTitle");
            String qnaContent = request.getParameter("qnaContent");

            sql = sqlSessionFactory.openSession(true);
            QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);
            QnaDTO dto = new QnaDTO();
            dto.setQnaNum(qnaNum);
            dto.setQnaTitle(qnaTitle);
            dto.setQnaContent(qnaContent);
            int result = qnaMapper.updateQna(dto);

            if (result > 0) {
                System.out.println("QNA 수정 성공!");
            } else {
                System.out.println("QNA 수정 실패!");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "QNA 수정 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 삭제 (Delete)
    public void deleteQna(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "QNA 삭제 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 목록 조회 (List)
    public void getQnaList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            
            UsersDTO user = (UsersDTO) request.getSession().getAttribute("UsersDTO");
            String memNum = (user != null) ? user.getMemNum() : null;
            sql = sqlSessionFactory.openSession(true);
            QnaMapper qnaMapper = sql.getMapper(QnaMapper.class);
            List<QnaDTO> qnaList = qnaMapper.getQnaList(memNum);
            request.setAttribute("qnaList", qnaList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "QNA 리스트 조회 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }
}