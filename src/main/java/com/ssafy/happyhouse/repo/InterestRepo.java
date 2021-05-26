package com.ssafy.happyhouse.repo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.HouseDealDto;

public interface InterestRepo {
	void registerInterest(@Param("userid") String userid,@Param("no") int no);
	void deleteInterest(@Param("userid") String userid,@Param("no") int no);
	List<AddressDto> getInterest(String userid);
	int getNo(AddressDto addressdto);
}
