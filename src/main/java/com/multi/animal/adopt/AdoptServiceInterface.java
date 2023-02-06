package com.multi.animal.adopt;

import java.util.List;

public interface AdoptServiceInterface {
	//추상메서드
	int insert(AdoptVO vo);

	int delete(AdoptVO vo);

	List<AdoptPageVO> all(AdoptPageVO vo);

	AdoptVO one(AdoptVO vo);

	int update(AdoptVO vo);

	List<AdoptVO> search2(AdoptPageVO vo);

	int count(AdoptPageVO vo);

	int count2(AdoptPageVO vo);

	int pages(int count);

}