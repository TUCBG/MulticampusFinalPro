package com.multi.animal.missingBoard;

import java.util.List;

import com.multi.animal.FilterVO;
import com.multi.animal.PageVO;

public interface MissingBoardDAOInterface {

	// 데이터 검색 기능(여러개의 docuemnt)
	public List<MissingBoardVO> list(PageVO vo);

	public int count();
	
	public MissingBoardVO one(MissingBoardVO vo);
	
	public void insert(MissingBoardVO vo);
	
	public List<MissingBoardVO> filterList(FilterVO vo);
	
	public int filterCount(FilterVO vo);
	
	public void delete(MissingBoardVO vo);
	
	public void modify(MissingBoardVO vo);
	
	public void missingEnd(MissingBoardVO vo);
	
	public List<MissingBoardVO> listNavi(PageVO vo);
	
	public int countNavi(PageVO vo);
}
