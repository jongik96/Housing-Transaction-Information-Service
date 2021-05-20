package com.ssafy.happyhouse.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.service.AddressService;

@RestController
@RequestMapping("/address")
@CrossOrigin("*")
public class AddressController {

	
	@Autowired
	private AddressService addressService;
	
	@GetMapping(value = "/si")
	public ResponseEntity<List<AddressDto>> getSiList() {
		List<AddressDto> list = addressService.getSiList();
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);
//			return new ResponseEntity<List<MemberDto>>(HttpStatus.NOT_FOUND);
//			return new ResponseEntity<List<MemberDto>>(HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
	@GetMapping(value = "/gugun/{si}")
	public ResponseEntity<List<AddressDto>> getGugunList(@PathVariable("si") String sicode) {
		List<AddressDto> list = addressService.getGugunList(sicode);
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);
//			return new ResponseEntity<Integer>(cnt, HttpStatus.CREATED);
		} else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
	
	@GetMapping(value = "/dong/{gugun}")
	public ResponseEntity<List<AddressDto>> getDongList(@PathVariable("gugun") String guguncode) {
		List<AddressDto> list = addressService.getDongList(guguncode);
		if(list != null && !list.isEmpty()) {
			return new ResponseEntity<List<AddressDto>>(list, HttpStatus.OK);
//			return new ResponseEntity<Integer>(cnt, HttpStatus.CREATED);
		} else
			return new ResponseEntity(HttpStatus.NO_CONTENT);
	}
}
