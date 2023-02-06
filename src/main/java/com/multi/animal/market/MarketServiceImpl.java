package com.multi.animal.market;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MarketServiceImpl implements MarketService {
	
	@Autowired
	MarketDAO marketDAO;
	
	@Override
	public int numberOfPages(int countOfAllPosts, int pageSize) {
			//numberOfPages( 총 게시물 수,  한 페이지당 최대 게시물 수)
		int numberOfPages = 0;
		if (countOfAllPosts % pageSize == 0) {
			numberOfPages = countOfAllPosts / pageSize;
		} else {
			numberOfPages = countOfAllPosts / pageSize + 1;
		}
		return numberOfPages;
		//총 페이지 수
	}
	
				
	@Override
	public int[] findFirstLast(int pageNumber, int pageSize) {
				// findFirstLast( 페이지번호,    한 페이지당 게시물 수) 
		int[] firstLast = { (pageNumber - 1) * pageSize + 1, pageNumber * pageSize }; 
							// {해당 페이지 첫 게시물 번호, 해당 페이지 마지막 게시물 번호}
		return firstLast;
	}    // 해당 페이지 첫,마지막 게시물 번호

	@Override
	public String getFileName(String originalName) throws Exception {
		// 유니크한 파일이름 생성해주는 메서드
		UUID uid = UUID.randomUUID();

		String fileName = uid.toString() + "_" + originalName;
		// 저장되는 이름 = "랜덤 진짜긴 문자열_원래파일이름"

		return fileName;
	}		// 저장되는 이름
	
	
	@Override
	public int insert(MarketVO marketVO, HttpServletRequest request, MultipartFile file)
			throws Exception {
		Date date = Date.valueOf(LocalDate.now());
		marketVO.setDate(date);

		String savedName = getFileName(file.getOriginalFilename());

		String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploadedImg");
		File target = new File(uploadPath, savedName);
		
//		File target = new File(path, savedName);
//		 받는 경로,랜덤이름-진짜파일이름

		file.transferTo(target);
		// fileData를 target에 저장

		marketVO.setImg(savedName);

		return marketDAO.insert(marketVO);// 이미지파일 포함 데이터 등록
		
	}

	@Override
	public MarketVO one(MarketVO marketVO) {
		return marketDAO.one(marketVO);
	}


	@Override
	public List<MarketVO> searchByCategory(PageVO pageVO) {
		pageVO.setFirstLast(findFirstLast(pageVO.getPageNumber(), pageVO.pageSize)); //해당 페이지 첫,마지막 게시물 번호 구해서 pageVO에 넣기
		return marketDAO.searchByCategory(pageVO);
	}

	@Override
	public int update(MarketVO marketVO, String lastFile, HttpServletRequest request, MultipartFile file) throws Exception {
		Date date = Date.valueOf(LocalDate.now());
		marketVO.setDate(date);
		String savedName = getFileName(file.getOriginalFilename());
		
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploadedImg");
		File target = new File(uploadPath, savedName);
		file.transferTo(target);
		// fileData를 target에 저장
		File targetToDelete = new File(uploadPath, lastFile);
		targetToDelete.delete();
		//업로드했던 파일 지우기

		marketVO.setImg(savedName);
		return marketDAO.update(marketVO);
	}

	@Override
	public int delete(MarketVO marketVO,HttpServletRequest request, String fileToDelete) {
		String uploadPath = request.getSession().getServletContext().getRealPath("resources/uploadedImg");
		File targetToDelete = new File(uploadPath, fileToDelete);
		targetToDelete.delete();
		//업로드했던 파일 지우기
		return marketDAO.delete(marketVO);
		
	}
	
	@Override
	public int countSearchByCategory(PageVO pageVO) {
		return marketDAO.countSearchByCategory(pageVO);
	}
}
