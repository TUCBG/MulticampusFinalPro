package com.multi.animal.adopt;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class AdoptController {

	@Autowired
	AdoptServiceInterface service;
	

	@RequestMapping("adopt/adopt_all")
	public void all(AdoptPageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<AdoptPageVO> list = service.all(vo);
		int count = service.count(vo);
		int pages = service.pages(count);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("pages", pages);
	}

	@RequestMapping("adopt/adopt_one")
	public void one(AdoptVO vo, Model model) {
		AdoptVO one = service.one(vo);
		model.addAttribute("one", one);
	}

	@RequestMapping("adopt/adopt_insert")
	public String insert(AdoptVO vo, HttpServletRequest request, MultipartFile file, Model model, HttpServletResponse response) throws Exception {
		UUID uuid = UUID.randomUUID(); // 파일명 중복 방지
		String savedName = uuid.toString() + "_" + file.getOriginalFilename(); // 랜덤 이름과 본래 파일명으로 파일 저장
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload"); // 경로 설정
		File target = new File(uploadPath + "/" + savedName); // 파일 생성
		if (!target.isDirectory()) { // 경로가 없을 시 생성
			target.mkdir();
		}
		file.transferTo(target);

		//model.addAttribute("savedName", savedName);
		vo.setImg(savedName);
		vo.setDate(new Date());
		if(service.insert(vo) == 1) {
			model.addAttribute("msg", "등록을 성공하였습니다.");
			model.addAttribute("url", "adopt_main.jsp");
		}
		
		return "adopt/redirect";
	}

	@RequestMapping("adopt/adopt_delete")
	public String delete(AdoptVO vo, String deleteFile, Model model) {
		String uploadPath = "/Users/gimgijae/Workspace/springProject1/animal/src/main/webapp/resources/upload";
		File targetDelete = new File(uploadPath, deleteFile);
		targetDelete.delete();
		if(service.delete(vo) == 1) {
			model.addAttribute("msg", "삭제를 성공하였습니다.");
			model.addAttribute("url", "adopt_main.jsp");
		}
		return "adopt/redirect";
	}

	@RequestMapping("adopt/adopt_update")
	public String update(AdoptVO vo, HttpServletRequest request, MultipartFile file, Model model, String deleteFile)
			throws Exception {
		UUID uuid = UUID.randomUUID(); // 파일명 중복 방지
		String savedName = uuid.toString() + "_" + file.getOriginalFilename(); // 랜덤 이름과 본래 파일명으로 파일 저장
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/upload");
		File targetDelete = new File(uploadPath, deleteFile);
		targetDelete.delete();
		File target = new File(uploadPath + "/" + savedName);
		if (!target.isDirectory()) {
			target.mkdir();
		}
		file.transferTo(target);
		vo.setImg(savedName);
		if(service.update(vo) == 1) {
			model.addAttribute("msg", "수정을 성공하였습니다.");
			model.addAttribute("url", "adopt_main.jsp");
		}
		return "adopt/redirect";
	}
	
	
	@RequestMapping("adopt/adopt_search2")
	public String search2(AdoptPageVO vo, Model model) {
		vo.setStartEnd(vo.getPage());
		List<AdoptVO> list = service.search2(vo);
		int count = service.count2(vo);
		int pages = service.pages(count);
		String result = "";
		if (count == 0) {
			model.addAttribute("msg", "검색 결과가 없습니다.");
			model.addAttribute("url", "adopt_main.jsp");
			result = "adopt/redirect";
		}else {
			model.addAttribute("list", list);
			model.addAttribute("count", count);
			model.addAttribute("pages", pages);
			result = "adopt/adopt_search2";
		}
		return result;
	}
	
	
}
