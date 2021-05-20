package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.repo.HouseDealRepo;

@Service
public class HouseDealServiceImpl implements HouseDealService {

	private static final Logger logger = LoggerFactory.getLogger(HouseDealServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HouseDealDto> getHouseDeal(String dongcode) {
		return sqlSession.getMapper(HouseDealRepo.class).getHouseDeal(dongcode);
	}

	@Override
	public List<HouseDealDto> getAptDeal(String apt) {
		System.out.println(apt+"service들어옴");
		return sqlSession.getMapper(HouseDealRepo.class).getAptDeal(apt);
	}

}
