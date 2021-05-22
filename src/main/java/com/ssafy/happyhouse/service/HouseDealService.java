package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.BusstopDto;
import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.MarketDto;
import com.ssafy.happyhouse.dto.ParkDto;
import com.ssafy.happyhouse.dto.PoliceDto;
import com.ssafy.happyhouse.dto.houseInfoDto;

public interface HouseDealService {
	public List<HouseDealDto> getHouseDeal(String dongcode);
	public List<HouseDealDto> getAptDeal(String apt);
	HouseDealDto getHouseInfo(int no); // 선택된 아파트 정보 받기
	List<ParkDto> getParkInfo(HouseDealDto house); // 주변 공원 검색
	List<MarketDto> getMarketInfo(HouseDealDto house); // 주변 상점 검색
	
	List<BusstopDto> getBusstopInfo(HouseDealDto house);
	List<PoliceDto> getPoliceInfo(HouseDealDto house);
	public List<houseInfoDto> serchHouse(String aptname);
	public List<houseInfoDto> getHouseByRange(AddressDto address);
}
