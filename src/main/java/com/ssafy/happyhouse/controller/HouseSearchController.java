package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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
import com.ssafy.happyhouse.dto.BusstopDto;
import com.ssafy.happyhouse.dto.HouseDealDto;
import com.ssafy.happyhouse.dto.MarketDto;
import com.ssafy.happyhouse.dto.ParkDto;
import com.ssafy.happyhouse.dto.PoliceDto;
import com.ssafy.happyhouse.dto.SchoolDto;
import com.ssafy.happyhouse.dto.SubwayDto;
import com.ssafy.happyhouse.dto.houseInfoDto;
import com.ssafy.happyhouse.service.AddressService;
import com.ssafy.happyhouse.service.HouseDealService;

@Controller
@RequestMapping("/search")
public class HouseSearchController {

	@Autowired
	private HouseDealService houseDealService;
	@Autowired
	private AddressService addressService;

	@RequestMapping(value = "/aptSearch", method = RequestMethod.GET)
	public String aptSearch(@RequestParam("aptname") String aptname, Model model) {
		System.out.println(aptname);

		try{
			List<houseInfoDto> hlist = houseDealService.serchHouse(aptname);
			List<HouseDealDto> list = houseDealService.getAptDeal(aptname);

			if(hlist.size() <=0) hlist = null;
			if(list.size() <=0) list = null;

			model.addAttribute("hlist", hlist);
			model.addAttribute("aptlist", list);
			model.addAttribute("apt", aptname);
			return "serchresult";
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","APT 검색 중 문제 발생");
			return "error/error.jsp";
		}
	}
	
	@RequestMapping(value = "/searchDong", method ={RequestMethod.GET, RequestMethod.POST})
	public String searchDong(@RequestParam Map<String, String> map, Model model) {

		try{
			List<HouseDealDto> list = houseDealService.getHouseDeal(map.get("dong"));
			model.addAttribute("houselist", list);
			model.addAttribute("dong", map.get("dong"));

			AddressDto selected = new AddressDto();
			selected.setCity(map.get("city"));
			System.out.println(selected.getCity());
			selected.setGugun(map.get("gugun"));
			System.out.println(selected.getGugun());
			selected.setDong(map.get("dong"));
			System.out.println(selected.getDong());
			
			AddressDto address = addressService.getBaseAddress(selected);
			model.addAttribute("address", address);
			
			List<houseInfoDto> hlist = houseDealService.getHouseByRange(address);
			
			if(hlist.size()<=0) hlist = null;
			
			model.addAttribute("hlist", hlist);
			
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

	@ResponseBody
	@RequestMapping(value = "/searchMarkerPark/{no}", method = RequestMethod.GET,consumes="application/json", produces = "application/json; charset=utf-8")
	public List<ParkDto> searchMarkerPark(@PathVariable int no, Model model, HttpServletResponse response) {
		List<ParkDto> result = houseDealService.getParkInfo(houseDealService.getHouseInfo(no)); 
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/searchMarkerMarket/{no}", method = RequestMethod.GET,consumes="application/json", produces = "application/json; charset=utf-8")
	public List<MarketDto> searchMarkerMarket(@PathVariable int no, Model model, HttpServletResponse response) {
		List<MarketDto> result = houseDealService.getMarketInfo(houseDealService.getHouseInfo(no)); 
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/searchMarkerBusstop/{no}", method = RequestMethod.GET,consumes="application/json", produces = "application/json; charset=utf-8")
	public List<BusstopDto> searchMarkerBusstop(@PathVariable int no, Model model, HttpServletResponse response) {
		List<BusstopDto> result = houseDealService.getBusstopInfo(houseDealService.getHouseInfo(no)); 
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/searchMarkerpolice/{no}", method = RequestMethod.GET,consumes="application/json", produces = "application/json; charset=utf-8")
	public List<PoliceDto> searchMarkerpolice(@PathVariable int no, Model model, HttpServletResponse response) {
		List<PoliceDto> result = houseDealService.getPoliceInfo(houseDealService.getHouseInfo(no)); 
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/searchMarkersubway/{no}", method = RequestMethod.GET,consumes="application/json", produces = "application/json; charset=utf-8")
	public List<SubwayDto> searchMarkersubway(@PathVariable int no, Model model, HttpServletResponse response) {
		List<SubwayDto> result = houseDealService.getSubwayInfo(houseDealService.getHouseInfo(no)); 
		return result;
	}
	
	@RequestMapping(value = "/mvdetail/{no}", method = RequestMethod.GET)
	public String mvdetail(@PathVariable("no") int no, Model model, HttpServletRequest response) {

		HouseDealDto house = houseDealService.getHouseInfo(no);
		List<ParkDto> parklist = houseDealService.getParkInfo(house);
		List<MarketDto> marketlist = houseDealService.getMarketInfo(house);
		List<BusstopDto> busstoplist = houseDealService.getBusstopInfo(house);
		List<PoliceDto> policelist = houseDealService.getPoliceInfo(house);
		List<SubwayDto> subwaylist = houseDealService.getSubwayInfo(house);

		if(parklist.size() <=0) parklist = null;
		if(marketlist.size() <=0) marketlist = null;
		if(busstoplist.size() <=0) busstoplist = null;
		if(policelist.size() <=0) policelist = null;
		if(subwaylist.size() <=0) policelist = null;

		model.addAttribute("parklist", parklist);
		model.addAttribute("marketlist", marketlist);
		model.addAttribute("busstoplist", busstoplist);
		model.addAttribute("policelist", policelist);
		model.addAttribute("subwaylist", subwaylist);
		for(BusstopDto x : busstoplist) {
			System.out.println(x.getBusstop_name());
		}

		model.addAttribute("house", house);

		return "aptdetail";
	}
	@RequestMapping(value = "/mvdealdetail/{no}", method = RequestMethod.GET)
	public String mvdealdetail(@PathVariable("no") int no, Model model, HttpServletRequest response) {

		HouseDealDto house = houseDealService.getHouseDealDetail(no);
		

		model.addAttribute("house", house);

		return "dealdetail";
	}

}
