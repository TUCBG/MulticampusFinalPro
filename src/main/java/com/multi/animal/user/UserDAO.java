package com.multi.animal.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO implements UserDAOInterface {

	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int checkId(String userId) {
		return my.selectOne("user.checkid", userId);
	}

	@Override
	public void join(UserVO vo) {
		my.insert("user.insert", vo);
	}

	@Override
	public UserVO one(String userId) {
		return my.selectOne("user.one", userId);
	}

}
