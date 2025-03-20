package com.pet.board.Service;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pet.util.mybatis.MybatisUtil;

public class BoardServiceImpl implements BoardService {
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	
}
