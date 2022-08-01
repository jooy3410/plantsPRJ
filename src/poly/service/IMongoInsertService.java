package poly.service;

import java.util.Map;

public interface IMongoInsertService {

	//몽고저장
	public int insertMongoRoutineInfo(Map<String, Object> pMap)throws Exception;
	
	

}
