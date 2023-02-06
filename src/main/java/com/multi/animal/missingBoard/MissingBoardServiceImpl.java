package com.multi.animal.missingBoard;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.multi.animal.FilterVO;
import com.multi.animal.PageVO;

@Service
public class MissingBoardServiceImpl implements MissingBoardServiceInterface {

	@Autowired
	MissingBoardDAOImpl dao;

	@Override
	public List<MissingBoardVO> list(PageVO vo) {
		return dao.list(vo);
	}

	@Override
	public int count() {
		return dao.count();
	}

	public MissingBoardVO one(MissingBoardVO vo) {
		return dao.one(vo);
	}

	public void insert(MissingBoardVO vo) {
		dao.insert(vo);
	}

	public List<MissingBoardVO> filterList(FilterVO vo) {
		return dao.filterList(vo);
	}

	public int filterCount(FilterVO vo) {
		return dao.filterCount(vo);
	}

	public void delete(MissingBoardVO vo) {
		dao.delete(vo);
	}

	public void modify(MissingBoardVO vo) {
		dao.modify(vo);
	}

	public void missingEnd(MissingBoardVO vo) {
		dao.missingEnd(vo);
	}
	
	public List<String> fileProcess(MultipartHttpServletRequest multipartRequest, String CURR_IMAGE_REPO_PATH) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(CURR_IMAGE_REPO_PATH + "/" + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdir()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "/" + originalFileName));
			}
		}
		return fileList;
	}

	public List<MissingBoardVO> listNavi(PageVO vo) {
		return dao.listNavi(vo);
	}

	public int countNavi(PageVO vo) {
		return dao.countNavi(vo);
	}
}
