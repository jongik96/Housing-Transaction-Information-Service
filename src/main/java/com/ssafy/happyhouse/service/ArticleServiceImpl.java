package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.ArticleDto;
import com.ssafy.happyhouse.dto.PageNavigation;
import com.ssafy.happyhouse.repo.ArticleRepo;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean registerArticle(ArticleDto articleDto) throws Exception {
		if(articleDto.getSubject() == null || articleDto.getContent() == null){
			throw new Exception();
		}
		else 
			return sqlSession.getMapper(ArticleRepo.class).registerArticle(articleDto);
	}

	@Override
	public List<ArticleDto> listArticle() throws SQLException {
		return sqlSession.getMapper(ArticleRepo.class).listArticle();
	}

	@Override
	public ArticleDto getArticle(int articleNo) throws SQLException {
		return sqlSession.getMapper(ArticleRepo.class).getArticle(articleNo);
	}

	@Override
	public boolean modifyArticle(ArticleDto articleDto) throws SQLException {
		return sqlSession.getMapper(ArticleRepo.class).modifyArticle(articleDto);
	}

	@Override
	public boolean deleteArticle(int articleNo) throws SQLException {
		return sqlSession.getMapper(ArticleRepo.class).deleteArticle(articleNo);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlSession.getMapper(ArticleRepo.class).getTotalCount(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

}
