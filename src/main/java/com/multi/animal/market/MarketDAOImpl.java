package com.multi.animal.market;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MarketDAOImpl implements MarketDAO {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int insert(MarketVO marketVO) {
		return my.insert("market.insert",marketVO);
	}
	@Override
	public MarketVO one(MarketVO marketVO) {
		return my.selectOne("market.one", marketVO);
	}

	@Override
	public List<MarketVO> searchByCategory(PageVO pageVO) {		
		return my.selectList("market.searchByCategory", pageVO); 
	}
	
	@Override
	public int countSearchByCategory(PageVO pageVO) {
		return my.selectOne("market.countSearchByCategory", pageVO);
	}
	@Override
	public int update(MarketVO marketVO) { 
		return my.update("market.update", marketVO);
	}
	@Override
	public int delete(MarketVO marketVO) { 
		return my.delete("market.delete", marketVO);
	}
}
