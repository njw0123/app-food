package repoistory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import oracle.jdbc.driver.Message;

public class MessagesDAO extends DAO{
	
	public static int createMessage(int id, int stars, String ment) {
		SqlSession session = factory.openSession(true);
		Map<String, Object> obj = new HashMap<>();
		obj.put("id", id);
		obj.put("stars", stars);
		obj.put("ment", ment);
		session.insert("messages.create", obj);
		session.close();
		return 0;
	}
	
	public static List<Message> readMessages(int id) {
		SqlSession session = factory.openSession();
		List<Message> li = session.selectList("messages.readByTarget", id);
		session.close();
		return li;
	}
}