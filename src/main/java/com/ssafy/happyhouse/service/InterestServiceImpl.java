package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.InterestDto;
import com.ssafy.happyhouse.repo.InterestRepo;

@Service
public class InterestServiceImpl implements InterestService {

private static final Logger logger = LoggerFactory.getLogger(InterestServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void registerInterest(String userid, String dong) {
		sqlSession.getMapper(InterestRepo.class).registerInterest(userid, dong);		
	}

	@Override
	public void deleteInterest(String userid, String dong) {
		sqlSession.getMapper(InterestRepo.class).deleteInterest(userid,dong);
	}

	@Override
	public List<HouseDealDto> getInterest(String userid) {
		return sqlSession.getMapper(InterestRepo.class).getInterest(userid);
	}

}
