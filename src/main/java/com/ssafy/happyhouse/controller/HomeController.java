package com.ssafy.happyhouse.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.dto.NewsDto;
import com.ssafy.happyhouse.service.NaverNewsService;

@Controller
public class HomeController {
	
	@Autowired
	private NaverNewsService naverNewsService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		try {
			List<NewsDto> list = naverNewsService.newsMain();
			model.addAttribute("newslist", list);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "index";
	}
	
	@RequestMapping(value="/mvnotice", method = RequestMethod.GET)
	public String mvnotice(Model model, HttpSession session) {
		try {
			return "notice_vue";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "페이지 이동중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value="/mvNews", method = RequestMethod.GET)
	public String mvNews(Model model, HttpSession session) {
		try {
			return "News_vue";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "페이지 이동중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
}
