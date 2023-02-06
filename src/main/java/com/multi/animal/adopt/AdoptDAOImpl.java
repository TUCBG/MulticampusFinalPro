package com.multi.animal.adopt;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdoptDAOImpl implements AdoptDAOInterface {

	@Autowired
	SqlSessionTemplate my;

	@Override
	public List<AdoptPageVO> all(AdoptPageVO vo) {
		return my.selectList("adopt.all", vo);
	}

	@Override
	public AdoptVO one(AdoptVO vo) {
		return my.selectOne("adopt.one", vo);
	}

	@Override
	public int insert(AdoptVO vo) {
		return my.insert("adopt.insert", vo);
	}

	@Override
	public int delete(AdoptVO vo) {
		return my.delete("adopt.delete", vo);
	}

	@Override
	public int update(AdoptVO vo) {
		return my.update("adopt.update", vo);
	}
	
	@Override
	public List<AdoptVO> search2(AdoptPageVO vo) {
		return my.selectList("adopt.search2", vo);
	}
	
	@Override
	public int count(AdoptPageVO vo) {
		return my.selectOne("adopt.count", vo);
	}
	
	@Override
	public int count2(AdoptPageVO vo) {
		return my.selectOne("adopt.count2", vo);
	}
}
