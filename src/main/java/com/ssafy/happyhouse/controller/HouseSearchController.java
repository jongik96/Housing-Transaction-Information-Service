package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.AddressDto;
import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.MarketDto;
import com.ssafy.happyhouse.dto.ParkDto;
import com.ssafy.happyhouse.service.HouseDealService;

@Controller
@RequestMapping("/search")
public class HouseSearchController {
	@Autowired
	private HouseDealService houseDealService;
	
	@RequestMapping(value = "/aptSearch", method = RequestMethod.GET)
	public String aptSearch(@RequestParam("aptname") String aptname, Model model) {
		System.out.println(aptname);
		
		try{
			List<HouseDealDto> list = houseDealService.getAptDeal(aptname);
			model.addAttribute("aptlist", list);
			model.addAttribute("apt", aptname);
			return "apt";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","APT 검색 중 문제 발생");
			return "error/error.jsp";
		}
	}
	@RequestMapping(value = "/searchDong", method ={RequestMethod.GET, RequestMethod.POST})
	public String searchDong(@RequestParam Map<String, String> map, Model model) {
		
		try{
			AddressDto addressDto = new AddressDto();
			List<HouseDealDto> list = houseDealService.getHouseDeal(map.get("dong"));
			model.addAttribute("houselist", list);
			model.addAttribute("dong", map.get("dong"));
			return "apt";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","APT 검색 중 문제 발생");
			return "error/error.jsp";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchMarker", method = RequestMethod.GET,consumes="application/json", produces = "application/json; charset=utf-8")
	public List<HouseDealDto> searchMarker(@RequestParam Map<String, String> map, Model model, HttpServletResponse response) {
		List<HouseDealDto> result=null;
		  if(!map.get("apt").equals(""))//아파트
		    {
		    	 result = houseDealService.getAptDeal(map.get("apt"));
		    }
		    else if(!map.get("dong").equals(""))
		    {
		    	 result = houseDealService.getHouseDeal(map.get("dong"));
		    }
		  return result;
	}
	
	@RequestMapping(value = "/mvdetail/{no}", method = RequestMethod.GET)
	public String mvdetail(@PathVariable("no") int no, Model model, HttpServletRequest response) {
		
		HouseDealDto house = houseDealService.getHouseInfo(no);
		List<ParkDto> parklist = houseDealService.getParkInfo(house);
		List<MarketDto> marketlist = houseDealService.getMarketInfo(house);
		
		model.addAttribute("parklist", parklist);
		model.addAttribute("marketlist", marketlist);
		model.addAttribute("house", house);
		
		return "aptdetail";
	}
	
//	@RequestMapping(value = "")
//	public List<ParkDto> getParkInfo(@RequestParam Map<String,String> map, Model model, HttpServletRequest response){
//		List<ParkDto> result = null;
//		
//		
//		
//		return result;
//	}

}
