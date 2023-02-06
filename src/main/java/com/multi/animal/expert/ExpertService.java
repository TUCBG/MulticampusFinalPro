package com.multi.animal.expert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpertService {
	
	@Autowired
	ExpertDAO dao;

	public void insert(ExpertVO vo) {
		dao.insert(vo);
	}

}
