package com.ssafy.happyhouse.repo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.dto.HouseDealDto;

public interface InterestRepo {
	void registerInterest(@Param("userid") String userid,@Param("dong") String dong);
	void deleteInterest(@Param("userid") String userid,@Param("dong") String dong);
	List<HouseDealDto> getInterest(String userid);
}
