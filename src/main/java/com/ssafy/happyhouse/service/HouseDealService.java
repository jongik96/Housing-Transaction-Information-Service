package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.BusstopDto;
import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.MarketDto;
import com.ssafy.happyhouse.dto.ParkDto;
import com.ssafy.happyhouse.dto.PoliceDto;
import com.ssafy.happyhouse.dto.SubwayDto;
import com.ssafy.happyhouse.dto.houseInfoDto;
import com.ssafy.util.PageNavigation;

public interface HouseDealService {
	public List<HouseDealDto> getHouseDeal(String dongcode);
	List<HouseDealDto> getHouseDealNo(HouseDealDto house);
	public List<HouseDealDto> getAptDeal(String apt);
	HouseDealDto getHouseInfo(int no); // 선택된 아파트 정보 받기
	List<ParkDto> getParkInfo(HouseDealDto house); // 주변 공원 검색
	List<MarketDto> getMarketInfo(HouseDealDto house); // 주변 상점 검색
	List<BusstopDto> getBusstopInfo(HouseDealDto house);
	List<PoliceDto> getPoliceInfo(HouseDealDto house);
	List<SubwayDto> getSubwayInfo(HouseDealDto house);
	HouseDealDto getHouseDealDetail(int no);
	MarketDto getStoreDetail(String mname);
	SubwayDto getSubwayDetail(String name);
	public List<houseInfoDto> serchHouse(String aptname);
	public List<houseInfoDto> getHouseByRange(AddressDto address);
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
}
