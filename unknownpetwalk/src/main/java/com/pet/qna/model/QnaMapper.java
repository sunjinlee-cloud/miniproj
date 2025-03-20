package com.pet.qna.model;

import java.util.List;

public interface QnaMapper {
    int insertQna(QnaDTO dto);
    QnaDTO getQnaDetail(int qnaNum);
    int updateQna(QnaDTO dto);
    int deleteQna(int qnaNum);
    List<QnaDTO> getQnaList();
}