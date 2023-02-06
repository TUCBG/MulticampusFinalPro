package com.multi.animal.sitter;

import java.util.List;
import java.util.Map;

import com.multi.animal.user.UserVO;

public interface SitterDAOInterface {

	void insert(SitterVO sittervo);

	List<SitterVO> list(Map<String, Object> map);

	Integer count();

	SitterVO one(String sitterId);

	void delete(String sitterId);

	void update(SitterVO vo);

	List<SitterVO> filter(Map<String, Object> map);

	int searchCount(Map<String, Object> map);

	int filterCount(Map<String, Object> map);

	UserVO getSigunguCode(String userId);

}