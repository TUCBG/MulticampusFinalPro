package com.multi.animal.medical;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MedicalController {
	@Autowired
	MedicalDAOImpl dao;
	
	@RequestMapping("medical/medicalSearchResult")
	public String search(MedicalVO vo, Model model) {
			List<MedicalVO> list = dao.SearchAll(vo);
			
			if(list.size() > 0) {
				model.addAttribute("list", list);	
				return "medical/medicalSearchResult";
			}else {
				return "medical/medicalNo";
			}
	}
	
	@RequestMapping("medical/medicalAddrResult")
	public String address(MedicalVO vo, Model model) {
			List<MedicalVO> list = dao.LoadAddress(vo);
				model.addAttribute("list", list);	
				return "medical/medicalAddrResult";
	}
	
	@RequestMapping("medical/medicalInfo")
	public String info(MedicalVO vo, Model model) {
			MedicalVO result = dao.SearchOne(vo);
			model.addAttribute("vo", result);
			return "medical/medicalInfo";
	}
}