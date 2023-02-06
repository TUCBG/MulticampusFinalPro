package com.multi.animal.user;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

//	@RequestMapping("kakaologin/oauth")
//	public String user() {
//		System.out.println("!!!");
//		return "redirect:index.jsp";
//	}
	
	@Autowired
	private UserServiceInterface us;

	@RequestMapping(value = "kakaologin", method=RequestMethod.GET)
	public String user( @RequestParam(value = "code", required = false) String code ,
			Model model) {
		System.out.println("!!!");
		//코드
		System.out.println("####" + code);
		// 토큰
		String access_Token = us.getAccessToken(code);
		System.out.println("###access_Token### : " + access_Token);
		HashMap<String, Object> userInfo = us.getUserInfo(access_Token);
		System.out.println("###nickname### : " + userInfo.get("nickname"));
		System.out.println("###email### : " + userInfo.get("email"));
		String name = (String) userInfo.get("nickname");
		String userId = (String) userInfo.get("email");
		
		//신규회원인지 기존회원인지 판별
		if(us.checkId(userId) == 0) {
			// 신규회원
			// 회원가입
			model.addAttribute("name", name);
			model.addAttribute("userId", userId);
			return "user/joinkakao";
		} else {
			// 기존회원
			// 로그인
			UserVO vo = us.login(userId);
			model.addAttribute("vo", vo);
		}
		
		return "user/kakaologin";
	}
	
	@RequestMapping("join")
	public String join(UserVO vo, String add1, String add2, Model model) {
		String address = us.sumAddress(add1, add2);
		vo.setAddress(address);
		System.out.println(vo);
		us.join(vo);
		model.addAttribute("vo", vo);
		return "user/joinSuccess";
	}
}
