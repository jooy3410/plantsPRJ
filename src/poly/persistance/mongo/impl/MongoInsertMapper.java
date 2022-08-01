package poly.persistance.mongo.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.client.MongoCollection;

import poly.persistance.mongo.IMongoInsertMapper;
import poly.persistance.mongo.comm.AbstractMongoDBComon;

@Component("MongoInsertMapper")
public class MongoInsertMapper extends AbstractMongoDBComon implements IMongoInsertMapper{

	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MongoTemplate mongodb;

	@Override
	public int insertMongoRoutineInfo(Map<String, Object> pMap, String colNm) throws Exception {
		log.info(this.getClass().getName() + "insertSchedule start");

		int res = 0;

		if (pMap == null) {
			pMap = new HashMap<String, Object>();
		}

		MongoCollection<Document> collection = mongodb.getCollection(colNm);

		collection.insertOne(new Document(pMap));

		res = 1;

		log.info(this.getClass().getName() + "insertSchedule end");

		return res;

	}
	
}
