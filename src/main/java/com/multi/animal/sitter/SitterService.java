package com.multi.animal.sitter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.animal.user.UserVO;

@Service
public class SitterService implements SitterServiceInterface {
	@Autowired
	SitterDAOInterface dao;
	
	@Override
	public void insert(SitterVO sittervo) {
		System.out.println(sittervo);
		dao.insert(sittervo);
	}

	@Override
	public List<SitterVO> list(PageVO pvo,SitterVO sittervo, UserVO uservo) {
		System.out.println("<< service >>" + sittervo);
		pvo.setStartEnd(pvo.getPage());
		System.out.println("<< service >> " + pvo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PageVO", pvo);
		map.put("SitterVO", sittervo);
		map.put("UserVO", uservo);
		List<SitterVO> list = dao.list(map);
//		System.out.println(list.get(0));
		return list;
	}

	@Override
	public int count() {
		return dao.count();
	}


	@Override
	public SitterVO one(String sitterId) {
		System.out.println(sitterId);
		SitterVO sittervo = dao.one(sitterId);
		System.out.println(sittervo);
		return sittervo;
	}

	@Override
	public void delete(String sitterId) {
		System.out.println(sitterId);
		dao.delete(sitterId);
		
	}

	@Override
	public void update2(SitterVO vo) {
		System.out.println("<< service >>"+vo);
		dao.update(vo);
	}

	@Override
	public List<SitterVO> filter(FilterVO filtervo, PageVO pagevo, UserVO uservo) {
		pagevo.setStartEnd(pagevo.getPage());
		System.out.println(pagevo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("PageVO", pagevo);
		map.put("FilterVO", filtervo);
		map.put("UserVO", uservo);		
		List<SitterVO> list = dao.filter(map);
//		System.out.println(list.get(0));
		return list;
		
	}

	@Override
	public int searchCount(SitterVO sittervo, UserVO uservo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("SitterVO", sittervo);
		map.put("UserVO", uservo);
		return dao.searchCount(map);
	}

	@Override
	public int filterCount(FilterVO filtervo, UserVO uservo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("FilterVO", filtervo);
		map.put("UserVO", uservo);
		return dao.filterCount(map);
	}

	@Override
	public UserVO getSigunguCode(String searcher) {
		return dao.getSigunguCode(searcher);
	}


}
