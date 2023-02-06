package com.multi.animal.missingBoard;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.animal.FilterVO;
import com.multi.animal.PageVO;

@Repository
public class MissingBoardDAOImpl implements MissingBoardDAOInterface {

	@Autowired
	SqlSessionTemplate my;

	@Override
	public List<MissingBoardVO> list(PageVO vo) {
		return my.selectList("missingBoard.list", vo);
	}

	@Override
	public int count() {
		return my.selectOne("missingBoard.count");
	}

	@Override
	public MissingBoardVO one(MissingBoardVO vo) {
		return my.selectOne("missingBoard.one", vo);
	}

	@Override
	public void insert(MissingBoardVO vo) {
		vo.setCreateAt(new Date());
		my.insert("missingBoard.insert", vo);
	}

	@Override
	public List<MissingBoardVO> filterList(FilterVO vo) {
		return my.selectList("missingBoard.filterList", vo);
	}

	@Override
	public int filterCount(FilterVO vo) {
		return my.selectOne("missingBoard.filterCount", vo);
	}

	public void delete(MissingBoardVO vo) {
		my.delete("missingBoard.delete", vo);
	}

	public void modify(MissingBoardVO vo) {
		my.update("missingBoard.modify", vo);
	}

	public void missingEnd(MissingBoardVO vo) {
		my.update("missingBoard.missingEnd", vo);
	}

	public List<MissingBoardVO> listNavi(PageVO vo) {
		return my.selectList("missingBoard.listNavi", vo);
	}

	public int countNavi(PageVO vo) {
		return my.selectOne("missingBoard.countNavi", vo);
	}

}
