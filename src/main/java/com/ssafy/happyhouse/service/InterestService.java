package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.HouseDealDto;

public interface InterestService {
	void registerInterest(String userid, int no);
	void deleteInterest(String userid, int no);
	List<AddressDto> getInterest(String apt);
	int getNo(AddressDto addressdto);

}
