package com.ssafy.happyhouse.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ssafy.happyhouse.dto.NewsDto;

@RestController
@CrossOrigin("*")
public class NaverNewsController {
	@RequestMapping(value = "/searchNews/{input}", method = RequestMethod.GET)
	ResponseEntity<List<NewsDto>> searchNews(@PathVariable("input") String input){
		List<NewsDto> list = new ArrayList<NewsDto>();

		try {
			input = URLEncoder.encode(input, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String clientId = "2Hk0MT17sGSYqBBKrd6D";
		String clientSecret = "uhkDHlfAnG";
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + input 
				+ "&display=100&start=1&sort=date";
		
		Map<String,String> requestHeaders = new HashMap<>();
		
		try {
			URL url = new URL(apiURL);
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				
				String data = "";
				StringBuilder responseBody = new StringBuilder();
				while((data = br.readLine()) != null) {
					responseBody.append(data);
				} br.close();
				
				System.out.println(responseBody.toString());
				JsonParser jsonParser = new JsonParser();
				JsonObject obj = (JsonObject) jsonParser.parse(responseBody.toString());
				JsonArray jsonArray = (JsonArray) obj.get("items");
				for(int i = 0; i < jsonArray.size(); i++) {
					JsonObject object = (JsonObject) jsonArray.get(i);
					NewsDto news = new NewsDto();
					news.setTitle(object.get("title").getAsString());
					news.setOriginallink(object.get("originallink").getAsString());
					news.setDescription(object.get("description").getAsString());
					news.setPubDate(object.get("pubDate").getAsString());
					list.add(news);
				}
				
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				br.close();
				return new ResponseEntity(HttpStatus.NO_CONTENT);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		
		if(list.size()<=0) return new ResponseEntity(HttpStatus.NO_CONTENT);
		return new ResponseEntity<List<NewsDto>>(list, HttpStatus.OK);
	}
}
