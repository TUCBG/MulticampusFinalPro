package com.multi.animal.missingBoard;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.multi.animal.FilterVO;
import com.multi.animal.PageVO;

public interface MissingBoardServiceInterface {
	public List<MissingBoardVO> list(PageVO vo);

	public List<MissingBoardVO> listNavi(PageVO vo);
	
	public int count();
	
	public int countNavi(PageVO vo);
	
	public MissingBoardVO one(MissingBoardVO vo);
	
	public void insert(MissingBoardVO vo);
	
	public List<MissingBoardVO> filterList(FilterVO vo);
	
	public int filterCount(FilterVO vo);
	
	public void delete(MissingBoardVO vo);
	
	public void modify(MissingBoardVO vo);
	
	public void missingEnd(MissingBoardVO vo);
	
	public List<String> fileProcess(MultipartHttpServletRequest multipartRequest, String CURR_IMAGE_REPO_PATH) throws Exception;
}