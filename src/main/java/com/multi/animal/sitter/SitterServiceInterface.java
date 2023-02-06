package com.multi.animal.sitter;

import java.util.List;

import com.multi.animal.user.UserVO;

public interface SitterServiceInterface {

	void insert(SitterVO sittervo);

	List<SitterVO> list(PageVO pvo, SitterVO sittervo, UserVO uservo);

	int count();

	SitterVO one(String sitterId);

	void delete(String sitterId);

	void update2(SitterVO vo);

	List<SitterVO> filter(FilterVO filtervo, PageVO pagevo, UserVO uservo);

	int searchCount(SitterVO sittervo, UserVO uservo);

	int filterCount(FilterVO filtervo, UserVO uservo);

	UserVO getSigunguCode(String searcher);

}