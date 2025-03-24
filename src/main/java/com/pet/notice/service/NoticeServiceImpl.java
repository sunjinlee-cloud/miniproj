package com.pet.notice.service;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.pet.notice.model.NoticeDTO;
import com.pet.notice.model.NoticeMapper;
import com.pet.users.model.UsersDTO;
import com.pet.util.mybatis.MybatisUtil;

public class NoticeServiceImpl implements NoticeService {
    private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();

    @Override  // 문의글 등록 (Create)
    public void insertNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            
            String noticeTitle = request.getParameter("noticeTitle");
            String noticeContent = request.getParameter("noticeContent");
            
            UsersDTO user = (UsersDTO) request.getSession().getAttribute("UsersDTO");
            String memNum = (user != null) ? user.getMemNum() : null;
            if (memNum == null) {
                
                throw new Exception("로그인이 필요한 서비스 입니다.");
            }

            sql = sqlSessionFactory.openSession(true);
            NoticeMapper noticeMapper = sql.getMapper(NoticeMapper.class);
           
            NoticeDTO dto = new NoticeDTO();
            dto.setNoticeTitle(noticeTitle);
            dto.setNoticeContent(noticeContent);
            dto.setMemNum(memNum);
            int result = noticeMapper.insertNotice(dto);

            if (result > 0) {
                System.out.println("notice 등록 성공!");
            } else {
                System.out.println("notice 등록 실패!");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "notice 등록 중 오류 발생: " + e.getMessage());
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 상세보기 (Read detail)
    public void getNoticeDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
            sql = sqlSessionFactory.openSession(true);
            NoticeMapper noticeMapper = sql.getMapper(NoticeMapper.class);
            NoticeDTO dto = noticeMapper.getNoticeDetail(noticeNum);
            request.setAttribute("notice", dto);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "notice 상세보기 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 수정 (Update)
    public void updateNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
            String noticeTitle = request.getParameter("noticeTitle");
            String noticeContent = request.getParameter("noticeContent");

            sql = sqlSessionFactory.openSession(true);
            NoticeMapper noticeMapper = sql.getMapper(NoticeMapper.class);
            NoticeDTO dto = new NoticeDTO();
            dto.setNoticeNum(noticeNum);
            dto.setNoticeTitle(noticeTitle);
            dto.setNoticeContent(noticeContent);
            int result = noticeMapper.updateNotice(dto);

            if (result > 0) {
                System.out.println("notice 수정 성공!");
            } else {
                System.out.println("notice 수정 실패!");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "notice 수정 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 삭제 (Delete)
    public void deleteNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
            sql = sqlSessionFactory.openSession(true);
            NoticeMapper noticeMapper = sql.getMapper(NoticeMapper.class);
            int result = noticeMapper.deleteNotice(noticeNum);

            if (result > 0) {
                System.out.println("notice 삭제 성공!");
            } else {
                System.out.println("notice 삭제 실패!");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "notice 삭제 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }

    @Override  // 문의글 목록 조회 (List by user)
    public void getNoticeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SqlSession sql = null;
        try {
            // Get logged-in user's ID from session
            UsersDTO user = (UsersDTO) request.getSession().getAttribute("UsersDTO");
            String memNum = (user != null) ? user.getMemNum() : null;
            sql = sqlSessionFactory.openSession(true);
            NoticeMapper noticeMapper = sql.getMapper(NoticeMapper.class);
            List<NoticeDTO> noticeList = noticeMapper.getNoticeList(memNum);
            request.setAttribute("noticeList", noticeList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "notice 리스트 조회 중 오류 발생");
        } finally {
            if (sql != null) sql.close();
        }
    }
}