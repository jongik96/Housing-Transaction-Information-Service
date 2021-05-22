package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.AddressDto;

public interface AddressService {

	public List<AddressDto> getSiList();
	public List<AddressDto> getGugunList(String sicode);
	public List<AddressDto> getDongList(String guguncode);
	public AddressDto getBaseAddress(AddressDto selected);
}
