package com.ssafy.happyhouse.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
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
	
}
