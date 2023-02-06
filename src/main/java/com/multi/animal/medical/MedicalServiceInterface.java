package com.multi.animal.medical;

import java.util.List;

public interface MedicalServiceInterface {
	List<MedicalVO> SearchAll();
	MedicalVO SearchOne(MedicalVO vo);
}