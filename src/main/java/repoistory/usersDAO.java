package repoistory;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;

import data.User;


public class usersDAO extends DAO {

	public static int create(Map map) {
		
		System.out.println(map);
		SqlSession session = factory.openSession(true);
		try {
			return session.insert("users.create", map);						
		} finally {
			session.close();			
		}
	}
	
	public static User findById(String id) {
		SqlSession session = factory.openSession(true);
		try {
			return session.selectOne("users.findById",id);
		} finally {
			session.close();
		}
	}
}
