package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.MemberService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response) {
		try {
			MemberDto memberDto = memberService.login(map);
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error.jsp";
		}
		return "index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) { 
		session.invalidate();
		return "redirect:/"; 
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(@RequestParam("userid") String userid, Model model,HttpSession session) {
		try{
				memberService.deleteMember(userid);
				session.invalidate();
				return "index";
			}catch(Exception e) {
				e.printStackTrace();
				model.addAttribute("msg","삭제중 문제발생");
				return "error/error.jsp";
			}
	
	}
	
	@RequestMapping(value= "/usermodify", method = RequestMethod.GET)
	public String mvModify() {
		return "usermodify";
	}

	@RequestMapping(value= "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		System.out.println(map.get("userid") + map.get("userpwd") + map.get("username") + map.get("email"));
		MemberDto memberDto = new MemberDto();

		memberDto.setUserid(map.get("userid"));
		memberDto.setUsername(map.get("username"));
		memberDto.setUserpwd(map.get("userpwd"));
		memberDto.setEmail(map.get("email"));

		System.out.println(memberDto);
		System.out.println(memberDto.getUserid());
		try {
			memberService.modifyMember(memberDto);
			session.setAttribute("userinfo", memberDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "멤버 수정 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@RequestMapping(value= "/mvsignup", method = RequestMethod.GET)
	public String mvRegist() {
		return "signup";
	}
	
	@RequestMapping(value= "/regist", method = RequestMethod.POST)
	public String signupMember(@RequestParam Map<String, String> map, Model model, HttpSession session) {
		System.out.println(map.get("userid") + map.get("userpwd") + map.get("username") + map.get("email"));
		MemberDto memberDto = new MemberDto();

		memberDto.setUserid(map.get("userid"));
		memberDto.setUsername(map.get("username"));
		memberDto.setUserpwd(map.get("userpwd"));
		memberDto.setEmail(map.get("email"));

		try {
			memberService.registerMember(memberDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원 가입 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
}
