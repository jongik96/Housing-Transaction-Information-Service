package com.ssafy.happyhouse.repo;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.ArticleDto;

public interface ArticleRepo {
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

	public int getTotalCount(Map<String, String> map) throws SQLException;
}
