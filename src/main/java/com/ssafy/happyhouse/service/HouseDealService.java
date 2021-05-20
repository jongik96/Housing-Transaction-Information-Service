package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDealDto;

public interface HouseDealService {
	public List<HouseDealDto> getHouseDeal(String dongcode);
	public List<HouseDealDto> getAptDeal(String apt);
}
