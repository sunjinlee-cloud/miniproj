package com.pet.notice.model;

import java.util.List;

public interface NoticeMapper {
	
	NoticeDTO getNoticeDetail(int noticeNum);
	int updateNotice(NoticeDTO dto);
	int deleteNotice(int noticeNum);
	List<NoticeDTO> getNoticeList(String memNum);
	int insertNotice(NoticeDTO dto);

}
