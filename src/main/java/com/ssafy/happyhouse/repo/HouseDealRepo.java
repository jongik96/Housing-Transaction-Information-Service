package com.ssafy.happyhouse.repo;

import java.sql.SQLException;
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

public interface HouseDealRepo {
	List<HouseDealDto> getHouseDeal(String dongcode);
	List<HouseDealDto> getHouseDealNo(HouseDealDto house);
	List<HouseDealDto> getAptDeal(String apt);
	HouseDealDto getHouseInfo(int no); // 선택된 아파트 정보 받기
	HouseDealDto getHouseDealDetail(int no); // 거래상세정보
	MarketDto getStoreDetail(String mname);
	SubwayDto getSubwayDetail(String name);
	List<ParkDto> getParkInfo(HouseDealDto house); // 주변 공원 검색
	List<MarketDto> getMarketInfo(HouseDealDto house); // 주변 상점 검색
	List<BusstopDto> getBusstopInfo(HouseDealDto house); // 주변버정 검색
	List<PoliceDto> getPoliceInfo(HouseDealDto house);  // 주변 경찰서
	List<houseInfoDto> serchHouse(String aptname);  
	List<houseInfoDto> getHouseByRange(AddressDto address);
	List<SubwayDto> getSubwayInfo(HouseDealDto house);   // 주변 쟈철역
	public int getTotalCountHouseDeal(Map<String, String> map) throws SQLException;
}
