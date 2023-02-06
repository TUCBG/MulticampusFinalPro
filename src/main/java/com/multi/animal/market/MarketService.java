package com.multi.animal.market;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface MarketService {

	int numberOfPages(int countOfAllPosts, int pageSize);

	int[] findFirstLast(int pageNumber, int pageSize); // 해당 페이지 첫,마지막 게시물 번호

	String getFileName(String originalName) throws Exception; // 저장되는 이름

	int insert(MarketVO marketVO, HttpServletRequest request, MultipartFile file) throws Exception;

	MarketVO one(MarketVO marketVO);

	List<MarketVO> searchByCategory(PageVO pageVO);

	int update(MarketVO marketVO, String lastFile, HttpServletRequest request, MultipartFile file) throws Exception;

	int delete(MarketVO marketVO, HttpServletRequest request, String fileToDelete);

	int countSearchByCategory(PageVO pageVO);

}