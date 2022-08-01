package poly.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.persistance.mongo.IMongoInsertMapper;
import poly.service.IMongoInsertService;

@Service("MongoInsertService")
public class MongoInsertService implements IMongoInsertService{

	
	@Resource(name="MongoInsertMapper")
	private IMongoInsertMapper mongoInsertMapper;
	
	//몽고저장
	@Override
	public int insertMongoRoutineInfo(Map<String, Object> pMap) throws Exception {
		String colNm = "user_routine";
		
		return mongoInsertMapper.insertMongoRoutineInfo(pMap, colNm);
	}
	
	

}
