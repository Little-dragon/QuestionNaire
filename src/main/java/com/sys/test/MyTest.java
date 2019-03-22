package com.sys.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.sys.entity.Question;
import com.sys.utils.PageUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MyTest {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Test
	public void MyT() {
		Session session = null;
		try {
			session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			System.out.println(Integer.parseInt(session.createSQLQuery("select count(*) from question where question2 = '数学'").uniqueResult().toString()));
//			session.save();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null)
				session.close();
		}
	}
}
