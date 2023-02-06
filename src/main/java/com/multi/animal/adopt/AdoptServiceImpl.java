package com.multi.animal.adopt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdoptServiceImpl implements AdoptServiceInterface {

	@Autowired
	AdoptDAOInterface dao;

	@Override
	public int insert(AdoptVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(AdoptVO vo) {
		return dao.delete(vo);
	}

	@Override
	public List<AdoptPageVO> all(AdoptPageVO vo) {
		return dao.all(vo);
	}

	@Override
	public AdoptVO one(AdoptVO vo) {
		return dao.one(vo);
	}

	@Override
	public int update(AdoptVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public List<AdoptVO> search2(AdoptPageVO vo) {
		return dao.search2(vo);
	}
	
	@Override
	public int count(AdoptPageVO vo) {
		return dao.count(vo);
	}
	
	@Override
	public int count2(AdoptPageVO vo) {
		return dao.count2(vo);
	}
	
	@Override
	public int pages(int count) {
		int pages = 0;
		if (count % 6 == 0) {
			pages = count / 6;
		} else {
			pages = count / 6 + 1;
		}
		return pages;
	}
}
