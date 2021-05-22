package com.ssafy.happyhouse.repo;

import java.util.List;

import com.ssafy.happyhouse.dto.AddressDto;

public interface AddressRepo {
	List<AddressDto> getSiList();
	List<AddressDto> getGugunList(String sicode);
	List<AddressDto> getDongList(String guguncode);
	AddressDto getBaseAddress(AddressDto selected);
}
