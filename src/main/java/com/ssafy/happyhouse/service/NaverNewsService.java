package com.ssafy.happyhouse.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.util.List;

import com.ssafy.happyhouse.dto.NewsDto;

public interface NaverNewsService {
	List<NewsDto> searchNews(String input) throws UnsupportedEncodingException, IOException;
	List<NewsDto> newsMain() throws IOException;
	List<NewsDto> getConn(String apiURL) throws MalformedURLException, IOException;
	
}
