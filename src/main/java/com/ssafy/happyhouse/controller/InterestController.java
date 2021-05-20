package com.ssafy.happyhouse.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.service.InterestService;

@Controller
@RequestMapping("/interest")
public class InterestController {

	@Autowired
	private InterestService interestService;
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertInterest(@Param("userid") String userid, @Param("dong") String dong) {
		System.out.println(userid);
		try {
			interestService.registerInterest(userid, dong);
		} catch (Exception e) {
			e.printStackTrace();
			return "error/error.jsp";
		}
		return "index";
	}
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String listPage(@Param("userid") String userid,Model model) {
		try {
			model.addAttribute("interestlist",interestService.getInterest(userid));
		} catch (Exception e) {
			e.printStackTrace();
			return "error/error.jsp";
		}
		return "interestlist";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteInterest(@Param("userid") String userid,@Param("dong") String dong,Model model) {
		try{
				interestService.deleteInterest(userid,dong);
				model.addAttribute("interestlist",interestService.getInterest(userid));
				return "interestlist";
			}catch(Exception e) {
				e.printStackTrace();
				return "error/error.jsp";
			}
	
	}
	

}
