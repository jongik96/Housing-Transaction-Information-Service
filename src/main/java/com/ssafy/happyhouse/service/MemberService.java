package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.happyhouse.dto.MemberDto;

public interface MemberService {
//	회원가입
	void registerMember(MemberDto memberDto);

//	로그인
	MemberDto login(Map<String, String>map) throws SQLException, Exception;

//	회원정보 수정을 위한 회원의 모든 정보 얻기
	MemberDto getMember(String userId);

//	회원정보 수정
	void modifyMember(MemberDto memberDto);

//	회원탈퇴
	void deleteMember(String userId);
}
