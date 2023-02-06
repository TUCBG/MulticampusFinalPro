package com.multi.animal.expert;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ExpertDAO {

	@Autowired
	MongoTemplate mongo;

	public void insert(ExpertVO vo) {
		mongo.insert(vo, "expert");
	}
}
