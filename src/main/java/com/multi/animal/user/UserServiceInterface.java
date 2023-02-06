package com.multi.animal.user;

import java.util.HashMap;

public interface UserServiceInterface {

	String getAccessToken(String authorize_code);

	HashMap<String, Object> getUserInfo(String access_Token);

	int checkId(String userId);

	void join(UserVO vo);

	String sumAddress(String add1, String add2);

	UserVO login(String userId);

}