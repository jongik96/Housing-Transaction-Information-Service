package com.ssafy.happyhouse.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.repo.AddressRepo;
@Service
public class AddressServiceImpl implements AddressService {
	
	private static final Logger logger = LoggerFactory.getLogger(AddressServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public List<AddressDto> getSiList() {
		
		return sqlSession.getMapper(AddressRepo.class).getSiList();
	}

	@Override
	public List<AddressDto> getGugunList(String sicode) {
		return sqlSession.getMapper(AddressRepo.class).getGugunList(sicode);
	}

	@Override
	public List<AddressDto> getDongList(String guguncode) {
		return sqlSession.getMapper(AddressRepo.class).getDongList(guguncode);
	}

}
