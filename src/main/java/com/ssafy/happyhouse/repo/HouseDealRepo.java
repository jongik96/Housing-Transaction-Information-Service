package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDealDto;

public interface HouseDealRepo {
	List<HouseDealDto> getHouseDeal(String dongcode);
	List<HouseDealDto> getAptDeal(String apt);
	
}
