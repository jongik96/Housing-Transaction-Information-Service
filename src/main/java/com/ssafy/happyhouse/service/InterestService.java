package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDealDto;

public interface InterestService {
	void registerInterest(String userid, String dong);
	void deleteInterest(String userid, String dong);
	List<HouseDealDto> getInterest(String apt);

}
