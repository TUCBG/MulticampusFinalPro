package com.multi.animal.user;

public interface UserDAOInterface {

	int checkId(String userId);

	void join(UserVO vo);

	UserVO one(String userId);

}