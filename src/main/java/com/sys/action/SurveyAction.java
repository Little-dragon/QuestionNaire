package com.sys.action;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mysql.fabric.xmlrpc.base.Data;
import com.sys.entity.Page;

@Component
public class SurveyAction implements ServletRequestAware{
	
	@Autowired
	private SessionFactory sessionFactory;
	private HttpServletRequest request;
	
	private Page data;

	public String survey() {
		//接收格式为  很有兴趣,有兴趣,*,文科,*
//		String result = request.getParameter("result");
//		HashMap<String , String> resultMap = PageUtil.handle(result);
//		System.out.println(sessionFactory);
//		Question question = new Question();
//		question.setQ1(resultMap.get("q1"));
//		question.setQ2(resultMap.get("q2"));
//		
//		Session session = null;
//		try {
//			session = getSession();
//			Transaction tx = session.beginTransaction();
//			session.save(question);
//			tx.commit();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(session != null)
//				session.close();
//		}
		
		return "index";
	}

	public String show() {
		data = new Page();
		data.setMath("数学");
		data.setChinese("语文");
		data.setEnglish("英语");
		Session session = null;
		try {
			session = getSession();
			Transaction tx = session.beginTransaction();
			data.setVmath(Integer.parseInt(session.createSQLQuery("select count(*) from question where question2 = '" + data.getMath() + "'").uniqueResult().toString()));
			data.setVchinese(Integer.parseInt(session.createSQLQuery("select count(*) from question where question2 = '" + data.getChinese() + "'").uniqueResult().toString()));
			data.setVenglish(Integer.parseInt(session.createSQLQuery("select count(*) from question where question2 = '" + data.getEnglish() + "'").uniqueResult().toString()));
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session != null)
				session.close();
		}
		data.setVmath(20);
		return "show";
	}
	
	public Session getSession() {
		return sessionFactory.openSession();
	}

	public String index() {
		return "index";
	}
	
	public Page getData() {
		return data;
	}

	public void setData(Page data) {
		this.data = data;
	}
	
	//实现接口获得request对象
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
