package com.multi.animal.market;

import java.util.List;

public interface MarketDAO {

	int insert(MarketVO marketVO);

	MarketVO one(MarketVO marketVO);

	List<MarketVO> searchByCategory(PageVO pageVO);

	int countSearchByCategory(PageVO pageVO);

	int update(MarketVO marketVO);

	int delete(MarketVO marketVO);

}