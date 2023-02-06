package com.multi.animal.sitter;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.multi.animal.user.UserVO;


@Controller
public class SitterController {
	@Autowired
	SitterServiceInterface sitterService;
	
	@Autowired
	PageService page;
	
	@RequestMapping("sitter/sitter_insert")
	public void insert(SitterVO vo, HttpServletRequest request,
					   MultipartFile file, Model model) throws Exception {
		if ( !file.isEmpty() ) {			
			System.out.println(request.getContextPath());
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target); // 받은 file을 target로 옮김.
			System.out.println("img 넣기 전" + vo);
			vo.setImg(savedName);
			System.out.println("img 넣은 후" + vo);
		}
		sitterService.insert(vo);
	}
	
	@RequestMapping("sitter/sitter_search")
	public void list(PageVO pagevo, Model model,SitterVO sittervo, UserVO uservo, String searcher) {
		// 검색자의 시군구 코드 받아오기
		uservo = sitterService.getSigunguCode(searcher);
		System.out.println(uservo);
		
		List<SitterVO> list = sitterService.list(pagevo, sittervo, uservo);
		int count = sitterService.searchCount(sittervo, uservo);
		System.out.println(count);
		int pages = page.pages(count);
		System.out.println(pages);
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("keyword", sittervo);
	}
	
	@RequestMapping("sitter/sitter_one")
	public void one(String sitterId, Model model) {
		System.out.println(sitterId);
		SitterVO sittervo = sitterService.one(sitterId);
		model.addAttribute("vo", sittervo);
	}
	
	@RequestMapping("sitter/sitter_delete")
	public void delete(String sitterId) {
		sitterService.delete(sitterId);
	}

	@RequestMapping("sitter/sitter_update1")
	public void update(String sitterId, Model model) {
		SitterVO sittervo = sitterService.one(sitterId);
		model.addAttribute("vo", sittervo);
	}
	
	@RequestMapping("sitter/sitter_update2")
	public void update2(SitterVO vo, HttpServletRequest request,
			   MultipartFile file, String savedImg) throws Exception {
		if ( !file.isEmpty() ) {			
			System.out.println(request.getContextPath());
			String savedName = file.getOriginalFilename();
			String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
			File target = new File(uploadPath + "/" + savedName);
			file.transferTo(target); // 받은 file을 target로 옮김.
			System.out.println("img 넣기 전" + vo);
			vo.setImg(savedName);
			System.out.println("img 넣은 후" + vo);
		} else {
			vo.setImg(savedImg);
		}
		sitterService.update2(vo);
	}
	
	@RequestMapping("sitter/sitter_filter")
	public void filter(PageVO pagevo, FilterVO filtervo, Model model, UserVO uservo, String searcher) {
		// 검색자의 시군구 코드 받아오기
		uservo = sitterService.getSigunguCode(searcher);
		System.out.println(uservo);
		
		System.out.println(pagevo);
		System.out.println(filtervo);
		List<SitterVO> list = sitterService.filter(filtervo, pagevo, uservo);
//		int count = sitterService.count();
		int count = sitterService.filterCount(filtervo, uservo);
		int pages = page.pages(count);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
		model.addAttribute("keyword", filtervo);
		
	}
	
}
