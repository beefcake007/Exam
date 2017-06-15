package com.fanye.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.fanye.model.Manager;
import com.fanye.util.HibernateUtil;

public class ManagerDao {

	public Manager login(Manager manager)throws Exception{
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		session.beginTransaction();
		Query query=session.createQuery("from Manager as s where s.userName=:userName and s.password=:password");
		query.setString("userName", manager.getUserName());
		query.setString("password", manager.getPassword());
		Manager resultManager=(Manager)query.uniqueResult();
		session.getTransaction().commit();
		return resultManager;
	}
}
