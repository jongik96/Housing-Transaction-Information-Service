package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.BusstopDto;
import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.MarketDto;
import com.ssafy.happyhouse.dto.ParkDto;
import com.ssafy.happyhouse.dto.PoliceDto;
import com.ssafy.happyhouse.dto.houseInfoDto;

public interface HouseDealRepo {
	List<HouseDealDto> getHouseDeal(String dongcode);
	List<HouseDealDto> getAptDeal(String apt);
	HouseDealDto getHouseInfo(int no); // 선택된 아파트 정보 받기
	List<ParkDto> getParkInfo(HouseDealDto house); // 주변 공원 검색
	List<MarketDto> getMarketInfo(HouseDealDto house); // 주변 상점 검색
	List<BusstopDto> getBusstopInfo(HouseDealDto house); // 주변 검색
	List<PoliceDto> getPoliceInfo(HouseDealDto house);
	List<houseInfoDto> serchHouse(String aptname);
	List<houseInfoDto> getHouseByRange(AddressDto address);
}
