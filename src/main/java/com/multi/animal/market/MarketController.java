package com.multi.animal.market;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MarketController {

	@Autowired
	MarketService marketService;

	@RequestMapping("market/insert")
	public String insert(MarketVO marketVO, HttpServletRequest request, MultipartFile file, Model model)
			throws Exception {

		marketService.insert(marketVO, request, file);
		//System.out.println(marketService.insert(marketVO, request, file));
		return "redirect:/market/marketHome.jsp";
	}

	@RequestMapping("market/one")
	public void one(MarketVO marketVO, Model model) {
		model.addAttribute("marketVO", marketService.one(marketVO));
	}

	@RequestMapping("market/searchByCategory")
	public void searchByCategory(PageVO pageVO, Model model) {
		model.addAttribute("list", marketService.searchByCategory(pageVO));
		model.addAttribute("numberOfPages",
				marketService.numberOfPages(marketService.countSearchByCategory(pageVO), pageVO.pageSize));
		//System.out.println(marketService.countSearchByCategory(pageVO));
	}

	@RequestMapping("market/update")
	public String update(MarketVO marketVO, String lastFile, HttpServletRequest request, MultipartFile file,
			Model model) throws Exception {

		marketService.update(marketVO, lastFile, request, file);
		//System.out.println(marketService.update(marketVO, lastFile, request, file));
		return "redirect:/market/marketHome.jsp";
	}

	@RequestMapping("market/delete")
	public String delete(MarketVO marketVO, HttpServletRequest request, String fileToDelete) {
		marketService.delete(marketVO, request, fileToDelete);
		//System.out.println(marketService.delete(marketVO, request, fileToDelete));
		return "redirect:/market/marketHome.jsp";
	}

}
