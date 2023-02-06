package com.multi.animal.medical;

import java.util.List;

public interface MedicalDAOInterface {
	public List<MedicalVO> SearchAll(MedicalVO vo);

	MedicalVO SearchOne(MedicalVO vo);

	List<MedicalVO> LoadAddress(MedicalVO vo);
}