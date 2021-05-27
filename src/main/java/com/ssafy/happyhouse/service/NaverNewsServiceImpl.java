package com.ssafy.happyhouse.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.ssafy.happyhouse.dto.NewsDto;

@Service
public class NaverNewsServiceImpl implements NaverNewsService {

	String clientId = "2Hk0MT17sGSYqBBKrd6D";
	String clientSecret = "uhkDHlfAnG";
	
	@Override
	public List<NewsDto> searchNews(String input) throws IOException {
		input = URLEncoder.encode(input, "utf-8");
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + input 
				+ "&display=100&start=1&sort=date";
		
		return getConn(apiURL);
	}

	@Override
	public List<NewsDto> newsMain() throws IOException {
		String input = URLEncoder.encode("부동산", "utf-8");	
		String apiURL = "https://openapi.naver.com/v1/search/news.json?query=" + input 
				+ "&display=5&start=1&sort=date";
		return getConn(apiURL);
	}

	@Override
	public List<NewsDto> getConn(String apiUrl) throws IOException {
		List<NewsDto> list = new ArrayList<NewsDto>();
			URL url = new URL(apiUrl);
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
				return null;
			}
			
		
		if(list.size()<=0) return null;
		return list;
	}

}
