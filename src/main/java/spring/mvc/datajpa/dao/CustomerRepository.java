package spring.mvc.datajpa.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.mvc.datajpa.entities.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	
	List<Customer> findByAgeGreaterThan(int age);
}
