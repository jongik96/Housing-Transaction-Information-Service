package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.dto.PageNavigation;

public interface ArticleService {
//	글작성
	boolean registerArticle(ArticleDto articleDto) throws Exception;
	
//	글목록
	List<ArticleDto> listArticle() throws SQLException;
	
//	글수정을 위한 글얻기
	ArticleDto getArticle(int articleNo) throws SQLException;
	
//	글수정
	boolean modifyArticle(ArticleDto articleDto) throws SQLException;
	
//	글삭제
	boolean deleteArticle(int articleNo) throws SQLException;

	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
