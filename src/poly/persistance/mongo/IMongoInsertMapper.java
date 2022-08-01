package poly.persistance.mongo;

import java.util.Map;

public interface IMongoInsertMapper {

	int insertMongoRoutineInfo(Map<String, Object> pMap, String colNm)throws Exception;
	
}
