package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.BusstopDto;
import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.MarketDto;
import com.ssafy.happyhouse.dto.ParkDto;
import com.ssafy.happyhouse.dto.PoliceDto;
import com.ssafy.happyhouse.dto.SubwayDto;
import com.ssafy.happyhouse.dto.houseInfoDto;
import com.ssafy.happyhouse.repo.HouseDealRepo;
import com.ssafy.util.PageNavigation;

@Service
public class HouseDealServiceImpl implements HouseDealService {

	private static final Logger logger = LoggerFactory.getLogger(HouseDealServiceImpl.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<HouseDealDto> getHouseDeal(String dongcode) {
		return sqlSession.getMapper(HouseDealRepo.class).getHouseDeal(dongcode);
	}

	@Override
	public List<HouseDealDto> getAptDeal(String apt) {
		System.out.println(apt+"service들어옴");
		return sqlSession.getMapper(HouseDealRepo.class).getAptDeal(apt);
	}

	@Override
	public HouseDealDto getHouseInfo(int no) {
		return sqlSession.getMapper(HouseDealRepo.class).getHouseInfo(no);
	}


	@Override
	public List<ParkDto> getParkInfo(HouseDealDto house) {
		return sqlSession.getMapper(HouseDealRepo.class).getParkInfo(house);
	}

	@Override
	public List<MarketDto> getMarketInfo(HouseDealDto house) {
		return sqlSession.getMapper(HouseDealRepo.class).getMarketInfo(house);
	}


	@Override
	public List<BusstopDto> getBusstopInfo(HouseDealDto house) {
		return sqlSession.getMapper(HouseDealRepo.class).getBusstopInfo(house);
	}

	@Override
	public List<PoliceDto> getPoliceInfo(HouseDealDto house) {
		return sqlSession.getMapper(HouseDealRepo.class).getPoliceInfo(house);
	}

	@Override
	public List<houseInfoDto> serchHouse(String aptname) {
		return sqlSession.getMapper(HouseDealRepo.class).serchHouse(aptname);
	}

	@Override
	public List<houseInfoDto> getHouseByRange(AddressDto address) {
		return sqlSession.getMapper(HouseDealRepo.class).getHouseByRange(address);
	}

	@Override
	public HouseDealDto getHouseDealDetail(int no) {
		return sqlSession.getMapper(HouseDealRepo.class).getHouseDealDetail(no);
	}

	@Override
	public List<SubwayDto> getSubwayInfo(HouseDealDto house) {
		return sqlSession.getMapper(HouseDealRepo.class).getSubwayInfo(house);
	}

	@Override
	public List<HouseDealDto> getHouseDealNo(HouseDealDto house) {
		return sqlSession.getMapper(HouseDealRepo.class).getHouseDealNo(house);
	}

	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws Exception {
		int naviSize = 10;
		int currentPage = Integer.parseInt(map.get("pg"));
		int sizePerPage = Integer.parseInt(map.get("spp"));
		PageNavigation pageNavigation = new PageNavigation();
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = sqlSession.getMapper(HouseDealRepo.class).getTotalCountHouseDeal(map);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public MarketDto getStoreDetail(String mname) {
		return sqlSession.getMapper(HouseDealRepo.class).getStoreDetail(mname);
	}

	@Override
	public SubwayDto getSubwayDetail(String name) {
		return sqlSession.getMapper(HouseDealRepo.class).getSubwayDetail(name);
	}

	
}
