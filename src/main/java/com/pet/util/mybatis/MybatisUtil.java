package com.pet.util.mybatis;

import java.io.InputStream;
import java.util.ResourceBundle;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtil { 
	
	//세션 팩토리의 생성과 설정파일의 위치를 지정
	private static SqlSessionFactory sqlSessionFactory;
	
	//클래스가 실행될 당시에 단 한 번만 동작
	static {
		
		try {
			
			String resourcePath = "mybatis/config/mybatis-config.xml";
			
			InputStream inputStream = Resources.getResourceAsStream(resourcePath);
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
			System.out.println("세션 팩토리 생성");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("세션 팩토리 오류");
		}
		
	}

	//getter 
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}












}
