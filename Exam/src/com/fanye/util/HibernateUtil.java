package com.fanye.util;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {

	private static final SessionFactory sessionFactory=buildSessionFactory();
	
	private static SessionFactory buildSessionFactory(){
		Configuration configuration=new Configuration().configure();
		ServiceRegistry serviceRegistry=new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
		return configuration.buildSessionFactory(serviceRegistry);
	}
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	public static void main(String[] args) {
		HibernateUtil.getSessionFactory();
	}
}
