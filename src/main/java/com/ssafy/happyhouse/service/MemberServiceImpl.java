package com.ssafy.happyhouse.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.repo.MemberRepo;

@Service
public class MemberServiceImpl implements MemberService {

private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void registerMember(MemberDto memberDto) {
		sqlSession.getMapper(MemberRepo.class).registerMember(memberDto);

	}

	@Override
	public MemberDto login(Map<String, String> map) throws Exception {
		if(map.get("userid") == null || map.get("userpwd") == null)
			return null;
		return sqlSession.getMapper(MemberRepo.class).login(map);
		
	}

	@Override
	public MemberDto getMember(String userId) {
		return sqlSession.getMapper(MemberRepo.class).getMember(userId);
	}

	@Override
	public void modifyMember(MemberDto memberDto) {
		sqlSession.getMapper(MemberRepo.class).modifyMember(memberDto);

	}

	@Override
	public void deleteMember(String userId) {
		sqlSession.getMapper(MemberRepo.class).deleteMember(userId);

	}

}
