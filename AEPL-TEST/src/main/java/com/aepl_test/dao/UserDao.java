package com.aepl_test.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Component;

import com.aepl_test.dto.UserRegistration;
@Component
public class UserDao {
	EntityManagerFactory entityManagerFactory=Persistence.createEntityManagerFactory("dev");
	EntityManager entityManager=entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction=entityManager.getTransaction();
	
	public void insert(UserRegistration userRegistration) {
		entityTransaction.begin();
		entityManager.persist(userRegistration);
		entityTransaction.commit();
	}
	
	public String find(long no,UserRegistration registration) {
		UserRegistration userRegistration=entityManager.find(UserRegistration.class, no);
		if(userRegistration!=null) {
			
			return "<h1 style='color:red;'>Failed to Register Because acount already exists with same mobile number</h1>";
		}else {
			insert(registration);
			return "<h1 style='color:green;'>Registration Successfull</h1>";
		}
	}

}
