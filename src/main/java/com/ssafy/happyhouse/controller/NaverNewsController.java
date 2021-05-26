package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.NewsDto;
import com.ssafy.happyhouse.service.NaverNewsService;

@RestController
@CrossOrigin("*")
public class NaverNewsController {
	
	@Autowired
	private NaverNewsService naverNewsService;	
	
	@RequestMapping(value = "/searchNews/{input}", method = RequestMethod.GET)
	ResponseEntity<List<NewsDto>> searchNews(@PathVariable("input") String input){
		try {
			List<NewsDto> list = naverNewsService.searchNews(input);
			return new ResponseEntity(list, HttpStatus.OK);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		} catch (IOException e) {
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
	}
}
