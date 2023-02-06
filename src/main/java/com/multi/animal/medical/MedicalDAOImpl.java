package com.multi.animal.medical;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MedicalDAOImpl implements MedicalDAOInterface {
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<MedicalVO> SearchAll(MedicalVO vo) {
		return mybatis.selectList("medical.selectAll", vo);
	}
	
	@Override
	public MedicalVO SearchOne(MedicalVO vo) {
		return mybatis.selectOne("medical.selectOne", vo);
	}
	
	@Override
	public List<MedicalVO> LoadAddress(MedicalVO vo) {
		return mybatis.selectList("medical.selectLoad", vo);
	}
}
