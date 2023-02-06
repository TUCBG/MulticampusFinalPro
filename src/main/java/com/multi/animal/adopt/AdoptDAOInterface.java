package com.multi.animal.adopt;

import java.util.List;

public interface AdoptDAOInterface {

	List<AdoptPageVO> all(AdoptPageVO vo); //추상메서드

	AdoptVO one(AdoptVO vo);

	int insert(AdoptVO vo);

	int delete(AdoptVO vo);

	int update(AdoptVO vo);

	List<AdoptVO> search2(AdoptPageVO vo);

	int count(AdoptPageVO vo);

	int count2(AdoptPageVO vo);

}